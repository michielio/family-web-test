<!DOCTYPE html>
<html>
<head>
<title>Nieuw netwerk</title>
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, initial-scale=1, user-scalable=yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-cable" content="yes">
<meta charset="utf-8">
<script
	src="../../bower_components/webcomponentsjs/webcomponents.min.js"></script>
<link rel="import" href="../../elements.html">
<link rel="import"
	href="../../custom_elements/responsive-menu-socialworker.html">
<link rel="import" href="../../custom_elements/options-menu.html">
<link rel="import"
	href="../../bower_components/core-media-query/core-media-query.html">
<link rel="import"
	href="../../bower_components/paper-tabs/paper-tabs.html">
<link rel="import"
	href="../../bower_components/core-icon-button/core-icon-button.html">
<link rel="import"
	href="../../custom_elements/paper-form-element-decorators/paper-submit-button-decorator.html">
<link rel="stylesheet" href="../../styles/new_network_contacts.css">
<!--     <link rel="stylesheet" href="../../styles/base.css"> -->
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
	<div flex>Nieuw netwerk</div>
	<options-menu></options-menu>
	<div class="bottom fit" horizontal layout>
		<paper-tabs id="scrollableTabs" selected="2" flex scrollable noink>

		<paper-tab>
		<a href="family_members_overview.html" horizontal center-center layout>Gezinsleden</a></paper-tab>
		<paper-tab>
		<a href="network_compare.html" horizontal center-center layout>Netwerken</a></paper-tab>
		<paper-tab>
		<a href="new_network_contacts.jsp" horizontal center-center layout>Nieuw
			Netwerk</a></paper-tab> <paper-tab>
		<a href="share_networks.html" horizontal center-center layout>Netwerk(en)
			delen</a></paper-tab> <paper-tab>
		<a href="transfer.html" horizontal center-center layout>Overdragen</a></paper-tab>

		</paper-tabs>
	</div>
	</core-toolbar>
	<div class="content" layout vertical>
		<%@ page import="domain.FamilyWeb.Familymember"%>
		<message-window-notification
			message="Selecteer een gezinslid en voeg zijn of haar contactpersonen toe aan de contactgroepen."></message-window-notification>
		<% if(!(session.getAttribute("message") == null)){%>
		<message-window-error message="${message}"></message-window-error>
		<% } %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div id="form_container">
			<form id="group_form" action="ContactServlet.do" method="post">

				<div id="select_box_container">
					<div class="information">
						<label>Selecteer de ondervraagde:</label>
						<!--                                 Nog een foreach loop in maken waarin de familymembers uit de session worden gehaald en in een select worden gestopt -->
						<select id="interviewee" name="interviewee">
							<c:forEach items="${client.myFamilymembers}" var="familymember">
								<option class="select_option" value="${familymember.member_id}">${familymember.forename} ${familymember.surname}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<!-- elke groep kan ook via een jsp functie worden aangemaakt zolang alle groepen al in de sessie staan. Dus die moeten al eerder worden aangemaakt-->
				<div id="household" class="group">
					<input class="hidden" id="counterhousehold" type="text" value="0" />
					<h3>Gezin</h3>
					<core-icon-button class="add" onclick="addInput('household')"
						icon="add"></core-icon-button>
				</div>
				<div id="family" class="group">
					<input class="hidden" id="counterfamily" type="text" value="0" />
					<h3>Familie</h3>
					<core-icon-button class="add" onclick="addInput('family')"
						icon="add"></core-icon-button>
				</div>
				<div id="friends" class="group">
					<input class="hidden" id="counterfriends" type="text" value="0" />
					<h3>Vrienden</h3>
					<core-icon-button class="add" onclick="addInput('friends')"
						icon="add"></core-icon-button>
				</div>
				<div id="colleagues" class="group">
					<input class="hidden" id="countercolleagues" type="text" value="0" />
					<h3>Collega's</h3>
					<core-icon-button class="add" onclick="addInput('colleagues')"
						icon="add"></core-icon-button>
				</div>
				<div id="neighbours" class="group">
					<input class="hidden" id="counterneighbours" type="text" value="0" />
					<h3>Buren</h3>
					<core-icon-button class="add" onclick="addInput('neighbours')"
						icon="add"></core-icon-button>
				</div>
				<div id="acquaintance" class="group">
					<input class="hidden" id="counteracquaintance" type="text"
						value="0" />
					<h3>Kennissen</h3>
					<core-icon-button class="add" onclick="addInput('acquaintance')"
						icon="add"></core-icon-button>
				</div>
				<div id="education" class="group">
					<input class="hidden" id="countereducation" type="text" value="0" />
					<h3>Onderwijs</h3>
					<core-icon-button class="add" onclick="addInput('education')"
						icon="add"></core-icon-button>
				</div>
				<div id="club" class="group">
					<input class="hidden" id="counterclub" type="text" value="0" />
					<h3>Verenigingen</h3>
					<core-icon-button class="add" onclick="addInput('club')" icon="add"></core-icon-button>
				</div>
				<div id="religion" class="group">
					<input class="hidden" id="counterreligion" type="text" value="0" />
					<h3>Religie</h3>
					<core-icon-button class="add" onclick="addInput('religion')"
						icon="add"></core-icon-button>
				</div>
				<div id="careinstitution" class="group">
					<input class="hidden" id="countercareinstitution" type="text"
						value="0" />
					<h3>Zorginstellingen</h3>
					<core-icon-button class="add" onclick="addInput('careinstitution')"
						icon="add"></core-icon-button>
				</div>
				<div id="youthcare" class="group">
					<input class="hidden" id="counteryouthcare" type="text" value="0" />
					<h3>Jeugdzorg</h3>
					<core-icon-button class="add" onclick="addInput('youthcare')"
						icon="add"></core-icon-button>
				</div>
				<div id="bureauhalt" class="group">
					<input class="hidden" id="counterbureauhalt" type="text" value="0" />
					<h3>Bureau HALT</h3>
					<core-icon-button class="add" onclick="addInput('bureauhalt')"
						icon="add"></core-icon-button>
				</div>
				<div id="justice" class="group">
					<input class="hidden" id="counterjustice" type="text" value="0" />
					<h3>Justitie</h3>
					<core-icon-button class="add" onclick="addInput('justice')"
						icon="add"></core-icon-button>
				</div>
				<div id="select_box_container">
					<div class="information">
						<label>Selecteer de vragenlijst die u wilt afnemen:</label> <select
							id="survey_selection" name="survey">
							<c:forEach items="${surveys}" var="survey">
								<option class="select_option" value="${survey}">${survey}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="submit_button_container">
				<input type="submit" class="submit_button"
					value="Vragenlijst afnemen">
				</div>
			</form>
		</div>
	</div>
	</core-header-panel> </core-drawer-panel>
	<core-media-query id="mediaQuery" query="max-width: 640px"></core-media-query>

	<script>
		function addInput(groupName) {
			var countBox = parseInt(document.getElementById("counter"
					+ groupName).value);
			countBox += 1;
			var name = "name" + countBox;
			var role = "role" + countBox;
			var age = "age" + countBox;
			var validate = "validate" + countBox;
			document.getElementById(groupName).innerHTML += '<div id="' + groupName + countBox + '" class="person"> <div class="contact"> <div class="information"> <label>Naam:</label> <input type="text" id="' + groupName + name + '" name="' + groupName + name + '" placeholder="Volledige naam"/> </div> <div class="information"> <label>Rol:</label> <input type="text" id="' + groupName + role + '" name="' + groupName + role + '" placeholder="Rol" /> </div> <div class="information"> <label>Leeftijd:</label> <input type="text" id="' + groupName + age + '" name="' + groupName + age + '" placeholder="Leeftijd" /> </div> <input class="hidden" type="text" id="' + groupName + validate + '" name="' + groupName + validate + '" value="true" /> </div> <core-icon-button class="remove" icon="highlight-remove" onclick="'
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
