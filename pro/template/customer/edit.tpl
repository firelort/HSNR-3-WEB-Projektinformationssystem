## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
Kundenbe arbeiten
</%block>

<%block name="content">
<div class="container card card-content">
    <span class="card-headline"><strong>${data_o['name'] | h} - Kunden bearbeiten</strong></span>
    <hr />
    <form action="/edit/customer" method="POST">
        <input type="hidden" name="id" value="${data_o['id']}"/>
        <label for="name">Bezeichnung</label>
        <input type="text" id="name" name="name" value="${data_o['name']}" required/>
        <br />
        <label for="number">Nummer</label>
        <input type="number" id="number" name="number" min="0" value="${data_o['number']}" required/>
        <br />
        <label for="address">Anschrift</label>
        <input type="text" id="address" name="address" value="${data_o['address']}" required/>
        <br />
        <label for="contact">Ansprechpartner</label>
        <input type="text" id="contact" name="contact" value="${data_o['contact']}" required/>
        <br />
        <label for="email">E-Mail</label>
        <input type="email" id="email" name="email" value="${data_o['email']}" required/>
        <br />
        <label for="phn">Telefonnummer</label>
        <input type="tel" id="phn" name="phn" value="${data_o['phn']}" required/>
        <br />
        <input type="submit" class="btn-red" value="Absenden"/>
    </form>
    <br />
</div>
</%block>