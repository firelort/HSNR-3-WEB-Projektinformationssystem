## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
Projekt bearbeiten
</%block>

<%block name="content">
<div class="container card card-content">
    <span class="card-headline">Neues Projekt anlegen</span>
    <hr/>
    <form method="post" action="/add/project">
        <label for="title">Projektbeschreibung:</label>
        <input type="text" id="title" name="title" required/><br/>
        <label for="number">Nummer:</label>
        <input type="number" id="number" name="number" min="0" required/><br/>
        <label for="desc">Beschreibung:</label>
        <textarea id="desc" name="desc" required></textarea><br/>
        <label for="date">Zeit:</label>
        <input type="text" id="date" name="date" required/><br/>
        <label for="budget">Budget:</label>
        <input type="text" id="budget" name="budget" required/><br/>
        <label for="customer">Kunde:</label>
        <select id="customer" id="customer" name="customer" required/>
        %for entry in customer_o:
        <option value="${entry['id'] | h}">${entry['name'] | h}</option>
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
                <td><input type="number" step="0.01" min="0" name="id-${entry['id']}" value="0" required/></td>
            </tr>
            %endfor
            </tbody>
        </table>

        </select>
        <br/>
        <input type="submit" class="btn-green" value="Absenden"/>
    </form>
</div>
</%block>