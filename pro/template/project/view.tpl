## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
${data_o['title'] | h}
</%block>


<%block name="content">
<div class="container card card-content">
    <span class="card-headline"><strong>${data_o['title'] | h}</strong> <small>#${data_o['number'] | h}</small></span>
    <hr/>
    <p>Kunde:<a href="/customer?id=${data_o['customer']}">
            %for entry in customer_o:
            %if entry['id'] == data_o['customer']:
            ${entry['name'] | h}
            <% break %>
            %endif
            %endfor
        </a>
        <br/>
        Deadline: ${data_o['date'] | h}<br/>
        Budget: ${data_o['budget'] | h}</p>
    <hr/>
    <p>Beschreibung: <br/>
        ${data_o['desc'] | h}
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
        %for entry in data_o['employee']:
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
    <hr/>
    <a href="/edit/project/?id=${data_o['id']}" class="btn-grey">Bearbeiten</a>
    <form action="/delete/project" method="post">
        <input type="hidden" name="id" value="${data_o['id']}" required/>
        <input type="submit" class="btn-red" value="Löschen"/>
    </form>
    <br/>
</div>
</%block>