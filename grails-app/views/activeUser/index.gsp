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
                <g:select name="countryChoice" from="${countries}"  noSelection="${['null':'Choose your country...']}" onchange="submit()" />

            </g:form>
            </g:if>



            <g:if test="${cityNames}">
            <g:form controller="activeUser" action="showWeather">
                <g:select name="cityChoice" from="${cityNames}" noSelection="${['null':'Choose your city...']}" optionKey="geonameID" optionValue="cityName"
                           onchange="submit()" />

            </g:form>
            </g:if>
            <g:if test="${currentWeather}">
                <div id="content" role="main">
                    <section class="row colset-2-its">
                        <g:if test="${currentWeather}">
                            <g:render template="/openweather/currentWeather"
                                      model="[currentWeather: currentWeather, unit: unit, currentLocation: currentLocation]"/>
                        </g:if>
                    </section>
                </div>
            </g:if>





    </section>
</div>







</body>
</html>
