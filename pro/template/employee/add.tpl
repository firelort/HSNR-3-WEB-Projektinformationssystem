## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
Mitarbeiter hinzufügen
</%block>

<%block name="content">
<div class="container card card-content">
    <span class="card-headline"><strong>Neuen Mitarbeiter hinzufügen</strong></span>
    <hr />
    <form action="/add/employee" method="POST">
        <label for="lastname">Nachname</label>
        <input type="text" id="lastname" name="lastname" required/>
        <br />
        <label for="firstname">Vorname</label>
        <input type="text" id="firstname" name="firstname" required/>
        <br />
        <label for="address">Anschrift</label>
        <input type="text" id="address" name="address" required/>
        <br />
        <label for="email">E-Mail</label>
        <input type="email" id="email" name="email" required/>
        <br />
        <label for="role">Role</label>
        <input type="text" id="role" name="role" required/>
        <br />
        <input type="submit" class="btn-green"/>
    </form>
</div>
</%block>