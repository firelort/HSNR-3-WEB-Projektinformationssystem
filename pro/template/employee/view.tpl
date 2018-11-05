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
    </div>
</%block>