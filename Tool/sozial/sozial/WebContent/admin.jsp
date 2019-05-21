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
<div id="inhalt">
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
	<td>
		<a href="loescheAntraege.jsp?id=<%=e.get("ID")%>"><button>Antrag löschen</button></a>
	</td>
	</tr>
<%} %>

</table>
</div>
<div id="optionen">
<h2>Optionen</h2>
<br/>
<form action="editiereFragen.jsp" method="get">
<button class="button-admin">Editiere Fragen</button>
</form>
<br/>
<form action="neuerAntrag.jsp" method="get">
<button class="button-admin">Neuen Antrag erstellen</button>
</form>
</div>
  
<jsp:directive.include file='module/footer.jspf' />