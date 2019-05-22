<%
int menu=1;

%>
<jsp:directive.include file='module/header.jspf' />
<%
//Antrag in der DB-erstellen:
/* 	int paramID = Integer.parseInt(request.getParameter("ID"));
	db.setSQL("INSERT INTO antrag (name_ID, frage_ID_start) VALUES ('"+paramID+"','1');");
	db.schreiben();
 */

//SQL-Query hat noch Fehler! Urpsr�nglich 41, jetzt leider nur 24
db.setSQL("SELECT b.ID, a.text, c.antwort_typ FROM sprache_deutsch a JOIN frage b ON a.ID=b.frage_text_ID JOIN antwort_typ c ON b.antwort_typ_ID=c.ID;");
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
<td>text</td>
<td>antwort_typ</td>
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
	<%}%>
	<td>
		<a href="yxx.jsp?id=<%=e.get("ID")%>"><button>Editieren</button></a>
		<a href="yxx.jsp?id=<%=e.get("ID")%>"><button>L�schen</button></a>
	</td>
	</tr>
<%} %>

</table>

</div>
<div id="optionen">
<h2>Optionen</h2>
<a href="admin.jsp">Zur�ck zum Hauptmen�</a>
<br/>
</div>
</div>
  
<jsp:directive.include file='module/footer.jspf' />