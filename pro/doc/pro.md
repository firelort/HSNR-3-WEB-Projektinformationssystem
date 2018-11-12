# Projektinformationssytem

## Einleitung
Standpunkt der Dokumentation: 12.11.2018

Die Gruppe bestand aus den Teilnehmern Robert Hartings und Christopher Ionescu

## Beschreibung Lösung
### Aufgabe der Anwendung
Die Anwendung soll eine Projektverwaltungssoftware im Webbrowser zur Verfügung stellen. Damit eine sinnvolle Verwaltung von Projektinformationen möglich ist, gibt es auch eine Kunden- und eine Mitarbeiterverwaltung. In der Anwendung können neue Kunden, Mitarbeiter und Projekte angelegt, verwaltet und gelöscht werden. Dem Projekt muss ein Kunde zugewiesen werden. Ein Projekt kann ohne oder mit Mitarbeiern erstellet/gespeichert werden.

### Fachliche Funktion
Die Anwendung dient einer einfachen Projekt-, Kunden- und Mitarbeiteradministration. Ein Projekt kann einem Kunden zugeordnet und diesem können mehrer beteiligte Mitarbeiter sowie deren Arbeitsstunden pro Woche zugewiesen werden.

## Beschreibung Server

### `__init.py__`
Kennzeichnet ein Verzeichnis als Python-Package

### `application.py`

Die `Application.py` behandelt die HTTP Anfragen und delegiert die Aufgaben an die Datenbank- und die Viewklasse.
Bei Anfragen an bestimmte Pfade wird zwischen GET und POST Request unterschieden, um entweder bei GET die Seite anzuzeigen oder bei POST die Daten zu aktualisieren (bearbeiten/hinzuzufügen). Die Application.py ist in die 4 Klassen ApplicationCl, EditCl, AddCl und DeleteCl gegliedert. Die ApplicationCl kümmert sich um die Weitergabe an EditCl, falls der Auruf an der ersten Stelle ein `edit/` enthält , AddCl, falls der Auruf an der ersten Stelle ein `add/` enthält, DeleteCl, falls der Auruf an der ersten Stelle ein `delete/` enthält, oder stellt sonst selber die angeforderten Seiten dar. Diese 4 Klassen greifen auf die `database.py` zu um Daten von der Datenbank zu erhalten oder Daten an diese zu senden. Ebenfalls greifen diese vier auf die `view.py` zu, um die jeweiligen Seiten mit den entsprechenden Daten anzuzeigen.

Die Klassen AddCL, EditCl und DeleteCl sind in den jeweiligen (add.py, delete.py, edit.py) python Dateien.


### `view.py`
Erstellt die Ansichten mit mako template und füllt/rendert diese mit den von der `Application.py` erhalten Daten.

`View.py` erhält die Daten, welche dargestellt werden sollen, von der `application.py`.

Folgende internen Funktionen werden genutzt:


1. `create_p(template_sql, data_sql)` -> Stellt die Sichten für Kunden und Mitarbeiter mit den gegeben (auch keinen) Informationen dar. `template_sql` ist der relative Pfad zur gewünschten View. `data_sql` sind die jeweiligen darzustellenden Daten.
2. `create_pro(template_sql, data_opl, customer_opl, employee_opl)` -> Stellt die Sicht für die Projekte mit den gegebenen (auch keinen) Informationen dar. `template_sql` ist der relative Pfad mit der Ergänzung `/project`. `data_opl` sind die Projektdaten, `customer_opl` sind die Kundendaten und `employee_opl` sind die Mitarbeiterdaten.

Folgende Funktion werden zur Verfügung gesellt:


