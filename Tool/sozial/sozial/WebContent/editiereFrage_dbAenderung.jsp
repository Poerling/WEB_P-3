
<%
	int menu = 4;
%>
<jsp:directive.include file='module/header.jspf' />

<%
	db.setSQL(
				"SELECT sprache_deutsch.text, frage.ID, antwort_typ.antwort_typ, frage.untergrenze, frage.obergrenze FROM frage INNER JOIN sprache_deutsch ON frage.ID=sprache_deutsch.ID INNER JOIN antwort_typ ON frage.antwort_typ_ID=antwort_typ.ID WHERE frage.ID="
						+ request.getParameter("id") + ";");
		db_daten_01 = db.lesenJava();

		db.setSQL("SELECT * FROM frage WHERE frage_text_ID=" + request.getParameter("form_ID"));
		db_daten_02 = db.lesenJava();

	

		db.setSQL("SELECT * FROM antwort_typ WHERE antwort_typ=" + "\""
				+ request.getParameter("form_antworttyp") + "\"");
		db_daten_03 = db.lesenJava();
		
		
		//ändere Fragetext
		db.setSQL("UPDATE sprache_deutsch SET text=" + "\"" +request.getParameter("form_fragentext")+ "\"" +" WHERE ID=" + request.getParameter("form_ID").trim() + ";");
		db.schreiben();
		
		//ändere antworttyp
		String antwort_typ_ID ="";
		for (LinkedHashMap<String, String> f : db_daten_03){
			if(f.containsKey("ID"))
				antwort_typ_ID = f.get("ID");
		}
		db.setSQL("UPDATE frage SET antwort_typ_ID=" + antwort_typ_ID + " WHERE ID=" + request.getParameter("form_ID").trim() + ";");
		db.schreiben();
		
		//ändere grenzen
		String untergrenze = request.getParameter("form_untergrenze");
		String obergrenze = request.getParameter("form_obergrenze");
		if(untergrenze != ""){
			db.setSQL("UPDATE frage SET untergrenze=" + untergrenze + " WHERE ID=" + request.getParameter("form_ID").trim() + ";");
		}
		db.schreiben();
		
		if(obergrenze != ""){
			db.setSQL("UPDATE frage SET obergrenze=" + obergrenze + " WHERE ID=" + request.getParameter("form_ID").trim() + ";");
		}
		db.schreiben();
		
		
		db.finalize();
%>


<h1>AdminTool Sozialleistungsrechner</h1>
<h2>Editiere Frage</h2>
<br />
<div id="inhalt">

<%

/* String form_ID = "";
String form_ID_alt = request.getParameter("from_ID");
for(int i = 0; i < form_ID_alt.length(); i++){
	if(form_ID_alt.charAt(i) != ' ')
		form_ID += form_ID_alt.charAt(i);
} */



%> 




<p>Frage wurde erfolgreich editiert</p>
<p><a href="admin.jsp">zurück zum hauptmenü</a></p>

</div>










<jsp:directive.include file="module/footer.jspf" />