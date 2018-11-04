# coding: utf-8
import cherrypy
from .view import ViewCl
from .database import DatabaseCl
from .add import AddCl
from .delete import DeleteCl
from .edit import EditCl


# --------------------------------------
class ApplicationCl(object):
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
                raise cherrypy.HTTPError(404, "There is no customer with the given information. Please try again.")
            else:
                return self.view.create_customer_view(self.db.get_customer_by_id(id))

    @cherrypy.expose
    def employee(self, id=None):
        if id is None:
            return self.view.create_employee_list(self.db.get_employees())
        else:
            if self.db.get_employee_by_id(id) is None:
                raise cherrypy.HTTPError(404, "There is no employee with the given information. Please try again")
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
                raise cherrypy.HTTPError(404, "There is no project with the given information. Please try again")
            else:
                return self.view.create_project_view(self.db.get_project_by_id(id), self.db.get_customers(),
                                                     self.db.get_employees_for_project())

    @cherrypy.expose
    def default(self, *arglist, **kwargs):
        msg_s = "Unbekannte Anforderung: " + \
                str(arglist) + \
                '' + \
                str(kwargs)
        raise cherrypy.HTTPError(404, msg_s)
# EOF