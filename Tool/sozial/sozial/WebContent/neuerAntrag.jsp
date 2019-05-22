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
String textParam = "";
String meldung="";
if(request.getParameterMap().containsKey("text")&&(request.getParameter("text")!="")){
	textParam = request.getParameter("text");
	db.setSQL("INSERT INTO `sprache_deutsch`(`text`) VALUES ('"+textParam+"');");
	db.schreiben();

	//Hole ID von gerade erstelltem Text
	db.setSQL("SELECT ID FROM `sprache_deutsch` WHERE text='"+textParam+"';");
	db_daten_01=db.lesenJava();
	String textID="";
	for(LinkedHashMap<String, String> f : db_daten_01){
		textID=f.get("ID");
	}
	response.sendRedirect("neuerAntrag.jsp?ID="+textID+"");
		
}
//Antrag mit ID in der DB-erstellen:	
if(request.getParameterMap().containsKey("ID")&&(request.getParameter("ID")!="")){
	int paramID = Integer.parseInt(request.getParameter("ID"));
	db.setSQL("INSERT INTO antrag (name_ID, frage_ID_start) VALUES ('"+paramID+"','1');");
	db.schreiben();
	db.finalize();
	meldung="Antrag mit ID "+request.getParameter("ID")+" erfolgreich angelegt!";
}

%>

<div class='content'>

<h1>AdminTool Sozialleistungsrechner</h1>
<br/>
<div id="optionen">
<h2>Optionen</h2>
<a href="admin.jsp">Zurück zum Hauptmenü</a>
<br/>
</div>
<div id="inhalt">
<h2>Prototyp: Neuer Antrag erstellen/V.0.0.1</h2>
</br>
<form action='neuerAntrag.jsp' method="get"> 
	<label>Antrag Name: 
	<% if(textParam!="") %>
	<textarea name="text" cols="50" rows="1" maxlength="5000" wrap="soft"><%out.print(textParam);%></textarea>
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