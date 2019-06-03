
<%
	int menu = 4;
%>
<jsp:directive.include file='module/header.jspf' />

<%
	db.setSQL(
				"SELECT sprache_deutsch.text, sprache_deutsch.ID, antwort_typ.antwort_typ, frage.untergrenze, frage.obergrenze FROM frage INNER JOIN sprache_deutsch ON frage.ID=sprache_deutsch.ID INNER JOIN antwort_typ ON frage.antwort_typ_ID=antwort_typ.ID WHERE sprache_deutsch.ID="
						+ request.getParameter("id") + ";");
		db_daten_01 = db.lesenJava();

		db.setSQL("SELECT antwort_typ FROM antwort_typ;");
		db_daten_02 = db.lesenJava();
		db.finalize();
%>


<h1>AdminTool Sozialleistungsrechner</h1>
<h2>Editiere Frage</h2>
<br />
<div id="inhalt">


<%
		for (LinkedHashMap<String, String> f : db_daten_01) {
				String id = "";
				String id_alt = f.get("ID");
				for (int i = 0; i < id_alt.length(); i++) {
					if (id_alt.charAt(i) != ' ')
						id += id_alt.charAt(i);
				}
	%>
	<form action='editiereFrage_dbAenderung.jsp' method="get">
		<%
			String antwort_typ = f.get("antwort_typ");
		%>
		<label>Frage ID: <textarea name="form_ID" cols="50"
				rows="1" maxlength="100" wrap="soft" readonly="readonly">
					<%
						out.print(id);
					%>
				</textarea>
		</label><br /> <br />

		<%
			if (f.containsKey("text")) {
		%>
		<label>Fragentext: <br /> <textarea name="form_fragentext"
				cols="100" rows="2" maxlength="5000" wrap="soft">
					<%
						out.print(f.get("text").trim());
								}
					%>
				</textarea>
		</label><br /> <br /> <label>Antworttyp: <select
			name="form_antworttyp">
				<%
					for (LinkedHashMap<String, String> e : db_daten_02) {
				%>
				<option value=<%out.println(e.get("antwort_typ"));%>
					<%if (e.get("antwort_typ").equals(antwort_typ)) {
							out.print("selected");
						}%>>
					<%
						out.println(e.get("antwort_typ"));
					%>
				</option>
				<%
					}
				%>
		</select>
		</label> <br /> <br /> <label>Obergrenze <input
			name="form_untergrenze" type="number" /> <%
 	if (f.containsKey("untergrenze")) {
 				out.print(f.get("obergrenze"));
 			}
 %>

		</label><br /> <br /> <label>Untergrenze <input
			name="form_obergrenze" type="number" /> <%
 	if (f.containsKey("untergrenze")) {
 				out.print(f.get("untergrenze"));
 			}
 %> <br />
		<br />
		<a href="editiereFrage_dbAenderung.jsp"><button>Editieren</button></a>

			<%
				}
			%>
	</form>

</div>


<jsp:directive.include file='module/footer.jspf' />

