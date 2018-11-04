## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
    ${data_o['lastname'] | h}
</%block>

<%block name="content">
    <div class="card">
        <strong>Mitarbeiterübersicht</strong>
        <hr/>
        <table>
            <tbody>
            <tr>
                <th>Name</th>
                <td>${data_o['lastname'] | h}, ${data_o['firstname'] | h}</td>
            </tr>
            <tr>
                <th>Funktion:</th>
                <td>${data_o['role'] | h}</td>
            </tr>
            <tr>
                <th>E-Mail:</th>
                <td><a href="mailto:${data_o['email'] | h}">${data_o['email'] | h}</a><br/></td>
            </tr>
            <tr>
                <th>Anschrift:</th>
                <td>${data_o['address'] | h}<br/></td>
            </tr>
            </tbody>
        </table>
        <hr/>
        <div class="table-bottom">
            <a class="btn-grey" href="/edit/employee/${data_o['id'] | h}">Bearbeiten</a>
            <form action="/delete/employee" method="post">
                <input type="hidden" name="id" value="${data_o['id']}"/>
                <input type="submit" class="btn-red" value="Löschen"/>
            </form>
        </div>
    </div>
</%block>