## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
    Mitarbeiterübersicht
</%block>


<%block name="content">
    <div class="card">
        <div class="table-head">
            <strong>Mitarbeiterübersicht</strong> <a class="btn-green" href="/add/employee">Neuen Mitarbeiter hinzufügen</a>
        </div>
        <table>
            <thead>
            <tr>
                <th></th>
                <th>Nachname</th>
                <th>Vorname</th>
                <th>Funktion</th>
                <th>E-Mail</th>
                <th>Anschrift</th>
            </tr>
            </thead>
            <tbody>
                %for data in data_o:
                    <tr id="r-${loop.index}">
                        <td><input type="checkbox" name="edit-${data['id']}" /></td>
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
                <th></th>
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