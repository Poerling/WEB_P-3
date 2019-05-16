<%
int menu=1;
%>
<jsp:directive.include file='module/header.jspf' />
<div class='content'>

<h1>Herzlich Willkommen beim Sozialleistungsrechner</h1>
<br/>
<h2>Was wollen Sie tun?</h2>
<br/>
<form action="frage.jsp" method="get">
<input name="frage_ID" type="hidden" value="1"/>
<button class="button-frage">Meine Ansprüche überprüfen...</button>
</form>
<br/>
<form action="register.jsp" method="get">
<button class="button-frage">Mich registrieren...</button>
</form>
<br/>
<form action="login.jsp" method="get">
<button class="button-frage">Mich einloggen...</button>
</form>

<jsp:directive.include file='module/footer.jspf' />