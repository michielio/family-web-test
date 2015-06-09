<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-cable" content="yes">
    <meta charset="utf-8">
    <script src="bower_components/webcomponentsjs/webcomponents.min.js"></script>
    <link rel="import" href="elements.html">
    <link rel="stylesheet" href="styles/login.css">

</head>
<body fullbleed layout vertical>
    <core-header-panel flex>
        <core-toolbar>
            <div id="title">Inloggen</div>
        </core-toolbar>
        <div class="content">
        <% if(!(session.getAttribute("message") == null)){%>
        <message-window-error message="${message}"></message-window-error>
        <% } %>
			
            <form id="login_form" action="LoginServlet.do" method="POST">
                <fieldset>
                    <legend>Log in</legend>
                    <div class="information">
                        <label>Gebruikersnaam :</label>
                        <input id="username" name="username" type="text" placeholder="Gebruikersnaam" value="${param.username}" />
                    </div>
                    <div class="information">
                        <label>Wachtwoord :</label>
                        <input id="password" name="password" type="password" placeholder="Wachtwoord" />
                    </div>
					<div id="login_button_container">
					 <input id="login_button" type="submit" value="Inloggen">
					</div>
                    <p id="forgot_password"><a href="forgot_password.html">Wachtwoord vergeten?</a></p>
                </fieldset>
            </form>
        </div>
    </core-header-panel>
</body>
</html>
