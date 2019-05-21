<%
int menu=1;

%>
<jsp:directive.include file='module/header.jspf' />
<%

db.setSQL("SELECT * FROM antrag;");
db_daten_01=db.lesenJava();

%>

<div class='content'>

<h1>AdminTool Sozialleistungsrechner</h1>
<br/>
<h2>Optionen</h2>
<br/>
<form action="neuerAntrag.jsp" method="get">
<button class="button-frage">Neuen Antrag erstellen</button>
</form>
<br/>
<h2>Übersicht aller Anträge aktuell</h2>
<table border="1">
<tr>
<td>ID</td>
<td>name_ID</td>
<td>frage_ID_start</td>
</tr>

<% for(LinkedHashMap<String, String> e : db_daten_01){ %>
	<tr>
	<% if(e.containsKey("ID")){ %>
			<td>
				<% out.println(e.get("ID")); %>
			</td>
	<%
	}
	if(e.containsKey("name_ID")){ %>
			<td>
			<% out.println(e.get("name_ID")); %>
			</td>
	<%}
	if(e.containsKey("frage_ID_start")){ %>
			<td>
			<% out.println(e.get("frage_ID_start")); %>
			</td>
	<%}%>
	<tr>
<%}%>

</table>

  
<jsp:directive.include file='module/footer.jspf' />