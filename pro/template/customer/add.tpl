## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
Mitarbeiter hinzufügen
</%block>

<%block name="content">
<div class="card">
    <strong>Neuen Kunden hinzufügen</strong>
    <hr />
    <form action="/add/customer" method="POST">
        <label for="name">Bezeichnung</label>
        <input type="text" id="name" name="name" required/>
        <br />
        <label for="number">Nummer</label>
        <input type="number" id="number" name="number" min="0" required/>
        <br />
        <label for="address">Anschrift</label>
        <input type="text" id="address" name="address" required/>
        <br />
        <label for="contact">Ansprechpartner</label>
        <input type="text" id="contact" name="contact" required/>
        <br />
        <label for="email">E-Mail</label>
        <input type="email" id="email" name="email" required/>
        <br />
        <label for="phn">Telefonnummer</label>
        <input type="tel" id="phn" name="phn" required/>
        <hr />
        <input type="submit" class="btn-green" value="Absenden"/>
    </form>
</div>
</%block>