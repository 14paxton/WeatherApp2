<html>
<head>
    <meta name="layout" content="standard"/>
    <title>AsciiBooks - Login</title>
    <style type="text/css" media="screen">
    body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #eee;
    }

    .form-signin {
        max-width: 330px;
        padding: 15px;
        margin: 0 auto;
    }
    .form-signin .form-signin-heading,
    .form-signin .form-control {
        position: relative;
        box-sizing: border-box;
        height: auto;
        padding: 10px;
        font-size: 16px;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="username"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
    </style>
</head>

<body>

<div class="container">

    <form action="${createLink(controller: 'signUp', action: 'save')}" class="form-signin" method="POST" autocomplete="on">
        <h2 class="form-signin-heading">Let Us Email You Spam</h2>
        <label for="email" class="sr-only">Email address</label>
        <input type="email" id="email" name="email" class="form-control" placeholder="Email address" required autofocus>
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>


        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up!</button>
    </form>

</div>




</body>
</html>



