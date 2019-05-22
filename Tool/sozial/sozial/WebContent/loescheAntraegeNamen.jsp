<%
int menu=1;

%>
<jsp:directive.include file='module/header.jspf' />
<%
String name_id=request.getParameter("nameID");
db.setSQL("DELETE FROM sprache_deutsch WHERE ID="+name_id+"");
db.schreiben();
db.finalize();
response.sendRedirect("admin.jsp");
%>
<jsp:directive.include file='module/footer.jspf' />