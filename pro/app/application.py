# coding: utf-8
import cherrypy
from .view import ViewCl
from .database import DatabaseCl


# --------------------------------------
class Application_cl(object):
    # --------------------------------------
    def __init__(self, current_dir):
        self.current_dir = current_dir
        self.add = AddCl(current_dir)
        self.edit = EditCl(current_dir)
        self.delete = DeleteCl(current_dir)
        self.view = ViewCl(current_dir)
        self.db = DatabaseCl(current_dir)

    @cherrypy.expose
    def index(self):
        return self.view.create_index()

    @cherrypy.expose
    def customer(self, id=None):
        if id is None:
            return self.view.create_customer_list(self.db.get_customers())
        else:
            if self.db.get_customer_by_id(id) is None:
                raise HTTPCodeCl(404, "There is no customer with the given information. Please try again.")
            else:
                return self.view.create_customer_view(self.db.get_customer_by_id(id))

    @cherrypy.expose
    def employee(self, id=None):
        if id is None:
            return self.view.create_employee_list(self.db.get_employees())
        else:
            if self.db.get_employee_by_id(id) is None:
                raise HTTPCodeCl(404, "There is no employee with the given information. Please try again")
            else:
                return self.view.create_employee_view(self.db.get_employee_by_id(id))

    # --------------------------------------
    @cherrypy.expose
    def project(self, id=None):
        if id is None:
            return self.view.create_project_list(self.db.get_projetcs(), self.db.get_customers(),
                                                 self.db.get_employees())
        else:
            if self.db.get_project_by_id(id) is None:
                raise HTTPCodeCl(404, "There is no project with the given information. Please try again")
            else:
                return self.view.create_project_view(self.db.get_project_by_id(id), self.db.get_customers(),
                                                     self.db.get_employees())

    @cherrypy.expose
    def default(self, *arglist, **kwargs):
        msg_s = "Unbekannte Anforderung: " + \
                str(arglist) + \
                '' + \
                str(kwargs)
        return HTTPCodeCl(404, msg_s)


class AddCl(object):
    def __init__(self, current_dir):
        self.current_dir = current_dir
        self.view = ViewCl(current_dir)
        self.db = DatabaseCl(current_dir)

    @cherrypy.expose
    def customer(self, name=None, number=None, address=None, email=None, phn=None, contact=None):
        if cherrypy.request.method == "POST":
            if number is None or address is None or email is None or phn is None or contact is None:
                return HTTPCodeCl(400, "Not all required inputs are available")
            id = self.db.add_customer(name, number, contact, address, email, phn)
            if id != 0:
                raise cherrypy.HTTPRedirect("/customer/?id=%s" % id)
            else:
                return HTTPCodeCl(500, "Internal Server Error. Couldn't save your changes. Please try again later")
        else:
            return self.view.create_customer_add()

    @cherrypy.expose
    def project(self, number=None, title=None, desc=None, date=None, budget=None, customer=None, **args):
        if cherrypy.request.method == "POST":
            if number is None or title is None or desc is None or date is None or budget is None or customer is None:
                return HTTPCodeCl(400, "Not all required inputs are available")
            id = self.db.add_project(number, title, desc, date, budget, customer, args)
            if id != 0:
                raise cherrypy.HTTPRedirect("/project/?id=%s" % id)
            else:
                return HTTPCodeCl(500, "Internal Server Error. Couldn't save your changes. Please try again later")
        else:
            return self.view.create_project_add(self.db.get_customers(), self.db.get_employees())

    @cherrypy.expose
    def employee(self, lastname=None, firstname=None, address=None, email=None, role=None):
        if cherrypy.request.method == "POST":
            if lastname is None or firstname is None or address is None or email is None or role is None:
                return HTTPCodeCl(400, "Not all required inputs are available")
            id = self.db.add_employee(lastname, firstname, address, email, role)
            if id != 0:
                raise cherrypy.HTTPRedirect("/employee/?id=%s" % id)
            else:
                return HTTPCodeCl(500, "Internal Server Error. Couldn't save your changes. Please try again later")
        else:
            return self.view.create_employee_add()

    @cherrypy.expose
    def default(self, *arglist, **kwargs):
        msg_s = "Add-unbekannte Anforderung: " + \
                str(arglist) + \
                '' + \
                str(kwargs)
        return HTTPCodeCl(404, msg_s)


