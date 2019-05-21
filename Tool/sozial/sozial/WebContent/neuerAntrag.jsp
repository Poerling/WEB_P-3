<%
int menu=1;

%>
<jsp:directive.include file='module/header.jspf' />
<%
if(request.getParameterMap().containsKey("ID")&&request.getParameterMap().containsKey("name_ID")&&request.getParameterMap().containsKey("frage_ID_start")){
int paramID = Integer.parseInt(request.getParameter("ID"));
int paramNameID = Integer.parseInt(request.getParameter("name_ID"));
int paramFrageStartID = Integer.parseInt(request.getParameter("frage_ID_start"));
db.setSQL("INSERT INTO antrag (ID, name_ID, frage_ID_start) VALUES ('"+paramID+"','"+paramNameID+"','"+paramFrageStartID+"');");
db.schreiben();
db.finalize();
//db_daten_01=db.lesenJava();
}
//out.println(paramID);

//int request.getParameter("eingabe"));

%>

<div class='content'>

<h1>AdminTool Sozialleistungsrechner</h1>
<br/>
<div id="inhalt">
<h2>Neuer Antrag erstellen</h2>
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
	<input type='submit' class='button-frage' value='Weiter...'/>
	</br>
</form>

</div>
<div id="optionen">
<h2>Optionen</h2>
<a href="admin.jsp">Zurück zum Hauptmenü</a>
<br/>
</div>
  
<jsp:directive.include file='module/footer.jspf' />