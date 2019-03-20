<!doctype html>
<html>
<head>
    <meta name="layout" content="standardMap"/>
    <title>YourWeather</title>
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css"/>



</head>
<body>


<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>You Have Logged In ${currentUser.email}!!!</h1>


        <div id="list-locations" class="content scaffold-list" role="main">


            


            <g:form controller="activeUser" action="getCities">
                <g:select name="countryChoice" from="${countries}"  noSelection="${['null':'Select One...']}" onchange="submit()" />

            </g:form>

            <g:form controller="activeUser" action="getCities">
                <g:select name="city.choice" from="${cityNames}"  noSelection="${['null':'Select One...']}" onchange="submit()" />

            </g:form>





    </section>
</div>

</body>
</html>
