<%@ page import="grails.converters.JSON" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="standard"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>YourWeather</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

    <asset:javascript src="application.js"/>

  %{--<g:if test="${lang as String == 'es'}">
   --}%%{--custom spanish script for datatable--}%%{--
      <asset:javascript src="spanishDataTable.js"/>
  </g:if>
    <g:else>
        <asset:javascript src="dataTable.js"/>
    </g:else>--}%




    <script type="text/javascript" charset="utf8" src="https:////cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    <g:javascript>


        %{--var thisList =   <g:applyCodec encodeAs="Raw">  ${jsonList} </g:applyCodec>--}%

        $(document).ready( function() {


     var listJSON ;

    $.ajax( {
    url: "${g.createLink(controller: 'activeUser', action: 'getLocationChoiceList')}",
    dataSrc : '',
    error: function(xhr){console.log(JSON.parse(xhr.responseText));},
    success: function(result){

        listJSON = result ;

    }  // end success function
    }); //end ajax call




            function log( message ) {
      $( "<div>" ).text( message ).prependTo( "#log" );
      $( "#log" ).scrollTop( 0 );
    }

        $( "#cityList" ).autocomplete({
      source: function(request, response) {
     var results = $.ui.autocomplete.filter( listJSON,
         request.term);

        response(results.slice(0, 10));
    },
         minLength: 2,
         select: function( event, ui ) {
           log( "Selected: " + ui.item.value + " aka " + ui.item.id );
         }
       });



    $("#getCurrentWeather").click(function(){
    var city = document.getElementById('cityList').value;
    $.ajax( {
    url: "${g.createLink( controller:'activeUser', action:'getCurrentWeather')}" ,
    type: 'POST',
    data: {cityChoice: city},
    success: function(result){
    $("#curWeather").html(result);
    }  // end success function
    }); //end ajax call
    }); //end click function


/*datatables using ajax call for JSON*/
       $('#location_table').dataTable({

        ajax: {
                url: "${g.createLink(controller: 'activeUser', action: 'test')}" ,
                 dataSrc : 'data'
                 /*error: function(xhr){console.log(JSON.parse(xhr.responseText));},
                 /!*success: function(result) {console.log(JSON.stringify(result))}*!/
                 success: function(result) {console.log(JSON.stringify(result))}*/

                },
        columns: [
            {data: 'id'},
            {data: 'city'},
            {data: null,
            defaultContent: '<button class="btn btn-primary" type="submit" >${message(code:"delete.location")}</button>'}
        ]

        } );




%{--        $.ajax({
            url : "${g.createLink(controller: 'activeUser', action: 'test')}" ,
            type : 'GET',
            dataType : 'json',
            success : function(data) {
                assignToEventsColumns(data);
                console.log(JSON.stringify(data));
            }
        });

        function assignToEventsColumns(data) {
            var table = $('#location_table').dataTable({
                "bAutoWidth" : false,
                "aaData" : data,
                "columns" : [ {
                    "data" : "id"
                }]
            })
        }--}%



     } ); //end Document ready

    </g:javascript>


</head>
<body>


<div id="content" role="main">
    <section class="row colset-2-its">
        <g:if test="${currentUser}">
        <h1><g:message code="you.have.logged.in.0" args="[currentUser.email]" /></h1>
        </g:if>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


    <div>
        <g:message code="choose.your.location" /> <input type="text" name="cityChoice" id="cityList" class="search_input" placeholder="${message(code:"choose.country")}" required="required"  >
        <button class="btn btn-white btn-margin-right-5-md btn-inline-to-block margin-top-10 btn-focus-white" id="getCurrentWeather" type="button">Submit </button>
        <div id="curWeather" style="float: right">


        </div>
    </div>


        <g:if test="${locationList}">
        <button class="btn btn-primary" data-toggle="modal" data-target="#list-location" id="showLocations"  type="button">Your Locations</button>
        </g:if>


    %{--Data table with users saved locations--}%
        <table id="location_table" class="display" style="width:100%">
            <thead>
            <tr>
                <th>id</th>
                <th>city</th>
                <th>delete</th>

            </tr>
            </thead>

        </table>


    </section>
</div>




%{--      <div class="modal fade" id="list-location" role="dialog">
          <div clas="modal-dialog modal-xlg">

              <!-- Modal content -->
              <div class="modal-content">

              <h1><g:message code="your.saved.locations" /></h1>
              <table id="location_table" class="display compact" style="width:99%;">
                  <thead>
                  <tr>
                      <th><g:message code="city" /></th>
                      <th></th>
                      <th></th>
                  </tr>
                  </thead>
                  <tbody>
                  <g:each in="${locationList}" var="loc">
                      <tr>

                          <td><a href="${createLink(controller: "ActiveUser",  action: 'showSavedLocationWeather', params: [locationURL: loc.fiveDayWeatherCall])}">${loc.city.cityName}</a></td>
                          <td><a href="${createLink(controller: 'Location',  action: 'index', id: loc.id)}">JSON</a></td>

                          <td><g:form controller="location" action="delete" id="${loc.id}" method="DELETE">
                              <input class="btn btn-primary" type="submit" value="${message(code:"delete.location")}" />
                          </g:form></td>

                      </tr>
                  </g:each>
                  </tbody>
              </table>

          </div>



          </div>
      </div>--}%


%{--DataTable with info about saved locations--}%

%{--            <div id="list-location" class="content scaffold-list" >
                <h1><g:message code="your.saved.locations" /></h1>
                <table id="location_table" class="display compact" style="width:99%;">
                <thead>
                <tr>
                    <th><g:message code="city" /></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${locationList}" var="loc">
                    <tr>

                        <td><a href="${createLink(controller: "ActiveUser",  action: 'showSavedLocationWeather', params: [locationURL: loc.fiveDayWeatherCall])}">${loc.city.cityName}</a></td>
                        <td><a href="${createLink(controller: 'Location',  action: 'index', id: loc.id)}">JSON</a></td>

                        <td><g:form controller="location" action="delete" id="${loc.id}" method="DELETE">
                            <input class="btn btn-primary" type="submit" value="${message(code:"delete.location")}" />
                        </g:form></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
            </div>--}%




%{--use javascript to asych with the weather api--}%
%{--<g:javascript>

    /*jslint browser:true */
    'use strict';

    var weatherConditions = new XMLHttpRequest();
    var weatherForecast = new XMLHttpRequest();
    var cObj;

    // GET THE CONDITIONS
    weatherConditions.open('GET', 'http://api.openweathermap.org/data/2.5/weather?id=4158928&APPID=097e124b838ecac32ee6299a03694e0d&&units=imperial', true);
    weatherConditions.responseType = 'text';
    weatherConditions.send(null);

    weatherConditions.onload = function() {
        if (weatherConditions.status === 200){
            cObj = JSON.parse(weatherConditions.responseText);
            console.log(cObj);
            document.getElementById('location').innerHTML=cObj.name;

            document.getElementById('weather').innerHTML=cObj.weather[0].description;
            document.getElementById('temperature').innerHTML=cObj.main.temp;
            document.getElementById('desc').innerHTML="Wind Speed" + cObj.wind.speed;


        } //end if
    }; //end function


</g:javascript>--}%




</body>


</html>
