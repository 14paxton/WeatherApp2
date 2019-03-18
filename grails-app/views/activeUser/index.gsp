<!doctype html>
<html>
<head>
    <meta name="layout" content="standard"/>
    <title>YourWeather</title>
</head>
<body>




<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <asset:image src="weatherLogo2.PNG" class="grails-logo"/>
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>You Have Logged In ${currentUser.email}!!!</h1>


        <div id="list-locations" class="content scaffold-list" role="main">


            
            %{--<g:select name="country.choice" from="${countries}" optionValue="country_name"/>--}%



            <f:table collection="${countries}" />

            <div class="pagination">
                <g:paginate total="${size ?: 0}" />
            </div>
        </div>


        </div>








    </section>
</div>

</body>
</html>
