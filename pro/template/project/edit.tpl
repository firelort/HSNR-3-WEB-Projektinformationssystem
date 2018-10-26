## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
Projekt bearbeiten
</%block>

<%block name="content">
<div class="container card card-content">
    <span class="card-headline">${data_o['title'] | h} - Projekt bearbeiten</span>
    <hr/>
    <form method="post" action="/edit/project">
        <input type="hidden" name="id" value="${data_o['id'] | h}"/>
        <label for="title">Projektbeschreibung:</label>
        <input type="text" id="title" name="title" value="${data_o['title'] | h}" required/><br/>
        <label for="number">Nummer:</label>
        <input type="number" id="number" name="number" min="0" value="${data_o['number'] | h}" required/><br/>
        <label for="desc">Beschreibung:</label>
        <textarea id="desc" name="desc" required>${data_o['desc'] | h}</textarea><br/>
        <label for="date">Zeit:</label>
        <input type="text" id="date" name="date" value="${data_o['date'] | h}" required/><br/>
        <label for="budget">Budget:</label>
        <input type="text" id="budget" name="budget" value="${data_o['budget'] | h}" required/><br/>
        <label for="customer">Kunde:</label>
        <select id="customer" id="customer" name="customer" required/>
        %for entry in customer_o:
            %if entry['id'] == data_o['customer'] :
                <option selected="selected" value="${entry['id'] | h}">${entry['name'] | h}</option>
            %else:
                <option value="${entry['id'] | h}">${entry['name'] | h}</option>
            %endif
        %endfor
        </select><br/>
        Mitarbeiter<br/>

        <table>
            <thead>
            <th>Name</th>
            <th>Aufwendungen p.W.</th>
            </thead>
            <tbody>
            %for entry in employee_o:
            <tr>
                <td>${entry['firstname'] | h} ${entry['lastname']}</td>
                <%
                def get_value():
                   value = False
                   for secEntry in data_o['employee']:
                      if secEntry['id'] == entry['id']:
                         value = True
                         break
                   if value is True:
                      return secEntry['time']
                   else:
                      return 0
                %>
                <td><input type="number" step="0.01" min="0" name="id-${entry['id']}" value="${get_value()}" required/></td>
            </tr>
            %endfor
            </tbody>
        </table>

        </select>
        <br/>
        <input type="submit" class="btn-red" value="Absenden"/>
    </form>
</div>
</%block>