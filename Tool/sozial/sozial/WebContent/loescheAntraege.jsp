<%
int menu=1;

%>
<jsp:directive.include file='module/header.jspf' />
<%
String id=request.getParameter("id");
db.setSQL("SELECT name_ID FROM `antrag` WHERE ID="+id);
db_daten_01=db.lesenJava();
String name_ID="";
for(LinkedHashMap<String, String> f : db_daten_01){
	name_ID=f.get("name_ID");
}
db.setSQL("DELETE FROM antrag WHERE ID="+id);
db.schreiben();
db.setSQL("DELETE FROM sprache_deutsch WHERE ID="+name_ID);
db.schreiben();
db.finalize();

response.sendRedirect("admin.jsp");
%>
<jsp:directive.include file='module/footer.jspf' />