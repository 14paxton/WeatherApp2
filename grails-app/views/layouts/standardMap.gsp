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
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- //grid-slider -->
    <g:layoutHead/>
</head>
<body>

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

                <a href="/ActiveUser/index"><asset:image src="weatherLogo2.PNG" width="80" height="80" alt="home"/></a>

        </div>
        <div class="h_menu4"><!-- start h_menu4 -->
            <a class="toggleMenu" href="#">Menu</a>
            <ul class="nav">

                    <li class="nav-item">
                        <a class="nav-link" href="${createLink(controller: 'logoff')}">Logout</a>
                    </li>

            </ul>
            <script type="text/javascript" src="js/nav.js"></script>
        </div><!-- end h_menu4 -->
        <div class="clear"></div>
    </div>
</div>
<!-- end menu -->




<div class="main">
    <iframe width="100%" height="420" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=United+Kingdom&amp;aq=0&amp;oq=un&amp;sll=37.0625,-95.677068&amp;sspn=48.956293,107.138672&amp;ie=UTF8&amp;hq=&amp;hnear=United+Kingdom&amp;ll=55.378051,-3.435973&amp;spn=135.795411,68.554687&amp;t=m&amp;z=2&amp;output=embed"> </iframe><br /><small><a href="http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=United+Kingdom&amp;aq=0&amp;oq=un&amp;sll=37.0625,-95.677068&amp;sspn=48.956293,107.138672&amp;ie=UTF8&amp;hq=&amp;hnear=United+Kingdom&amp;ll=55.378051,-3.435973&amp;spn=135.795411,68.554687&amp;t=m&amp;z=2" style="color:#666;font-size:12px;text-align:left"> </a></small>
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
