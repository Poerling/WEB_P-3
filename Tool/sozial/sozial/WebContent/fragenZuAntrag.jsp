<%
int menu=1;

%>
<jsp:directive.include file='module/header.jspf' />
<%
//Antrag in der DB-erstellen:
	int paramID = Integer.parseInt(request.getParameter("ID"));
	db.setSQL("INSERT INTO antrag (name_ID, frage_ID_start) VALUES ('"+paramID+"','1');");
	db.schreiben();


//SQL-Query hat noch Fehler! Urpsrünglich 41, jetzt leider nur 24
db.setSQL("SELECT a.text, c.antwort_typ, d.regel FROM sprache_deutsch a JOIN frage b ON a.ID=b.frage_text_ID JOIN antwort_typ c ON b.antwort_typ_ID=c.ID JOIN (SELECT * FROM antwort_zahl UNION SELECT * FROM antwort_n_m) d ON d.frage_ID=b.ID;");
db_daten_01=db.lesenJava();

db.finalize();


%>

<div class='content'>

<h1>AdminTool Sozialleistungsrechner</h1>
<br/>
<div id="inhalt">
<h2>Liste</h2>
<table border="1">
<tr>
<td>ID</td>
<td>name_ID</td>
<td>frage_ID_start</td>
</tr>

<% for(LinkedHashMap<String, String> e : db_daten_01){ %>
	<tr>
	<% if(e.containsKey("text")){ %>
			<td>
				<% out.println(e.get("text")); %>
			</td>
	<%
	}
	if(e.containsKey("antwort_typ")){ %>
			<td>
			<% out.println(e.get("antwort_typ")); %>
			</td>
	<%}
	if(e.containsKey("regel")){ %>
			<td>
			<% out.println(e.get("regel")); %>
			</td>
	<%}%>
	<td>
		<a href="yxx.jsp?id=<%=e.get("ID")%>"><button>Editieren</button></a>
		<a href="yxx.jsp?id=<%=e.get("ID")%>"><button>Löschen</button></a>
	</td>
	</tr>
<%} %>

</table>

</div>
<div id="optionen">
<h2>Optionen</h2>
<a href="admin.jsp">Zurück zum Hauptmenü</a>
<br/>
</div>
  
<jsp:directive.include file='module/footer.jspf' />