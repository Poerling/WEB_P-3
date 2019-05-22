<%
int menu=1;

%>
<jsp:directive.include file='module/header.jspf' />
<%

db.setSQL("SELECT * FROM antrag;");
db_daten_01=db.lesenJava();

DB neu = new DB();
neu.setSQL("SELECT text , b.ID FROM sprache_deutsch a JOIN antrag b ON a.ID = b.name_ID;");
db_daten_02=neu.lesenJava();

%>
<div class='content'>
<div id="optionen">
<h2>Optionen</h2>
<br/>
<p>Noch ohne Funktion</p>
<form action="fragenZuAntrag.jsp" method="get">
<button class="button-admin">Editiere Frage</button>
</form>
<br/>
<form action="neuerAntrag.jsp" method="get">
<button class="button-admin">Neuen Antrag erstellen</button>
</form>
</div>

<h1>AdminTool Sozialleistungsrechner</h1>
<h2>Hauptmenü</h2>
<br/>
<div id="inhalt">
<h2>Prototyp: Übersicht aller Anträge aktuell mit Name</h2>
<table border="1">
<tr>
<td>Name</td>
</tr>

<% for(LinkedHashMap<String, String> f : db_daten_02){ %>
	<tr>
	<% if(f.containsKey("text")){ %>
			<td>
				<% out.println(f.get("text")); %>
			</td>
	<%}%>
	<td>
		<a href="loescheAntraege.jsp?id=<%=f.get("ID")%>"><button>Antrag löschen</button></a>
	</td>
	</tr>
<%} %>

</table>


<h2>//Übersicht aller Anträge ID//</h2>
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
</div>

  
<jsp:directive.include file='module/footer.jspf' />