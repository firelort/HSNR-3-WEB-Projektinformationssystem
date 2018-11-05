## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
    Kundenübersicht
</%block>

<%block name="content">
    <div class="card">
        <div class="table-head">
            <strong>Kundenübersicht</strong> <a class="btn-green" href="/add/customer">Neuen Kunden hinzufügen</a>
        </div>
            <table>
                <thead>
                <tr>
                    <th></th>
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
                        <tr id="r-${loop.index}">
                            <td>
                                <button class="btn-grey" onclick="buttonView('customer', ${data['id']})">Ansehen
                                </button>
                                <button class="btn-grey" onclick="buttonEdit('customer', ${data['id']})">Bearbeiten
                                </button>
                                <button class="btn-red" onclick="buttonDelete('customer', ${data['id']})">Löschen
                                </button>
                            </td>
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
                    <th></th>
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