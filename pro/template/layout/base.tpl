## coding: utf-8
<!DOCTYPE html>

<html lang="de">
<head>
    <!-- META DATA -->
    <meta charset="UTF-8"/>
    <meta name="description" content="Ein Projektinformationssystem"/>
    <meta name="keywords" content="WEB"/>
    <meta name="author" content="Robert Hartings & Christopher Ionescu"/>
    <meta name="viewport" content="width=device-width, inital-scale=1.0"/>

    <!-- CSS -->
    <link rel="stylesheet" href="/app.css" type="text/css"/>

    <title><%block name="title"/> | Projektinformationssystem </title>

</head>
<body>
<!-- Navbar -->
<%include file="navbar.tpl"/>
<!--Content -->
<%block name="content">
    Fehler!
</%block>
<!-- Footer -->
<%include file="footer.tpl"/>
<!-- JavaScript -->
<script src="/app.js"></script>
</body>
</html>