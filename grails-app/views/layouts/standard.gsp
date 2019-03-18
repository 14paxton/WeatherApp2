<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><g:layoutTitle default="Asciibooks.com"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <g:layoutHead/>
</head>
<body style="padding-top: 90px">

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <sec:ifLoggedIn>
        <a class="navbar-brand" href="/ActiveUser/index"><asset:image src="weathermini.png" width="80" height="80" alt="tornado"/></a>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <a class="navbar-brand" href="/#"><asset:image src="weathermini.png" width="80" height="80" alt="tornado"/></a>
    </sec:ifNotLoggedIn>



    <div class="collapse navbar-collapse" id="navbarsDefault">
        <ul class="navbar-nav mr-auto">
<sec:ifNotLoggedIn>
    <li class="nav-item">
                <a class="nav-link" href="${createLink(controller: 'signUp', action: 'join')}">Sign up</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${createLink(controller: 'login', action: 'auth')}">Login</a>
            </li>
</sec:ifNotLoggedIn>
<sec:ifLoggedIn>

            <li class="nav-item">
                <a class="nav-link" href="${createLink(controller: 'logoff')}">Logout</a>
            </li>
</sec:ifLoggedIn>

        </ul>

    </div>
</nav>
<div class="container">
    <div class="jumbotron">
<g:layoutBody/>
<asset:javascript src="application.js"/>
<asset:deferredScripts/>
    </div>
</div>
</body>
</html>
