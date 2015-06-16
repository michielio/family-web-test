<!DOCTYPE html>
<html>
<head>
<title>Gezinsleden</title>
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, initial-scale=1, user-scalable=yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-cable" content="yes">
<meta charset="utf-8">
<script
	src="/FamilyWeb/bower_components/webcomponentsjs/webcomponents.min.js"></script>
<link rel="import" href="/FamilyWeb/elements.html">
<link rel="import"
	href="/FamilyWeb/custom_elements/responsive-menu-socialworker.html">
<link rel="import" href="/FamilyWeb/custom_elements/options-menu.html">
<link rel="import"
	href="/FamilyWeb/bower_components/core-media-query/core-media-query.html">
<link rel="import"
	href="/FamilyWeb/bower_components/paper-tabs/paper-tabs.html">
<link rel="stylesheet"
	href="/FamilyWeb/styles/family_members_overview.css">
</head>
<body fullbleed layout vertical>
	<core-drawer-panel responsivewidth="1400px"> <core-header-panel
		drawer> <core-toolbar> <core-icon-button
		core-drawer-toggle icon="close"></core-icon-button>
	<div flex>Menu</div>
	</core-toolbar> <responsive-menu-socialworker current="1"></responsive-menu-socialworker>
	</core-header-panel> <core-header-panel main> <core-toolbar
		class="medium-tall"> <core-icon-button
		core-drawer-toggle icon="menu"></core-icon-button>
	<div flex>Gezinsleden</div>
	<options-menu></options-menu>
	<div class="bottom fit" horizontal layout>
		<paper-tabs id="scrollableTabs" selected="0" flex scrollable noink>

		<paper-tab> <a href="family_members_overview.html"
			horizontal center-center layout>Gezinsleden</a></paper-tab> 
		<paper-tab>
		<a href="network_compare.html" horizontal center-center layout>Netwerken</a></paper-tab>
		<paper-tab> <a href="new_network_contacts.jsp" horizontal
			center-center layout>Nieuw Netwerk</a></paper-tab> 
			<paper-tab> <a
			href="share_networks.html" horizontal center-center layout>Netwerk(en)
			delen</a></paper-tab> 
			<paper-tab> <a href="transfer.html" horizontal
			center-center layout>Overdragen</a></paper-tab> 
			</paper-tabs>
	</div>
	</core-toolbar>
	<div class="content" fit layout vertical>
		<% if(!(session.getAttribute("message") == null)){%>
		<message-window-error message="${message}"></message-window-error>
		<% } %>
		<div id="family_members_container">
			<form id="group_form" action="/FamilyWeb/FamilyMembersServlet.do"
				method="post">
				<div id="familymembers" class="group">
					<input id="counterfamilymembers" type="hidden" value="0" />
					<h3>Gezinsleden toevoegen</h3>
					<core-icon-button class="add" onclick="addInput('familymembers')"
						icon="add"></core-icon-button>
					<div id="submit_button_container">
						<input type="submit" class="submit_button" value="Opslaan">
					</div>
				</div>

			</form>
			<p>overzicht gezinsleden hieronder</p>
		</div>

	</div>
	</core-header-panel> </core-drawer-panel>
	<core-media-query id="mediaQuery" query="max-width: 640px"></core-media-query>

	<script>
		function addInput(groupName) {
// 			de eerste keer dat deze methode wordt aangeroepen dan hoeft ook pas de submit knop in beeld te komen
			document.getElementById("submit_button_container").style.display = 'block';
			var countBox = parseInt(document.getElementById("counter"
					+ groupName).value);
			countBox += 1;
			var name = "name" + countBox;
			var role = "role" + countBox;
			var age = "age" + countBox;
			var validate = "validate" + countBox;
			document.getElementById(groupName).innerHTML += '<div id="' + groupName + countBox + '" class="person"> <div class="contact"> <div class="information"> <label>Naam:</label> <input type="text" id="' + groupName + name + '" name="' + groupName + name + '" placeholder="Volledige naam"/> </div> <div class="information"> <label>Rol:</label> <input type="text" id="' + groupName + role + '" name="' + groupName + role + '" placeholder="Rol" /> </div> <div class="information"> <label>Leeftijd:</label> <input type="text" id="' + groupName + age + '" name="' + groupName + age + '" placeholder="Leeftijd" /> </div> <input type="hidden" id="' + groupName + validate + '" name="' + groupName + validate + '" value="true" /> </div> <core-icon-button class="remove" icon="highlight-remove" onclick="'
					+ " removeInput("
					+ countBox
					+ ","
					+ "'"
					+ groupName
					+ "'"
					+ ")" + '"></core-icon-button> </div>';
			document.getElementById("counter" + groupName).value = countBox;
		}

		function removeInput(personNumber, groupName) {
			document.getElementById(groupName + personNumber).style.display = 'none';
			document.getElementById(groupName + "validate" + personNumber).value = "false";
		}

		document.querySelector('#mediaQuery').addEventListener(
				'core-media-change',
				function(e) {
					document.body.classList.toggle('core-narrow',
							e.detail.matches);
					document.querySelector('#scrollableTabs').updateBar();
				});
	</script>
</body>

</html>