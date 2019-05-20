<%@ page import="java.sql.*" %>
<jsp:directive.include file='module/header.jspf' />
<div class='content'>
<h1>Neuen Antrag stellen</h1><br>
<form action="antrag_new_exec.jsp">
<table>
<tr>
<td>Antrag Name:</td><td><input type="text" name="antragName"></td>
</tr>
</table>
<input type="submit" name="submit" value="Bestätigen">
</form>
<%


%>


<a href="antrag_new.jsp">neuen Antrag erstellen</a>

<jsp:directive.include file='module/footer.jspf' />