<%@ page import="java.sql.*" %>
<jsp:directive.include file='module/header.jspf' />
<div class='content'>
<h1>Anträge (Hauptmenü)</h1><br>
<table>
<%
Connection conn = null;
Statement stmt = null;
conn = DriverManager.getConnection("jdbc:mysql://localhost/sozial", "admin", "Dopa1978");
stmt = conn.createStatement();

String sql = "SELECT * FROM antrag";
ResultSet rs = stmt.executeQuery(sql);


while(rs.next()){

   int id  = rs.getInt("ID");
   int nameID = rs.getInt("name_ID");
   int frageIDStart = rs.getInt("frage_ID_start");
   String nameAntrag = rs.getString("name_Antrag");
   out.print("<tr>");
   out.print("<td>" + nameAntrag + "</td><td><a href=\"antrag_delete.jsp?id="+id+"\">löschen</a></td>");
   out.print("<td>");

}
rs.close();

%>
</table>

<a href="antrag_new.jsp">neuen Antrag erstellen</a>

<jsp:directive.include file='module/footer.jspf' />