import cherrypy
from .view import ViewCl
from .database import DatabaseCl

class EditCl(object):
    def __init__(self, current_dir):
        self.current_dir = current_dir
        self.view = ViewCl(current_dir)
        self.db = DatabaseCl(current_dir)

    @cherrypy.expose
    def customer(self, id, name=None, number=None, address=None, email=None, phn=None, contact=None):
        if self.db.get_customer_by_id(id) is None:
            raise cherrypy.HTTPError(404, "There is no customer with the given information. Please try again")
        else:
            if cherrypy.request.method == "POST":
                if number is None or address is None or email is None or phn is None or contact is None:
                    raise cherrypy.HTTPError(400, "Not all required inputs are available")
                not_failed = self.db.update_customer(id, name, number, contact, address, email, phn)
                if not_failed:
                    raise cherrypy.HTTPRedirect("/customer/?id=%s" % id)
                else:
                    raise cherrypy.HTTPError(500,
                                      "Internal Server Error. Couldn't save your changes. Please try again later")
            else:
                return self.view.create_customer_edit(self.db.get_customer_by_id(id))

    @cherrypy.expose
    def employee(self, id, lastname=None, firstname=None, address=None, email=None, role=None):
        if self.db.get_employee_by_id(id) is None:
            raise cherrypy.HTTPError(404, "There is no employee with the given information. Please try again")
        else:
            if cherrypy.request.method == "POST":
                if lastname is None or firstname is None or email is None or address is None or role is None:
                    raise cherrypy.HTTPError(400, "Not all required inputs are available")
                not_failed = self.db.update_employee(id, lastname, firstname, address, email, role)
                if not_failed:
                    raise cherrypy.HTTPRedirect("/employee/?id=%s" % id)
                else:
                    raise cherrypy.HTTPError(500,
                                      "Internal Server Error. Couldn't save your changes. Please try again later")
            else:
                return self.view.create_employee_edit(self.db.get_employee_by_id(id))

    @cherrypy.expose
    def project(self, id = None, number=None, title=None, desc=None, date=None, budget=None, customer=None, **args):
        if id is None or self.db.get_project_by_id(id) is None:
            raise cherrypy.HTTPError(404, "There is no project with the given information. Please try again")
        else:
            if cherrypy.request.method == "POST":
                if number is None or title is None or desc is None or date is None or budget is None or customer is None:
                    raise cherrypy.HTTPError(400, "Not all required inputs are available")
                not_failed = self.db.update_project(id, number, title, desc, date, budget, customer, args)
                if not_failed:
                    raise cherrypy.HTTPRedirect("/project/?id=%s" % id)
                else:
                    raise cherrypy.HTTPError(500, "Internal Server Error. Couldn't save your changes. Please try again later")
            else:
                return self.view.create_project_edit(self.db.get_project_by_id(id), self.db.get_customers(), self.db.get_employees_for_project())