import cherrypy
from .view import ViewCl
from .database import DatabaseCl


class DeleteCl(object):
    def __init__(self, current_dir):
        self.current_dir = current_dir
        self.view = ViewCl(current_dir)
        self.db = DatabaseCl(current_dir)

    @cherrypy.expose
    def customer(self, ids):
        if cherrypy.request.method == "POST":
            id_list = []
            for id in ids:
                id_list.append(id)
            self.db.delete_customer(id_list)
            raise cherrypy.HTTPRedirect("/customer")
        else:
            raise cherrypy.HTTPError(418, "This is a post request only")

    @cherrypy.expose
    def project(self, ids):
        if cherrypy.request.method == "POST":
            id_list = []
            for id in ids:
                id_list.append(id)
            self.db.delete_project(id_list)
            raise cherrypy.HTTPRedirect("/project")
        else:
            raise cherrypy.HTTPError(418, "This is a post request only")

    @cherrypy.expose
    def employee(self, ids):
        if cherrypy.request.method == "POST":
            id_list = []
            for id in ids:
                id_list.append(id)
            self.db.delete_employee(id_list)
            raise cherrypy.HTTPRedirect("/employee")
        else:
            raise cherrypy.HTTPError(418, "This is a post request only")
# EOF