<%@ page import="grails.converters.JSON" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="standard"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>YourWeather</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">

    <asset:javascript src="application.js"/>

   %{-- custom script for datatable--}%
    <asset:javascript src="dataTable.js"/>



    <script type="text/javascript" charset="utf8" src="https:////cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <g:javascript>


         var thisList =   <g:applyCodec encodeAs="Raw">  ${jsonList} </g:applyCodec>

           //var thisList = ${countries};

           $( function() {
       function log( message ) {
         $( "<div>" ).text( message ).prependTo( "#log" );
         $( "#log" ).scrollTop( 0 );
       }

       $( "#birds" ).autocomplete({
         source: <g:applyCodec encodeAs="Raw">  ${jsonList} </g:applyCodec> ,
         minLength: 2,
         select: function( event, ui ) {
           log( "Selected: " + ui.item.value + " aka " + ui.item.id );
         }
       });
     } );
       </g:javascript>




</head>
<body>


<div id="content" role="main">
    <section class="row colset-2-its">
        <h1><g:message code="you.have.logged.in.0" args="[currentUser.email]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <div id="list-locations" class="content scaffold-list" role="main">



            <g:if test="${countries}">
            <g:form controller="activeUser" action="getCities">
                <g:select name="countryChoice" from="${countries}"  noSelection="${['null':'Choose your country...']}" onchange="submit()" />

            </g:form>
            </g:if>

            <g:formRemote name="countryChoice" update="cities"
                            url="[controller: 'activeUser', action: 'getMatchingCities()']">
               Countries: <input type="text" id="birds" class="search_input" placeholder="Choose Your Country" required="required" onchange="submit()" >
            </g:formRemote>
            <g:select name="cities" id="cities" from="${cityNames}" noSelection="${['null':'Choose your city...']}" optionKey="geonameID" optionValue="cityName"
                      onchange="submit()" />





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
                                                <input type="text" id="birds" class="search_input" placeholder="Choose Your Country" required="required">
                                                <input type="text" class="search_input" placeholder="No rooms" required="required">
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
                <h1><g:message code="your.saved.locations" /></h1>
                <table id="location_table" class="display compact" style="width:99%;">
                <thead>
                <tr>
                    <th><g:message code="city" /></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${locationList}" var="loc">
                    <tr>

                        <td><a href="${createLink(controller: "ActiveUser",  action: 'showSavedLocationWeather', params: [locationURL: loc.fiveDayWeatherCall])}">${loc.city.cityName}</a></td>

                        <td><g:form controller="location" action="delete" id="${loc.id}" method="DELETE">
                            <input class="btn btn-primary" type="submit" value="${message(code:"delete.location")}" />
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
