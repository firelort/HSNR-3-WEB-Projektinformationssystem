# coding: utf-8
import os
import cherrypy
from app import application


# --------------------------------------
def main():
    # --------------------------------------
    # Get current directory
    try:
        current_dir = os.path.dirname(os.path.abspath(__file__))
    except:
        current_dir = os.path.dirname(os.path.abspath(sys.executable))
        # disable autoreload and timeout_monitor
        cherrypy.engine.autoreload.unsubscribe()
        cherrypy.engine.timeout_monitor.unsubscribe()
        # Static content config
    static_config = {
        '/app.css': {
            'tools.staticfile.root': current_dir,
            'tools.staticfile.on': True,
            'tools.staticfile.filename': './content/assets/css/app.css',
        },
        '/app.js': {
            'tools.staticfile.root': current_dir,
            'tools.staticfile.on': True,
            'tools.staticfile.filename': './content/assets/js/app.js',
        }
    }
    # Mount static content handler
    root_o = cherrypy.tree.mount(application.Application_cl(current_dir), '/', static_config)
    # suppress traceback-info
    cherrypy.config.update({'request.show_tracebacks': False})
    # Start server
    cherrypy.server.socket_host = '0.0.0.0'
    cherrypy.engine.start()
    cherrypy.engine.block()


# --------------------------------------
if __name__ == '__main__':
    # --------------------------------------
    main()
# EOF
