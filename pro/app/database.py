# coding: utf-8
import json
import os.path


class DatabaseCl(object):
    def __init__(self, path):
        self.path_s = os.path.join(path, "data")

    def is_number(self, s):
        try:
            int(s)
            return True
        except ValueError:
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

    def delete_customer(self, id):
        dictionary = self.read_from_json_file('customer.json')
        result = {"data": []}
        for entry in dictionary['data']:
            if entry['id'] != int(id):
                result['data'].append(entry)
        self.write_to_json_file('customer.json', result)

    #-------- Employee
    def get_employees(self):
        return self.read_from_json_file('employee.json')['data']

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

    def delete_employee(self, id):
        dictionary = self.read_from_json_file('employee.json')
        result = {"data": []}
        for entry in dictionary['data']:
            if entry['id'] != int(id):
                result['data'].append(entry)
        self.write_to_json_file('employee.json', result)
# EOF