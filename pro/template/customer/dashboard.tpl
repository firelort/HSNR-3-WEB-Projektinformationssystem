## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
    Kundenübersicht
</%block>

<%block name="content">
    <div class="card">
        <div class="table-head">
            <strong>Kundenübersicht</strong>
            <div>
                <button class="btn btn-grey" id="view" onclick="buttonView('customer')">Ansehen
                </button>
                <button class="btn btn-grey" id="edit" onclick="buttonEdit('customer')">Bearbeiten
                </button>
                <button class="btn btn-red" id="delete" onclick="buttonDelete('customer')">Löschen
                </button>
                <a class="btn btn-green" href="/add/customer">Neuen Kunden hinzufügen</a>
            </div>
        </div>
        <table class="selectable">
            <thead>
            <tr>
                <th>#</th>
                <th>Bezeichner</th>
                <th>Anschrift</th>
                <th>Ansprechpartner</th>
                <th>E-Mail</th>
                <th>Telefonnummer</th>
            </tr>
            </thead>
            <tbody>
                %for data in data_o:
                    <tr id="${data['id']}" name="tr">
                        <td>${data['number'] | h}</td>
                        <td>${data['name'] | h}</td>
                        <td>${data['address'] | h}</td>
                        <td>${data['contact'] | h}</td>
                        <td><a href="mailto:${data['email'] | h}">${data['email'] | h}</a></td>
                        <td>${data['phn'] | h}</td>
                    </tr>
                % endfor
            </tbody>
            <tfoot>
            <tr>
                <th>#</th>
                <th>Bezeichner</th>
                <th>Anschrift</th>
                <th>Ansprechpartner</th>
                <th>E-Mail</th>
                <th>Telefonnummer</th>
            </tr>
            </tfoot>
        </table>
    </div>
</%block>