## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
${data_o['lastname'] | h}
</%block>

<%block name="content">
<div class="container card card-content">
    <span class="card-headline"><strong>${data_o['firstname'] | h} ${data_o['lastname'] | h}</strong></span>
    <hr />
    <p>
        Funktion: ${data_o['role'] | h}<br />
        E-Mail: <a href="mailto:${data_o['email'] | h}">${data_o['email'] | h}</a><br />
        Anschrift: ${data_o['address'] | h}<br />
    </p>
    <hr />
    <a class="btn-grey" href="/edit/employee/${data_o['id'] | h}">Bearbeiten</a>
    <form action="/delete/employee" method="post">
        <input type="hidden" name="id" value="${data_o['id']}" required/>
        <input type="submit" class="btn-red" value="Löschen"/>
    </form>
</div>
</%block>