class EditCl(object):
    def __init__(self, current_dir):
        self.current_dir = current_dir
        self.view = ViewCl(current_dir)
        self.db = DatabaseCl(current_dir)

    @cherrypy.expose
    def customer(self, id, name=None, number=None, address=None, email=None, phn=None, contact=None):
        if self.db.get_customer_by_id(id) is None:
            return HTTPCodeCl(404, "There is no customer with the given information. Please try again")
        else:
            if cherrypy.request.method == "POST":
                if number is None or address is None or email is None or phn is None or contact is None:
                    return HTTPCodeCl(400, "Not all required inputs are available")
                not_failed = self.db.update_customer(id, name, number, contact, address, email, phn)
                if not_failed:
                    raise cherrypy.HTTPRedirect("/customer/?id=%s" % id)
                else:
                    return HTTPCodeCl(500,
                                      "Internal Server Error. Couldn't save your changes. Please try again later")
            else:
                return self.view.create_customer_edit(self.db.get_customer_by_id(id))

    @cherrypy.expose
    def employee(self, id, lastname=None, firstname=None, address=None, email=None, role=None):
        if self.db.get_employee_by_id(id) is None:
            return HTTPCodeCl(404, "There is no employee with the given information. Please try again")
        else:
            if cherrypy.request.method == "POST":
                if lastname is None or firstname is None or email is None or address is None or role is None:
                    return HTTPCodeCl(400, "Not all required inputs are available")
                not_failed = self.db.update_employee(id, lastname, firstname, address, email, role)
                if not_failed:
                    raise cherrypy.HTTPRedirect("/employee/?id=%s" % id)
                else:
                    return HTTPCodeCl(500,
                                      "Internal Server Error. Couldn't save your changes. Please try again later")
            else:
                return self.view.create_employee_edit(self.db.get_employee_by_id(id))

    @cherrypy.expose
    def project(self, id = None, number=None, title=None, desc=None, date=None, budget=None, customer=None, **args):
        if id is None or self.db.get_project_by_id(id) is None:
            return HTTPCodeCl(404, "There is no project with the given information. Please try again")
        else:
            if cherrypy.request.method == "POST":
                if number is None or title is None or desc is None or date is None or budget is None or customer is None:
                    return HTTPCodeCl(400, "Not all required inputs are available")
                not_failed = self.db.update_project(id, number, title, desc, date, budget, customer, args)
                if not_failed:
                    raise cherrypy.HTTPRedirect("/project/?id=%s" % id)
                else:
                    return HTTPCodeCl(500, "Internal Server Error. Couldn't save your changes. Please try again later")
            else:
                return self.view.create_project_edit(self.db.get_project_by_id(id), self.db.get_customers(), self.db.get_employees())

    @cherrypy.expose
    def default(self, *arglist, **kwargs):
        msg_s = "Edit-unbekannte Anforderung: " + \
                str(arglist) + \
                '' + \
                str(kwargs)
        return HTTPCodeCl(404, msg_s)


class DeleteCl(object):
    def __init__(self, current_dir):
        self.current_dir = current_dir
        self.view = ViewCl(current_dir)
        self.db = DatabaseCl(current_dir)

    @cherrypy.expose
    def customer(self, id):
        if cherrypy.request.method == "POST":
            self.db.delete_customer(id)
            raise cherrypy.HTTPRedirect("/customer")
        else:
            return HTTPCodeCl(418, "This is a post request only")

    @cherrypy.expose
    def project(self, id):
        if cherrypy.request.method == "POST":
            self.db.delete_project(id)
            raise cherrypy.HTTPRedirect("/project")
        else:
            return HTTPCodeCl(418, "This is a post request only")

    @cherrypy.expose
    def employee(self, id):
        if cherrypy.request.method == "POST":
            self.db.delete_employee(id)
            raise cherrypy.HTTPRedirect("/employee")
        else:
            return HTTPCodeCl(418, "This is a post request only")

    @cherrypy.expose
    def default(self, *arglist, **kwargs):
        msg_s = "Delete-unbekannte Anforderung: " + \
                str(arglist) + \
                '' + \
                str(kwargs)
        return HTTPCodeCl(404, msg_s)


class HTTPCodeCl(object):
    def __init__(self, id, msg=None):
        raise cherrypy.HTTPError(id, msg)
# EOF
