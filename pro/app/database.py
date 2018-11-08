# coding: utf-8
import json
import os.path
import operator

class DatabaseCl(object):
    def __init__(self, path):
        self.path_s = os.path.join(path, "data")

    def is_number(self, s):
        try:
            int(s)
            return True
        except:
            return False

    def read_from_json_file(self, file):
        myfile = os.path.join(self.path_s, file)
        if os.path.isfile(myfile):
            with open(myfile, 'r', encoding='utf8') as f:
                return json.load(f)
        else:
            data = {"data": []}
            with open(myfile, 'w') as f:
                json.dump(data, f)
            return data

    def write_to_json_file(self, file, dict):
        myfile = os.path.join(self.path_s, file)
        with open(myfile, 'w', encoding='utf8') as f:
            json.dump(dict, f, ensure_ascii=False)

    def get_max_id(self, file):
        dictionary = self.read_from_json_file(file)['data']
        if len(dictionary) is 0:
            return 0
        return dictionary[-1]['id']

    def get_by_id(self, file, id):
        if not self.is_number(id):
            return None

        jsonFile = self.read_from_json_file(file)

        for entry in jsonFile['data']:
            if int(id) is entry['id']:
                return entry
        return None

    #------- Customer
    def get_customers(self):
        return self.read_from_json_file('customer.json')['data']

    def get_customer_by_id(self, id):
        return self.get_by_id('customer.json', id)

    def update_customer(self, id, name, number, contact, address, email, phn):
        dictionary = self.read_from_json_file('customer.json')

        for entry in dictionary['data']:
            if entry['id'] == int(id):
                entry['name'] = name
                entry['number'] = int(number)
                entry['contact'] = contact
                entry['address'] = address
                entry['email'] = email
                entry['phn'] = phn
                self.write_to_json_file('customer.json', dictionary)
                return True
        return False

    def add_customer(self, name, number, contact, address, email, phn):
        dictionary = self.read_from_json_file('customer.json')
        id = int(self.get_max_id('customer.json') + 1)
        dictionary['data'].append({
            "id": int(id),
            "number": int(number),
            "name": name,
            "contact": contact,
            "address": address,
            "phn": phn,
            "email": email
        })
        self.write_to_json_file('customer.json', dictionary)
        return id

    def delete_customer(self, ids):
        dictionary = self.read_from_json_file('customer.json')
        dictionary_project = self.read_from_json_file('project.json')
        for id in ids:
            if self.is_number(id):
                for entry in dictionary_project['data']:
                    if entry['customer'] == int(id):
                        self.delete_project(entry['id'])
                result = {"data": []}
                for entry in dictionary['data']:
                    if entry['id'] != int(id):
                        result['data'].append(entry)
                dictionary = result
        self.write_to_json_file('customer.json', dictionary)

    #-------- Employee
    def get_employees(self):
        return self.read_from_json_file('employee.json')['data']

    def get_employees_for_project(self):
        halfsorted = sorted(self.read_from_json_file('employee.json')['data'], key=lambda k: k['firstname'])
        return sorted(halfsorted, key=lambda k: k['lastname'])

    def get_employee_by_id(self, id):
        return self.get_by_id('employee.json', id)

    def update_employee(self, id, lastname, firstname, address, email, role):
        dictionary = self.read_from_json_file('employee.json')

        for entry in dictionary['data']:
            if entry['id'] == int(id):
                entry['lastname'] = lastname
                entry['firstname'] = firstname
                entry['address'] = address
                entry['email'] = email
                entry['role'] = role
                self.write_to_json_file('employee.json', dictionary)
                return True
        return False

    def add_employee(self, lastname, firstname, address, email, role):
        dictionary = self.read_from_json_file('employee.json')
        id = int(self.get_max_id('employee.json') + 1)
        dictionary['data'].append({
            "id": int(id),
            "lastname": lastname,
            "firstname": firstname,
            "address": address,
            "email": email,
            "role": role
        })
        self.write_to_json_file('employee.json', dictionary)
        return id

    def delete_employee(self, ids):
        dictionary = self.read_from_json_file('employee.json')
        dictionary_project = self.read_from_json_file('project.json')
        for id in ids:
            if self.is_number(id):
                for packet in dictionary_project['data']:
                    pro_result = []
                    for entry in packet['employee']:
                        if entry['id'] != int(id):
                            pro_result.append(entry)
                    packet['employee'] = pro_result
                result = {"data": []}
                for entry in dictionary['data']:
                    if entry['id'] != int(id):
                        result['data'].append(entry)
                dictionary = result
        self.write_to_json_file('project.json', dictionary_project)
        self.write_to_json_file('employee.json', dictionary)

    #-------- Projects
    def get_projetcs(self):
        return sorted(self.read_from_json_file('project.json')['data'], key=lambda k: k['title'])

    def get_project_by_id(self,id):
        return self.get_by_id('project.json',id)

    def update_project(self, id, number, title, desc, date, budget, customer, employee):
        dictionary = self.read_from_json_file('project.json')
        data = []
        for entry in employee:
            time = employee[entry]
            if float(time) <= 0:
                continue
            uid = entry[3:]
            data.append({
                "id": int(uid),
                "time": time
            })
        for entry in dictionary['data']:
            if entry['id'] == int(id):
                entry['number'] = int(number)
                entry['title'] = title
                entry['desc'] = desc
                entry['date'] = date
                entry['budget'] = budget
                entry['customer'] = int(customer)
                entry['employee'] = data
                self.write_to_json_file('project.json', dictionary)
                return True
        return False

    def add_project(self, number, title, desc, date, budget, customer, employee):
        dictionary = self.read_from_json_file('project.json')
        id = int(self.get_max_id('project.json') + 1)
        data = []
        for entry in employee:
            time = employee[entry]
            if float(time) <= 0:
                continue
            uid = entry[3:]
            data.append({
                "id": int(uid),
                "time": time
            })
        dictionary['data'].append({
            "id": int(id),
            "number": int(number),
            "title": title,
            "desc": desc,
            "date": date,
            "budget": budget,
            "customer": int(customer),
            "employee": data
        })
        self.write_to_json_file('project.json', dictionary)
        return id

    def delete_project(self, ids):
        dictionary = self.read_from_json_file('project.json')
        if self.is_number(ids):
            id = ids
            ids = [id]
        for id in ids:
            if self.is_number(id):
                result = {"data": []}
                for entry in dictionary['data']:
                    if entry['id'] != int(id):
                        result['data'].append(entry)
                dictionary = result
        self.write_to_json_file('project.json', result)
# EOF