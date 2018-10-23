## coding: utf-8
<%inherit file="/layout/base.tpl"/>

<%block name="title">
${data_o['name'] | h}
</%block>

${data_o}
<%block name="content">
<div class="container">
    <div class="card">
        <div class="card-content">
            <span class="card-headline"><strong>${data_o['name'] | h}</strong></span>
            <small>#${data_o['number'] | h}</small>
            <hr/>
            <p>Adresse: <a
                        href="https://www.google.com/maps/search/${data_o['address'] | h}">${data_o['address'] | h}</a>
                <br/>
                <br/>
                Ansprechpartner: ${data_o['contact'] | h}<br/>
                E-Mail: <a href="mailto:${data_o['email'] | h}">${data_o['email'] | h}</a><br/>
                Telefonnummer: ${data_o['phn'] | h}<br/>
            </p>
            <hr/>
            <a class="btn-grey" href="/edit/customer/${data_o['id'] | h}">Bearbeiten</a>
            <form action="/delete/customer" method="post">
                <input type="hidden" name="id" value="${data_o['id']}" required/>
                <input type="submit" class="btn-red" value="Löschen"/>
            </form>

        </div>
    </div>
</div>
</%block>