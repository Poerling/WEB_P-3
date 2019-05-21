<%
int menu=1;

%>
<jsp:directive.include file='module/header.jspf' />
<%
String id=request.getParameter("id");
db.setSQL("DELETE FROM antrag WHERE ID="+id);
db.schreiben();
db.finalize();
response.sendRedirect("admin.jsp");
%>
<jsp:directive.include file='module/footer.jspf' />