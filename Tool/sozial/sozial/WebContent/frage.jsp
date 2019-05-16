<% int menu=2; %>
<jsp:directive.include file='module/header.jspf' />
<%
long frage_ID_davor=0;
long frage_text_ID=0;
String untergrenze_String="0";
String obergrenze_String="0";
String frage_text="";
AntworttypEnum frage_antwort_typ=AntworttypEnum.Undefiniert;
 
String frage_ID_String=request.getParameter("frage_ID");
if (frage_ID_String!=null){
	frage_ID=Long.parseLong(frage_ID_String);
	db.setSQL("SELECT * FROM frage WHERE ID="+frage_ID+";");
	db_daten_01=db.lesenJava();
	untergrenze_String=db_daten_01.get(0).get("untergrenze");
	obergrenze_String=db_daten_01.get(0).get("obergrenze");
	frage_text_ID=Long.parseLong(db_daten_01.get(0).get("frage_text_ID"));
	frage_text=db.getText(""+frage_text_ID);
	frage_antwort_typ=AntworttypEnum.vonZahl(db_daten_01.get(0).get("antwort_typ_ID"));
}
else{
	response.sendRedirect("index.jsp");
}
%>

<div class='content'>

<%
try{ 
	fehler=Long.parseLong(request.getParameter("fehler"));
}
catch (Exception e){}
if (fehler>0){
	out.write("<hr/><h1 style='color:red'>FEHLER: "+db.getText(""+fehler)+"</h1><hr/>");
}
fehler=0;
%>

<h1>Meine Ansprüche überprüfen...</h1>
<br/>
<h2><%=frage_text%></h2>
<br/>

<% 
switch (frage_antwort_typ){
case Auswahl1N:
	db.setSQL("SELECT * FROM antwort_auswahl WHERE frage_ID="+frage_ID+" ORDER BY antwort_ID");
	db_daten_03=db.lesenJava();
	if (db_daten_03!=null){
		for(LinkedHashMap<String, String> datensatz:db_daten_03){
		%>
		<form action='antwort.jsp' method="get"> 
		<input type='hidden' name='frage_ID' value='<%=frage_ID%>'/>
		<input type='hidden' name='frage_text_ID' value='<%=frage_text_ID%>'/>
		<input type='hidden' name='frage_antwort_typ' value='<%=frage_antwort_typ.ordinal()%>'/>
		<input type='hidden' name='antwort_ID' value='<%=datensatz.get("antwort_ID")%>'/>
		<input type='hidden' name='antwort_text_ID' value='<%=datensatz.get("antwort_text_ID")%>'/>
		<input type='hidden' name='frage_ID_naechste' value='<%=datensatz.get("frage_ID_naechste")%>'/>	
		<input type='submit' class='button-frage' value='<%out.write(db.getText(datensatz.get("antwort_text_ID")));%>'/>
		</form>
		<br/>
		<%	
		}
	}
	break;
case AuswahlNM:
	db.setSQL("SELECT * FROM antwort_auswahl WHERE frage_ID="+frage_ID+" ORDER BY antwort_ID");
	db_daten_03=db.lesenJava();
	if (db_daten_03!=null){
		%>
		<form action='antwort.jsp' method="get"> 
		<input type='hidden' name='frage_ID' value='<%=frage_ID%>'/>
		<input type='hidden' name='frage_text_ID' value='<%=frage_text_ID%>'/>
		<input type='hidden' name='frage_antwort_typ' value='<%=frage_antwort_typ.ordinal()%>'/>
		<%
		for(LinkedHashMap<String, String> datensatz:db_daten_03){
		%>
		<label class='checkbox-container'>
			<%out.write(db.getText(datensatz.get("antwort_text_ID")));%>
  			<input type='checkbox' name='antwort_ID' value='<%=datensatz.get("antwort_ID")%>'><span class='checkbox-mark'></span>
		</label>
		<br/>
		<%	
		}
		%>
		<input type='submit' class='button-frage' value='Weiter...'/>
		</form>
		<% 
	}
	break;
case Ganzzahl:
	%>
	<form action='antwort.jsp' method="get"> 
	<input type='hidden' name='frage_ID' value='<%=frage_ID%>'/>
	<input type='hidden' name='frage_text_ID' value='<%=frage_text_ID%>'/>
	<input type='hidden' name='frage_antwort_typ' value='<%=frage_antwort_typ.ordinal()%>'/>
	<input type='number' name='antwort' min='<%=untergrenze_String%>' max='<%=obergrenze_String%>' value='0' step='1'/><br/><br/>
	<input type='submit' class='button-frage' value='Weiter...'/>
	</form>
	<br/>
	<%	
	break;
case Festkommazahl2:
	%>
	<form action='antwort.jsp' method="get"> 
	<input type='hidden' name='frage_ID' value='<%=frage_ID%>'/>
	<input type='hidden' name='frage_text_ID' value='<%=frage_text_ID%>'/>
	<input type='hidden' name='frage_antwort_typ' value='<%=frage_antwort_typ.ordinal()%>'/>
	<input type='number' name='antwort' min='<%=untergrenze_String%>' max='<%=obergrenze_String%>' value='0.0' step='0.01' placeholder='0.00'/><br/><br/>
	<input type='submit' class='button-frage' value='Weiter...'/>
	</form>
	<br/>
	<%
	break;
case Datum:
	%>
	<form action='antwort.jsp' method="get"> 
	<input type='hidden' name='frage_ID' value='<%=frage_ID%>'/>
	<input type='hidden' name='frage_text_ID' value='<%=frage_text_ID%>'/>
	<input type='hidden' name='frage_antwort_typ' value='<%=frage_antwort_typ.ordinal()%>'/>
	<input type='date' name='antwort' min='01.01.1850'/><br/><br/>
	<input type='submit' class='button-frage' value='Weiter...'/>
	</form>
	<br/>
	<%
	break;
case Freitext:
	%>
	<form action='antwort.jsp' method="get"> 
	<input type='hidden' name='frage_ID' value='<%=frage_ID%>'/>
	<input type='hidden' name='frage_text_ID' value='<%=frage_text_ID%>'/>
	<input type='hidden' name='frage_antwort_typ' value='<%=frage_antwort_typ.ordinal()%>'/>
	<textarea name="antwort" cols="50" rows="15" maxlength="10000" wrap="soft"></textarea>
	<input type='submit' class='button-frage' value='Weiter...'/>
	</form>
	<br/>
	<%
	break;
default:
	response.sendRedirect("index.jsp");
}
%>
<jsp:directive.include file='module/footer.jspf' />