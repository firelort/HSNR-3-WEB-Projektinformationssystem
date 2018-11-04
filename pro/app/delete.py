import cherrypy
from .view import ViewCl
from .database import DatabaseCl

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
            raise cherrypy.HTTPError(418, "This is a post request only")

    @cherrypy.expose
    def project(self, id):
        if cherrypy.request.method == "POST":
            self.db.delete_project(id)
            raise cherrypy.HTTPRedirect("/project")
        else:
            raise cherrypy.HTTPError(418, "This is a post request only")

    @cherrypy.expose
    def employee(self, id):
        if cherrypy.request.method == "POST":
            self.db.delete_employee(id)
            raise cherrypy.HTTPRedirect("/employee")
        else:
            raise cherrypy.HTTPError(418, "This is a post request only")