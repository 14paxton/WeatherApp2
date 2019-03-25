<!DOCTYPE HTML>
<html lang="en">

<head>
    <title>Weather</title>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="style.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
    <!-- web font -->
    <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <!-- //web font -->
    <!-- js -->
    <asset:javascript src="js/jquery-2.1.4.min.js"/>
    <asset:javascript src="js/skycons.js"/>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />-->
    <asset:javascript src="jquery.min.js"/>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
            });
        });
    </script>
    <!-- grid-slider -->
    <asset:javascript src="jquery.mousewheel.js"/>
    <asset:javascript src="js/jquery.contentcarousel.js"/>
    <asset:javascript src="jquery.easing.1.3.js"/>
    <!-- //grid-slider -->
    <g:layoutHead/>
</head>
<body>
<!-- start header_top -->





<div class="header">



    <div class="container">
        <sec:ifNotLoggedIn>
            <div class="header-text">
                <h1>My Weather</h1>
                <h2>An Elaborate Way To Check The Weather</h2>
                <p>Please sign up so we can track your usage</p>
                <div class="banner_btn">
                    <a class="nav-link" href="${createLink(controller: 'signUp', action: 'join')}">Sign up</a>
                </div>
            </div>
        </sec:ifNotLoggedIn>
<sec:ifLoggedIn>


    <div class="w3ls-weather-agileinfo">
        <div class="weather-left">
            <div class="weather-left-text">
                <h4>Los Angeles, USA </h4>
                <h5>Sunday, 12th March </h5>
            </div>
            <ul class="report">
                <li><a href="#">79 °F</a></li>
                <li><a href="#"><span>25</span> °C</a></li>
            </ul>
        </div>
        <div class="weather-right">
            <ul>
                <li>
                    <figure class="icons">
                        <canvas id="partly-cloudy-day" width="10" height="10"></canvas>
                    </figure>
                    <h4>Tue</h4>
                    <h5>25 °C</h5>
                    <div class="clear"></div>
                </li>
                <li>
                    <figure class="icons">
                        <canvas id="partly-cloudy-day" width="10" height="10"></canvas>
                    </figure>
                    <h4>Tue</h4>
                    <h5>25 °C</h5>
                    <div class="clear"></div>
                </li>
                <li>
                    <figure class="icons">
                        <canvas id="partly-cloudy-day" width="10" height="10"></canvas>
                    </figure>
                    <h4>Tue</h4>
                    <h5>25 °C</h5>
                    <div class="clear"></div>
                </li>
                <li>
                    <figure class="icons">
                        <canvas id="partly-cloudy-day" width="10" height="10"></canvas>
                    </figure>
                    <h4>Tue</h4>
                    <h5>25 °C</h5>
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
</sec:ifLoggedIn>





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
            <asset:javascript src="application.js"/>
            <asset:deferredScripts/>
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
