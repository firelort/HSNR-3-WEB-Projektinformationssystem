## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
    ${data_o['title'] | h}
</%block>


<%block name="content">
    <div class="container card card-content">
        <strong>Projektübersicht</strong>
        <hr/>
        <table>
            <tbody>
            <tr>
                <th>Projektbezeichnung:</th>
                <td>${data_o['title'] | h}</td>
            </tr>
            <tr>
                <th>Projektnummer:</th>
                <td>${data_o['number'] | h}</td>
            </tr>
            <tr>
                <th>Kunde:</th>
                <td><a href="/customer?id=${data_o['customer']}">
                    %for entry in customer_o:
                        %if entry['id'] == data_o['customer']:
                            ${entry['name'] | h}
                            <% break %>
                        %endif
                    %endfor
                </a></td>
            </tr>
            <tr>
                <th>Zeit:</th>
                <td>${data_o['date'] | h}</td>
            </tr>
            <tr>
                <th>Budget:</th>
                <td>${data_o['budget'] | h}</td>
            </tr>
            </tbody>
        </table>
        <hr/>
        <p><strong>Beschreibung:</strong><br/>
            ${data_o['desc'] | h}
        </p>
        <hr/>
        <strong>Aufwendung der Mitarbeiter</strong>
        <table>
                <thead>
                <tr>
                    <th>Mitarbeiter</th>
                    <th>Aufwendung p.W.</th>
                </tr>
                </thead>
                <tbody>
                    %for entry in data_o['employee']:
                        <tr>
                            <td><a href="/employee?id=${entry['id']}">
                                %for secEntry in employee_o:
                                    %if secEntry['id'] == entry['id']:
                                       ${secEntry['lastname'] | h}, ${secEntry['firstname'] | h}
                                       <% break %>
                                    %endif
                                %endfor
                            </a></td>
                            <td>${entry['time'] | h}
                        </tr>
                    %endfor
                </tbody>
            </table>
        <hr/>
        <div class="table-bottom">
            <a href="/edit/project/?id=${data_o['id']}" class="btn-grey">Bearbeiten</a>
            <form action="/delete/project" method="post">
                <input type="hidden" name="id" value="${data_o['id']}"/>
                <input type="submit" class="btn-red" value="Löschen"/>
            </form>
        </div>
        <br/>
    </div>
</%block>
