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


            

            <g:if test="${countries}">
            <g:form controller="activeUser" action="getCities">
                <g:select name="countryChoice" from="${countries}"  noSelection="${['null':'Select One...']}" onchange="submit()" />

            </g:form>
            </g:if>

            <g:if test="${cityNames}">
            <g:form controller="activeUser" action="getCities">
                <g:select name="city.choice" from="${cityNames}"  noSelection="${['null':'Select One...']}" onchange="submit()" />

            </g:form>
            </g:if>




    </section>
</div>

</body>
</html>
