## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
    Projektübersicht
</%block>


<%block name="content">
    <div class="card table-head">
        <strong>Projektübersicht</strong>
        <div>
            <button class="btn btn-grey" id="view" onclick="buttonView('project')">Ansehen</button>
            <button class="btn btn-grey" id="edit" onclick="buttonEdit('project')">Bearbeiten</button>
            <button class="btn btn-red" id="delete"onclick="buttonDelete('project')">Löschen</button>
            <a class="btn btn-green" href="/add/project">Projekt hinzufügen</a>
        </div>
    </div>
    %for data in data_o:
        <div class="card selectable" id="${data['id']}">
            <strong>${data['title'] | h}</strong>
            <small>#${data['number'] | h}</small>
            <hr/>
            <p><a href="/customer?id=${data['customer']}">
                %for entry in customer_o:
            %if entry['id'] == data['customer']:
                                                         ${entry['name'] | h}
                                                         <% break %>
                %endif
                %endfor
            </a> - ${data['date'] | h} - ${data['budget'] | h}</p>
            <hr/>
            <p>Beschreibung: <br/>
                ${data['desc'] | h}
            </p>
            <hr/>
            <div class="table-card">
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
            </div>
            <br/>
        </div>
    %endfor
</%block>