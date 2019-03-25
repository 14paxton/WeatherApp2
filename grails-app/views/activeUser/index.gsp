<!doctype html>
<html>
<head>
    <meta name="layout" content="standard"/>
    <title>YourWeather</title>
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css"/>





</head>
<body>


<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>You Have Logged In ${currentUser.email}!!!</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


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

            <div class="search">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="search_container">
                                <div class="search_title">Find Your Weather</div>
                                <div class="search_form_container">
                                    <form action="#" class="search_form" id="search_form">
                                        <div class="d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
                                            <div class="search_inputs d-flex flex-lg-row flex-column align-items-start justify-content-lg-between justify-content-start">
                                                <input type="text" class="search_input" placeholder="Property type" required="required">
                                                <input type="text" class="search_input" placeholder="No rooms" required="required">
                                                <input type="text" class="search_input" placeholder="Location" required="required">
                                            </div>
                                            <button class="search_button">Find Weather</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




    <g:if test="${locationList}">
            <div id="list-location" class="content scaffold-list" >
                <h1>Your Saved Locations</h1>
            <table class="table">
                <thead>
                <tr>
                    <th>City</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${locationList}" var="loc">
                    <tr>
                        <td>${loc.city.cityName}</td>
                        <td><g:form controller="location" action="delete" id="${loc.id}" method="DELETE">
                            <input class="btn btn-primary" type="submit" value="Delete Location" />
                        </g:form></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
            </div>
    </g:if>

    </section>
</div>







</body>
</html>
