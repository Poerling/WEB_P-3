<%@ page import="java.sql.*" %>
<jsp:directive.include file='module/header.jspf' />
<div class='content'>
<h1>Anträge (Hauptmenü)</h1><br>
<table>
<%
String antragName = request.getParameter("antragName");
Connection conn = null;
Statement stmt = null;
conn = DriverManager.getConnection("jdbc:mysql://localhost/sozial", "admin", "Dopa1978");
stmt = conn.createStatement();

//Hier müssen noch irgendwelche Fremdschlüssel rein statt den '3'
String sql = "INSERT INTO antrag (ID, name_ID, frage_ID_start, name_antrag) VALUES ('','3','3','"+antragName+"')";
//out.print(sql);
stmt.executeUpdate(sql);

//out.println("<script language='JavaScript'>window.location='antraege.jsp'</script>");




%>
</table>
<jsp:directive.include file='module/footer.jspf' />