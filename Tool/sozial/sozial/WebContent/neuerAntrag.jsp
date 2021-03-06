<%
int menu=1;

%>
<jsp:directive.include file='module/header.jspf' />
<%
/* if(request.getParameterMap().containsKey("ID")&&request.getParameterMap().containsKey("name_ID")&&request.getParameterMap().containsKey("frage_ID_start")){
int paramID = Integer.parseInt(request.getParameter("ID"));
int paramNameID = Integer.parseInt(request.getParameter("name_ID"));
int paramFrageStartID = Integer.parseInt(request.getParameter("frage_ID_start"));
db.setSQL("INSERT INTO antrag (ID, name_ID, frage_ID_start) VALUES ('"+paramID+"','"+paramNameID+"','"+paramFrageStartID+"');");
db.schreiben();
db.finalize();
//db_daten_01=db.lesenJava();
} */

//Hole Daten f�r Dropdown Men�
db.setSQL("SELECT CONCAT(a.ID, ': ', b.text) AS output, a.ID FROM frage a, sprache_deutsch b WHERE b.ID=a.frage_text_ID;");
db_daten_02=db.lesenJava();

String textParam = "";
String meldung="";
String numErsteFrage="";
if(request.getParameterMap().containsKey("text")&&(request.getParameter("text")!="")
		&&(request.getParameterMap().containsKey("numErsteFrage"))&&(request.getParameter("numErsteFrage")!="")){
	textParam = request.getParameter("text");
	numErsteFrage=request.getParameter("numErsteFrage");
	db.setSQL("INSERT INTO `sprache_deutsch`(`text`) VALUES ('"+textParam+"');");
	db.schreiben();

	//Hole ID von gerade erstelltem Text
	db.setSQL("SELECT ID FROM `sprache_deutsch` WHERE text='"+textParam+"';");
	db_daten_01=db.lesenJava();
	String textID="";
	for(LinkedHashMap<String, String> f : db_daten_01){
		textID=f.get("ID");
	}
	response.sendRedirect("neuerAntrag.jsp?ID="+textID+"&numErsteFrage="+numErsteFrage+"");
		
}
//Antrag mit ID in der DB-erstellen:	
if(request.getParameterMap().containsKey("ID")&&(request.getParameter("ID")!="")){
	String paramID = request.getParameter("ID");
	db.setSQL("INSERT INTO antrag (name_ID, frage_ID_start) VALUES ('"+paramID+"','"+request.getParameter("numErsteFrage")+"');");
	db.schreiben();
	db.finalize();
	meldung="Antrag mit name_ID "+request.getParameter("ID")+" erfolgreich angelegt!";
}

%>

<div class='content'>

<h1>AdminTool Sozialleistungsrechner</h1>
<br/>
<div id="optionen">
<h2>Optionen</h2>
<a href="admin.jsp">Zur�ck zum Hauptmen�</a>
<br/>
</div>
<div id="inhalt">
<h2>Prototyp: Neuer Antrag erstellen/V.0.0.1</h2>
</br>
<form action='neuerAntrag.jsp' method="get"> 
	<label>Antrag Name: </br>
	<% if(textParam!="") %>
	<textarea name="text" cols="50" rows="1" maxlength="5000" wrap="soft"><%out.print(textParam);%></textarea>
	</label>
	</br>
<!-- 	<label>Nummer erste Frage: </br>
	<textarea name="numErsteFrage" cols="50" rows="1" maxlength="5000" wrap="soft"></textarea>
	</label> -->
	<label>Nummer der ersten Frage: </br>
	<select name="numErsteFrage">
	<% for(LinkedHashMap<String, String> e : db_daten_02){%> 
		<option value=<%out.println(e.get("ID"));%>><%out.println(e.get("output"));%></option>
	<%}%>
	</select>
	</label>
	</br>
	</br>
	<input type='submit' class='button' value='Weiter'/>
	<p><%out.println(meldung);%></p>
</form>

</br>
</br>
</br>

<h2>//Neuer Antrag erstellen/Prototyp//</h2>
<p>Bitte nicht mehr benutzen/Deaktiviert</p>
</br>
<form action='neuerAntrag.jsp' method="get"> 
	<input type="hidden" name='antrag_ID' value="50"/>
	<label>ID
	<textarea name="ID" cols="1" rows="1" maxlength="3" wrap="soft"></textarea>
	</label>
	</br>
	<label>name_ID
	<textarea name="name_ID" cols="1" rows="1" maxlength="3" wrap="soft"></textarea>
	</label>
	</br>
	<label>frage_ID_start
	<textarea name="frage_ID_start" cols="1" rows="1" maxlength="3" wrap="soft"></textarea>
	</label>
	</br>
	</br>
	<input type='submit' class='button' value='Weiter und Antrag erstellen'/>
	</br>
</form>

</div>
</div>
  
<jsp:directive.include file='module/footer.jspf' />