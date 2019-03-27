<!DOCTYPE HTML>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Weather</title>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="style.css"/>
    <asset:javascript src="skycons.js"/>


    <g:layoutHead/>
</head>
<body>
<!-- start header_top -->





<div class="header" style="padding: 1% 0 0 0 ">

    <sec:ifLoggedIn>

        <g:if test="${forecastWeather}">
            <div class="w3ls-weather-agileinfo">
                <div class="weather-left">
                    <div class="weather-left-text">
                        <h4>${forecastWeather.cityName}</h4>
                        <h5>${forecastWeather.forecastDayList[0].date} </h5>
                    </div>
                    <ul class="report">
                        <li><a href="#">${forecastWeather.forecastDayList[0].main.temperature} °F</a></li>
                        <li><a href="#"><span>${forecastWeather.forecastDayList[0].main.tempCelsius}</span> °C</a></li>
                    </ul>
                </div>
                <div class="weather-right">
                    <ul>
                        <li>
                            <figure class="icons">
                                <canvas id="partly-cloudy-day" width="30" height="30"></canvas>
                            </figure>
                            <h5>${forecastWeather.forecastDayList[8].date}</h5>
                            <h5>${forecastWeather.forecastDayList[8].main.temperature} °F</h5>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <figure class="icons">
                                <canvas id="cloudy" width="30" height="30"></canvas>
                            </figure>
                            <h5>${forecastWeather.forecastDayList[16].date}</h5>
                            <h5>${forecastWeather.forecastDayList[16].main.temperature} °F</h5>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <figure class="icons">
                                <canvas id="clear-day" width="30" height="30"></canvas>
                            </figure>
                            <h4>${forecastWeather.forecastDayList[24].date}</h4>
                            <h5>${forecastWeather.forecastDayList[24].main.temperature} °F</h5>
                            <div class="clear"></div>
                        </li>
                        <li>
                            <figure class="icons">
                                <canvas id="wind" width="30" height="30"></canvas>
                            </figure>
                            <h4>${forecastWeather.forecastDayList[32].date}</h4>
                            <h5>${forecastWeather.forecastDayList[32].main.temperature} °F</h5>
                            <div class="clear"></div>
                        </li>
                    </ul>
                    <script>
                        var icons = new Skycons({"color": "#fff"}),
                            list  = [
                                "partly-cloudy-day"
                            ],
                            i;

                        for(i = list.length; i--; )
                            icons.set(list[i], list[i]);
                        icons.play();
                    </script>
                    <script>
                        var icons = new Skycons({"color": "#fff"}),
                            list  = [
                                "clear-night","partly-cloudy-night", "cloudy", "clear-day", "sleet", "snow", "wind","fog"
                            ],
                            i;

                        for(i = list.length; i--; )
                            icons.set(list[i], list[i]);
                        icons.play();
                    </script>
                </div>
                <div class="clear"></div>
            </div>
        </g:if>
    </sec:ifLoggedIn>

    <div class="container">
        <sec:ifNotLoggedIn>
            <div class="header-text">
                <h1><g:message code="register.widget.heading"/></h1>
                <h2><g:message code="register.widget.tag"/></h2>
                <p><g:message code="register.widget.email.message"/></p>
                <div class="banner_btn">
                    <a class="nav-link" href="${createLink(controller: 'signUp', action: 'join')}"><g:message code="register.widget.button"/></a>
                </div>
            </div>
        </sec:ifNotLoggedIn>






        <div class="header-arrow">
            <a href="#menu" class="class scroll"><span> </span </a>
        </div>
    </div>


</div>

<!-- end header_top -->
<!-- start header_bottom -->
<div class="header-bottom">
    <div class="container">

        <div class="clear"></div>
    </div>
</div>
<!-- end header_bottom -->
<!-- start menu -->
<div class="menu" id="menu">
    <div class="container">
        <div class="logo">
            <sec:ifLoggedIn>
                <a href="/ActiveUser/index"><asset:image src="weathermini.png" width="80" height="80" alt="home"/></a>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <a  href="/#"><asset:image src="weathermini.png" width="80" height="80" alt="home"/></a>
            </sec:ifNotLoggedIn>

        </div>
        <div class="h_menu4"><!-- start h_menu4 -->
            <a class="toggleMenu" href="#">Menu</a>
            <ul class="nav">
                <sec:ifNotLoggedIn>
                    <li class="nav-item">
                        <a class="nav-link" href="${createLink(controller: 'signUp', action: 'join')}"><g:message code="nav.signup.button"/></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${createLink(controller: 'login', action: 'auth')}"><g:message code="nav.login.button"/></a>
                    </li>
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>

                    <li class="nav-item">
                        <a class="nav-link" href="${createLink(controller: 'logoff')}"><g:message code="nav.logout.button"/></a>
                    </li>
                </sec:ifLoggedIn>
            </ul>
            <script type="text/javascript" src="js/nav.js"></script>
        </div><!-- end h_menu4 -->
        <div class="clear"></div>
    </div>
</div>
<!-- end menu -->




<div class="main">
    <div class="container">
        <div class="jumbotron">
            <g:layoutBody/>
           %{-- <asset:deferredScripts/>--}%

        </div>
    </div>
</div>



<div class="footer-bottom">
    <div class="container">
        <div class="row section group">



            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="copyright">
    <div class="container">


        <div class="clear"></div>
    </div>
</div>
</body>
</html>
