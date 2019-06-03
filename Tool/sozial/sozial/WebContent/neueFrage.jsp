
<%
	int menu = 4;
%>

<jsp:directive.include file='module/header.jspf' />
<h1>AdminTool Sozialleistungsrechner</h1>
<h2>Neue Frage</h2>
<br />

<%
		db.setSQL(
					"SELECT sprache_deutsch.text, sprache_deutsch.ID, antwort_typ.antwort_typ, frage.untergrenze, frage.obergrenze FROM frage INNER JOIN sprache_deutsch ON frage.ID=sprache_deutsch.ID INNER JOIN antwort_typ ON frage.antwort_typ_ID=antwort_typ.ID;");
			db_daten_01 = db.lesenJava();

			db.setSQL("SELECT antwort_typ FROM antwort_typ;");
			db_daten_02 = db.lesenJava();
			db.finalize();
	%>

<div id="inhalt">
	

	<form action='neueFrage_dbAenderung.jsp' method="get">
		<label>Fragentext: <br /> <textarea
				name="form_fragentext" cols="100" rows="2" maxlength="5000"
				wrap="soft">
					
				</textarea>
		</label><br /> <br /> <label>Antworttyp: <select
			name="form_antworttyp">
				<%
					for (LinkedHashMap<String, String> e : db_daten_02) {
				%>
				<option>
					<%
						out.println(e.get("antwort_typ"));
					%>
				</option>
				<%
					}
				%>
		</select>
		</label> <br /> <br /> <label>Obergrenze <input
			name="form_untergrenze" type="number" />

		</label><br /> <br /> <label>Untergrenze <input
			name="form_obergrenze" type="number" /><br /> <br /> <a
			href="editiereFrage_dbAenderung.jsp"><button>Editieren</button></a> <%
 	
 %>
	</form>


</div>



<jsp:directive.include file='module/footer.jspf' />


