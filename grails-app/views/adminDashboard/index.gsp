<!doctype html>
<html>
<head>
    <meta name="layout" content="standard"/>
    <title>YourWeather</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <asset:javascript src="application.js"/>


    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https:////cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <g:if test="${lang as String == 'es'}">
    <g:javascript>
        $(document).ready(function() {
            $('#user_table').dataTable( {
                "language": {
                    "url": "https:////cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
                }
            } );
        } );
   </g:javascript>
    </g:if>
    <g:else>
        <g:javascript>
            $(document).ready( function () {
                $('#user_table').DataTable();
            } );
        </g:javascript>
    </g:else>


</head>
<body>




<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <asset:image src="weatherLogo2.PNG" class="grails-logo"/>
    </div>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1><g:message code="admin.heading" /></h1>
        <h2> <g:message code="admin.login.greeting" args="[currentUser.email]" /></h2>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>


        <div id="list-location" class="content scaffold-list" >
            <h1>Current Users</h1>
            <table id="user_table" class="display compact" style="width:99%;">
                <thead>
                <tr>
                    <th><g:message code="user.table.email.header" /></th>
                    <th><g:message code="user.table.account.locked" /></th>
                    <th><g:message code="user.table.account.expired" /></th>
                    <th><g:message code="user.table.password.expired" /></th>
                    <th><g:message code="user.table.enabled" /></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${allUsers}" var="theUser">
                    <tr>
                        <td><a href="${createLink(controller: "User",  action: 'edit', id: theUser.id)}">${theUser.email}</a></td>
                        <td>${theUser.accountLocked}</td>
                        <td>${theUser.accountExpired}</td>
                        <td>${theUser.passwordExpired}</td>
                        <td>${theUser.enabled}</td>

                        <td><g:form controller="user" action="delete" id="${theUser.id}" method="DELETE">
                            <input class="btn btn-primary" type="submit" value="${message(code:"delete.user")}" />
                        </g:form></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>






    </section>
</div>

</body>
</html>
