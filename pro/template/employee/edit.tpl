## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
Mitarbeiter bearbeiten
</%block>

<%block name="content">
<div class="container card card-content">
    <strong>Mitarbeiter bearbeiten - ${data_o['lastname'] | h}, ${data_o['firstname'] | h}</strong>
    <hr />
    <form action="/edit/employee" method="POST">
        <input type="hidden" name="id" value="${data_o['id']}"/>
        <label for="lastname">Nachname</label>
        <input type="text" id="lastname" name="lastname" value="${data_o['lastname']}" required/>
        <br />
        <label for="firstname">Vorname</label>
        <input type="text" id="firstname" name="firstname" value="${data_o['firstname']}" required/>
        <br />
        <label for="address">Anschrift</label>
        <input type="text" id="address" name="address" value="${data_o['address']}" required/>
        <br />
        <label for="email">E-Mail</label>
        <input type="email" id="email" name="email" value="${data_o['email']}" required/>
        <br />
        <label for="role">Role</label>
        <input type="text" id="role" name="role" value="${data_o['role']}" required/>
        <hr />
        <input type="submit" class="btn-red" value="Absenden"/>
    </form>
</div>
</%block>