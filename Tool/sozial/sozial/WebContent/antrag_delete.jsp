<%@ page import="java.sql.*" %>
<jsp:directive.include file='module/header.jspf' />
<div class='content'>
<h1>Anträge (Hauptmenü)</h1><br>
<table>
<%
String id = request.getParameter("id");
out.print(id);
Connection conn = null;
Statement stmt = null;
conn = DriverManager.getConnection("jdbc:mysql://localhost/sozial", "admin", "Dopa1978");
stmt = conn.createStatement();

String sql = "DELETE FROM antrag WHERE ID="+id;
stmt.executeUpdate(sql);

out.println("<script language='JavaScript'>window.location='antraege.jsp'</script>");


//Wird ein Antrag gelöscht,dann werden alle Fragen und 
//jeweilige Antworten zu den Fragen und Regeln zu Fragen/Folgefragenlogik
//aus dem Antrag ebenfalls gelöscht.
//fehlt noch

%>
</table>
<jsp:directive.include file='module/footer.jspf' />