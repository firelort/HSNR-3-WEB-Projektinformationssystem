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
        <form method="POST" class="customerAction">
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
                            <td><input type="checkbox" name="action-${data['id']}"/></td>
                            <td><a href="/customer/?id=${data['id']}">${data['number'] | h}</a></td>
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
            <select name="action">
                <option value="edit">Editieren</option>
                <option value="delete">Löschen</option>
            </select>
            <input type="submit">
        </form>
    </div>
</%block>