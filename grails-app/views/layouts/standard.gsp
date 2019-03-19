<!DOCTYPE HTML>
<html lang="en">
<html>
<head>
    <title>Weather</title>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="style.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />-->
    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
            });
        });
    </script>
    <!-- grid-slider -->
    <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="js/jquery.contentcarousel.js"></script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
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
