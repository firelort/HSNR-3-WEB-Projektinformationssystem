import cherrypy
from .view import ViewCl
from .database import DatabaseCl

class AddCl(object):
    def __init__(self, current_dir):
        self.current_dir = current_dir
        self.view = ViewCl(current_dir)
        self.db = DatabaseCl(current_dir)

    @cherrypy.expose
    def customer(self, name=None, number=None, address=None, email=None, phn=None, contact=None):
        if cherrypy.request.method == "POST":
            if number is None or address is None or email is None or phn is None or contact is None:
                raise cherrypy.HTTPError(400, "Not all required inputs are available")
            id = self.db.add_customer(name, number, contact, address, email, phn)
            if id != 0:
                raise cherrypy.HTTPRedirect("/customer/?id=%s" % id)
            else:
                raise cherrypy.HTTPError(500, "Internal Server Error. Couldn't save your changes. Please try again later")
        else:
            return self.view.create_customer_add()

    @cherrypy.expose
    def project(self, number=None, title=None, desc=None, date=None, budget=None, customer=None, **args):
        if cherrypy.request.method == "POST":
            if number is None or title is None or desc is None or date is None or budget is None or customer is None:
                raise cherrypy.HTTPError(400, "Not all required inputs are available")
            id = self.db.add_project(number, title, desc, date, budget, customer, args)
            if id != 0:
                raise cherrypy.HTTPRedirect("/project/?id=%s" % id)
            else:
                raise cherrypy.HTTPError(500, "Internal Server Error. Couldn't save your changes. Please try again later")
        else:
            return self.view.create_project_add(self.db.get_customers(), self.db.get_employees_for_project())

    @cherrypy.expose
    def employee(self, lastname=None, firstname=None, address=None, email=None, role=None):
        if cherrypy.request.method == "POST":
            if lastname is None or firstname is None or address is None or email is None or role is None:
                raise cherrypy.HTTPError(400, "Not all required inputs are available")
            id = self.db.add_employee(lastname, firstname, address, email, role)
            if id != 0:
                raise cherrypy.HTTPRedirect("/employee/?id=%s" % id)
            else:
                raise cherrypy.HTTPError(500, "Internal Server Error. Couldn't save your changes. Please try again later")
        else:
            return self.view.create_employee_add()