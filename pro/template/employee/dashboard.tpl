## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
    Mitarbeiterübersicht
</%block>


<%block name="content">
    <div class="card">
        <div class="table-head">
            <strong>Mitarbeiterübersicht</strong>
            <div>
                <button class="btn btn-grey" id="view" onclick="buttonView('employee')">Ansehen</button>
                <button class="btn btn-grey" id="edit" onclick="buttonEdit('employee')">Bearbeiten</button>
                <button class="btn btn-red" id="delete" onclick="buttonDelete('employee')">Löschen</button>
                <a class="btn btn-green" href="/add/employee">Neuen Mitarbeiter hinzufügen</a>
            </div>
        </div>
        <table>
            <thead>
            <tr>
                <th>Nachname</th>
                <th>Vorname</th>
                <th>Funktion</th>
                <th>E-Mail</th>
                <th>Anschrift</th>
            </tr>
            </thead>
            <tbody>
                %for data in data_o:
                    <tr onclick="createClickedRow(this)" id="${data['id']}">
                        <td><a href="/employee/${data['id']}">${data['lastname'] | h}</a></td>
                        <td>${data['firstname'] | h}</td>
                        <td>${data['role'] | h}</td>
                        <td><a href="mailto:${data['email'] | h}">${data['email'] | h}</a></td>
                        <td>${data['address'] | h}</td>
                    </tr>
                %endfor
            </tbody>
            <tfoot>
            <tr>
                <th>Nachname</th>
                <th>Vorname</th>
                <th>Funktion</th>
                <th>E-Mail</th>
                <th>Anschrift</th>
            </tr>
            </tfoot>
        </table>
    </div>
</%block>