1. `create_index()` -> Erstellt die Index Seite
2. `create_customer_list(data)` -> Erstellt die Übersicht über alle Kunden
3. `create_customer_view(data)` -> Erstellt die Anzeige eines Kunden
4. `create_customer_edit(data)` -> Erstellt die Anzeige von der Bearbeitungsseite von einem Kunden
5. `create_customer_add()` -> Erstellt die Anzeige für die Erstellung von einem Kunden
6. `create_employee_list(data)` -> Erstellt die Übersicht über alle Mitarbeiter
7. `create_employee_view(data)` -> Erstellt die Anzeige von einem Mitarbeiter
8. `create_employee_edit(data)` -> Erstellt die Anzeige von der Bearbeitungsseite von einem Mitarbeiter
9. `create_employee_add()` -> Erstellt die Anzeige für die Erstellung von einem Kunden
10. `create_project_list(data, customer, employee)` -> Erstellt die Übersicht über alle Projekte
11. `create_project_view(data, customer, employee)` -> Erstellt die Anzeige von einem Projekt
12. `create_project_edit(data, customer, employee)` -> Erstellt die Anzeige von der Bearbeitungsseite eines Projekts
13. `create_project_add(customer, employee)` -> Erstellt die Anzeige für die Erstellung eines Projekts

### `database.py`
Die Database Python Datei stellt die Schnittstelle zwischen Application und Dateien (Datenbank) dar. Die Schnittstelle lädt / speichert die Daten in die jeweiligen JSON Dateien.
Die Datei ist in die Funktionen `write_to_json_file,` um die Daten zu speichern, und `read_from_json_file`, um die Daten aus der Datei zu lesen, untergliedert. Des Weiteren  stellt diese die Funktionen zur Verfügung, um Daten von einem oder allen Kunden/Mitarbeitern/Projekten zu bekommen. Auch stellt die Datenbank Klasse Methoden zum Hinzufügen / Löschen oder Ändern von Daten zur Verfügung. Die Daten werden entweder an die `Application_cl` übergeben oder sie erhält Daten von dieser.

Folgende Funktionen werden zur Verfügung gestellt:


1. `get_customers()` -> Liefert die Daten aller Kunden zurück
2. `get_customer_by_id(id)` -> Liefert die Daten des Kunden mit der entsprechenden ID zurück
3. `add_customer(name, number, contact, address, email, phn)` -> Erstellt einen neuen Kunden mit den gegebenen Daten
4. `update_customer(id, name, number, contact, address, email, phn)` -> Editiert den Kunden, welche durch die ID spezifiziert wird, mit den gegebenen Daten
5. `delete_customer(id)` -> Löscht den Kunden aus der Datenbank
6. `get_employees()` -> Liefert die Daten aller Mitarbeiter zurück
7. `get_employees_for_project()` -> Liefert die Daten alle Mitarbeiter nach Name, Vorname sortiert zurück.
8. `get_employee_by_id(id)` -> Liefert die Daten des Mitarbeiters mit der entsprechenden ID zurück.
9. `add_employee(lastname, firstname, address, email, role)` -> Erstellt einen neuen Mitarbeiter mit den gegebenen Daten
10. `update_employee(id, lastname, firstname, address, email, role)` -> Editiert den Mitarbeiter, welcher durch die ID spezifiziert wird, mit den gegebenen Daten
11. `delete_employee(id)` -> Löscht den Mitarbeiter aus der Datenbank
12. `get_projects()` -> Liefert die Daten aller Projekte sortiered nach Projekttitel zurück.
13. `get_project_by_id(id)` -> Lieft die Daten des Projekt, mit der angegebnen ID, zurück.
14. `update_project(id, number, title, desc, date, budget, customer, employee)` -> Editiert das Projekt, mit der gegebnen ID, mit den gegebenen Daten
15. `add_project(number, title, desc, date, budget, customer, employee)` -> Erstellt ein neues Projekt mit den angegebenen Daten
16. `delete_project(id)` -> Löscht das Projekt aus der Datenbank

### `server.py`
Startet den Server und bindet die Klasse `Application_cl` als Root Verzeichnis mit statischem Content ein.

## Datenablage
Die Daten werden in JSON Dateien abgelegt. Die Kundendaten werden in der Datei `customer.json`, die Mitarbeiterdaten werden in der Datei `employee.json` und die Projektdaten werden in der Datei `project.json` abgelegt. Die Daten werden als Dictionary im Eintrag `data` gespeichert. Der Eintrag `data` ist ein Array und beinhaltet eine Anzahl von Dictionaries. Jedes dieser Dictionaries beinhaltet die Daten pro Kunden/Mitarbeiter/Projekt.
