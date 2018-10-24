## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
Projektübersicht
</%block>


<%block name="content">
<div class="container card card-content">
    <br/>
    <span class="card-headline"><strong>Projektübersicht</strong></span>
    <a class="btn-new pulled-right" href="/add/project">Projekt hinzufügen</a>
</div>

%for data in data_o:
<div class="container card card-content">
    <span class="card-headline"><strong><a href="/project?id=${data['id']}">${data['title'] | h}</a></strong> <small>#${data['number'] | h}</small></span>
    <hr/>
    <p><a href="/customer?id=${data['customer']}">
        %for entry in customer_o:
            %if entry['id'] == data['customer']:
                ${entry['name'] | h}
                <% break %>
            %endif
        %endfor
        </a>
        - ${data['date'] | h} - ${data['budget'] | h}</p>
    <hr/>
    <p>Beschreibung: <br/>
    ${data['desc'] | h}
    </p>
    <hr/>
    <table>
        <thead>
        <tr>
            <th>Mitarbeiter</th>
            <th>Aufwendung p.W.</th>
        </tr>
        </thead>
        <tbody>
        %for entry in data['employee']:
        <tr>
            <td><a href="/employee?id=${entry['id']}">
                    %for secEntry in employee_o:
                        %if secEntry['id'] == entry['id']:
                            ${secEntry['firstname'] | h} ${secEntry['lastname'] | h}
                            <% break %>
                        %endif
                    %endfor
                </a></td>
            <td>${entry['time'] | h}
        </tr>
        %endfor
        </tbody>
    </table>
    <br/>
</div>
%endfor
</%block>