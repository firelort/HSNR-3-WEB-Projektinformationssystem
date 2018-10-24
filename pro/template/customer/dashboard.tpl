## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
Kundenübersicht
</%block>

<%block name="content">
<div class="container">
    <div class="card">
        <div class="card-content">
            <span class="card-headline"><strong>Kundenübersicht</strong></span>
            <a class="btn-new pulled-right" href="/add/customer">Kunden hinzufügen</a>
            <table>
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
                <tr id="r-${loop.index}">
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
    </div>
</div>
</%block>