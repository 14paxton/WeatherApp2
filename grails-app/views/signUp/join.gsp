<html>
<head>
    <meta name="layout" content="standard"/>
    <title>Weather App - Sign Up</title>
</head>

<body>

<div class="container">

    <form action="${createLink(controller: 'signUp', action: 'save')}" method="POST" autocomplete="on">
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
