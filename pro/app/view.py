# coding: utf-8

import os.path
from mako.template import Template
from mako.lookup import TemplateLookup

class ViewCl(object):
    def __init__(self, path_spl):
        self.path_s = os.path.join(path_spl, "template")
        self.lookup_o = TemplateLookup(directories=self.path_s)
        
    def create_p(self, template_sql, data_opl):
        template_o = self.lookup_o.get_template(template_sql)
        markup_s = template_o.render(data_o = data_opl)
        return markup_s

    #------------ Index View
    def create_index(self):
        return self.create_p('index.tpl', None)

    #------------ Customer Views
    def create_customer_list(self, data_opl):
        return self.create_p(os.path.join('customer','dashboard.tpl'), data_opl)
    
    def create_customer_view(self, data_opl):
        return self.create_p(os.path.join('customer','view.tpl'), data_opl)

    def create_customer_edit(self, data_opl):
        return self.create_p(os.path.join('customer','edit.tpl'), data_opl)

    def create_customer_add(self):
        return self.create_p(os.path.join('customer','add.tpl'), None)

    #------------ Project Views
    def create_project_list(self, data_opl):
        return self.create_p(os.path.join('project','dashboard.tpl'), data_opl)
    
    def create_project_view(self, data_opl):
        return self.create_p(os.path.join('project','view.tpl'), data_opl)

    #------------ Staff Views
    def create_employee_list(self, data_opl):
        return self.create_p(os.path.join('employee','dashboard.tpl'), data_opl)
    
    def create_employee_view(self, data_opl):
        return self.create_p(os.path.join('employee','view.tpl'), data_opl)

    def create_employee_edit(self, data_opl):
        return self.create_p(os.path.join('employee','edit.tpl'), data_opl)

    def create_employee_add(self):
        return self.create_p(os.path.join('employee','add.tpl'), None)
#EOF