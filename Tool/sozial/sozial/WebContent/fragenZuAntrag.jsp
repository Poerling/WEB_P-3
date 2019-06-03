<%@page import="java.sql.PreparedStatement"%>
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
 
 

//SQL-Query hat noch Fehler! Urpsrünglich 41, jetzt leider nur 24

String sqlStatement1 = "SELECT b.ID, a.text, c.antwort_typ FROM sprache_deutsch a JOIN frage b ON a.ID=b.frage_text_ID JOIN antwort_typ c ON b.antwort_typ_ID=c.ID;"; 
// Abfrage um die Regeln zu bekommen
String sqlStatement2 = "SELECT liste_fragen.ID, antwort_zahl.regel FROM liste_fragen, antwort_zahl WHERE antwort_zahl.frage_ID = liste_fragen.ID";
db.setSQL(sqlStatement1);
db_daten_01=db.lesenJava();


db.setSQL(sqlStatement2);
db_daten_02=db.lesenJava();
db.setSQL("SELECT sprache_deutsch.text, sprache_deutsch.ID, antwort_typ.antwort_typ FROM frage INNER JOIN sprache_deutsch ON frage.ID=sprache_deutsch.ID INNER JOIN antwort_typ ON frage.antwort_typ_ID=antwort_typ.ID;");
db_daten_01=db.lesenJava();

db.setSQL("SELECT * FROM FRAGE");
db_daten_02= db.lesenJava();

db.finalize();


%>

<div class='content'>

<h1>AdminTool Sozialleistungsrechner</h1>
<br/>
<div id="inhalt">
<h2>Liste</h2>
<table border="1">
<tr>
<<<<<<< HEAD
<td>Fragen</td>
<td>Frage-typ</td>
<td>Regeln</td>
<td>Antworten</td>
<td>Aktionen</td>

=======
<td>text</td>
<td>antwort_typ</td>
<td><a href="neueFrage.jsp"><button>Neue Frage</button></a>
>>>>>>> d0e19f7616d60bd40b29deb631dc4cc30a8a36aa
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
	
	<td> test </td>
	<td>
		<a href="editiereFrage.jsp?id=<%=e.get("ID")%>"><button>Editieren</button></a>
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
</div>
  
<jsp:directive.include file='module/footer.jspf' />