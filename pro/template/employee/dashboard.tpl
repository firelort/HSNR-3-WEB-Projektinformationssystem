## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
Mitarbeiterübersicht
</%block>


<%block name="content">
<div class="container">
    <div class="card">
        <div class="card-content">
            <span class="card-headline"><strong>Mitarbeiterübersicht</strong></span>
            <a class="btn-new pulled-right" href="/add/employee">Mitarbeiter hinzufügen</a>
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
                <tr id="r-${loop.index}">
                    <td><a href="/employee/${data['id']}">${data['lastname']}</a></td>
                    <td>${data['firstname']}</td>
                    <td>${data['role']}</td>
                    <td>${data['email']}</td>
                    <td>${data['address']}</td>
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
    </div>
</div>
</%block>