<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <a class="navbar-brand" href="/#"><asset:image src="weathermini.png" width="80" height="80" alt="tornado"/></a>

    <g:link controller='login'>
    <button type="button">Login</button>
    </g:link>

    <g:link controller='logoff'>
        <button type="button">Logout</button>
    </g:link>

</nav>

<g:layoutBody/>



<asset:javascript src="application.js"/>

</body>
</html>
