## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
    ${data_o['name'] | h}
</%block>

${data_o}
<%block name="content">
    <div class="card">
        <strong>Kundenübersicht</strong>
        <hr/>
        <table>
            <tbody>
            <tr>
                <th>Bezeichner:</th>
                <td>${data_o['name'] | h}</td>
            </tr>
            <tr>
                <th>Nummer:</th>
                <td>${data_o['number'] | h}</td>
            </tr>
            <tr>
                <th>Ansprechpartner:</th>
                <td>${data_o['contact'] | h}</td>
            </tr>
            <tr>
                <th>E-Mail</th>
                <td><a href="mailto:${data_o['email'] | h}">${data_o['email'] | h}</a></td>
            </tr>
            <tr>
                <th>Telefonnummer</th>
                <td>${data_o['phn'] | h}</td>
            </tr>
            <tr>
                <th>Adresse:</th>
                <td><a
                        href="https://www.google.com/maps/search/${data_o['address'] | h}">${data_o['address'] | h}</a>
                </td>
            </tr>
            </tbody>
        </table>
        <hr/>
    </div>
</%block>
