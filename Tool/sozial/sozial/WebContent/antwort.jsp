<% int menu=2; %>
<jsp:directive.include file='module/header.jspf' />
<div class='content'>

<%


long frage_ID_davor=0;
frage_ID=Long.parseLong(request.getParameter("frage_ID"));
AntworttypEnum frage_antwort_typ=AntworttypEnum.vonZahl(request.getParameter("frage_antwort_typ"));
long frage_text_ID=Long.parseLong(request.getParameter("frage_text_ID"));
boolean ok=false;
String redirect="";

FrageBean frage=new FrageBean();
frage.setId(frage_ID);
frage.setFrage_text_ID(frage_text_ID);
frage.setFrage_text(db.getText(""+frage_text_ID));
frage.setAntwort_typ_ID(frage_antwort_typ.ordinal());
beantwortet.addFrage(session,frage);

if (AntworttypEnum.Auswahl1N.equals(frage_antwort_typ)){
	// 1:N AUSWERTUNG
	long antwort_ID=Long.parseLong(request.getParameter("antwort_ID"));
	long antwort_text_ID=Long.parseLong(request.getParameter("antwort_text_ID"));
	long frage_ID_naechste=Long.parseLong(request.getParameter("frage_ID_naechste"));
	AntwortBean antwort=new AntwortBean();
	antwort.setId(antwort_ID);
	antwort.setAntwort_text_ID(antwort_text_ID);
	antwort.setAntwort_text(db.getText(""+antwort_text_ID));
	frage.addAntwort(antwort);
	redirect="frage.jsp?frage_ID="+frage_ID_naechste;
	ok=true;
}
if (AntworttypEnum.AuswahlNM.equals(frage_antwort_typ)){
	// N:M AUSWERTUNG
	String[] antwort_IDs_string=request.getParameterValues("antwort_ID");
	if(antwort_IDs_string!=null){
		long[] antwort_IDs=new long[antwort_IDs_string.length];
		for(int i=0;i<antwort_IDs_string.length;i++){
			antwort_IDs[i]=Long.parseLong(antwort_IDs_string[i]);	
			db.setSQL("SELECT * FROM antwort_auswahl WHERE antwort_ID="+antwort_IDs[i]+" AND frage_ID="+frage_ID);
			db_daten_01=db.lesenJava();
			if ((db_daten_01!=null)&&(db_daten_01.size()!=0)){
				AntwortBean antwort=new AntwortBean();
				antwort.setId(antwort_IDs[i]);
				long antwort_text_ID=Long.parseLong(db_daten_01.get(0).get("antwort_text_ID"));
				antwort.setAntwort_text_ID(antwort_text_ID);
				antwort.setAntwort_text(db.getText(""+antwort_text_ID));
				frage.addAntwort(antwort);
			}
		} 
		db.setSQL("SELECT * FROM antwort_n_m WHERE frage_ID="+frage_ID+" ORDER BY ID");
		db_daten_01=db.lesenJava();
		if ((db_daten_01==null)||(db_daten_01.size()==0)){
			fehler=154;
			redirect="frage.jsp?frage_ID="+frage_ID+"&fehler="+fehler;
			ok=false;
		} 
		else{
			long frage_ID_default=0;
			for(LinkedHashMap<String, String> datensatz:db_daten_01){


				String regel=datensatz.get("regel");
				
				if ((regel==null)||(regel.trim().length()==0)) continue;				
				long frage_ID_naechste=Long.parseLong(datensatz.get("frage_ID_naechste"));
				if (regel.trim().equals("DEFAULT")){
					frage_ID_default=frage_ID_naechste;
				}
				else{
				    if(Regelwerk.erfuellt(beantwortet, regel)){
				    	redirect="frage.jsp?frage_ID="+frage_ID_naechste;
				    	ok=true;
				    	break;
				    }
				}
						
			}
			if ((!ok)&&(frage_ID_default>0)){
				redirect="frage.jsp?frage_ID="+frage_ID_default;
		    	ok=true;
			}
		} 
	}
	else{
		fehler=155;
		redirect="frage.jsp?frage_ID="+frage_ID+"&fehler="+fehler;
		ok=false;
	}
}
else if (AntworttypEnum.Ganzzahl.equals(frage_antwort_typ)||
	AntworttypEnum.Festkommazahl2.equals(frage_antwort_typ)||
	AntworttypEnum.Datum.equals(frage_antwort_typ)||
	AntworttypEnum.Freitext.equals(frage_antwort_typ)
	){
	// WEITERE AUSWERTUNG
	String antwort_String=request.getParameter("antwort");
	AntwortBean antwort=new AntwortBean();
	antwort.setId(1);
	antwort.setAntwort_text_ID(0); // eine solche Antwort hat keine ID, sie kommt vom Benutzer
	antwort.setAntwort_text(antwort_String);
	frage.addAntwort(antwort);
	db.setSQL("SELECT * FROM antwort_zahl WHERE frage_ID="+frage_ID+" ORDER BY ID");
	db_daten_01=db.lesenJava();
	if ((db_daten_01==null)||(db_daten_01.size()==0)){
		fehler=156;
		redirect="frage.jsp?frage_ID="+frage_ID+"&fehler="+fehler;
		ok=false;
	} 
	else{
		long frage_ID_default=0;
		for(LinkedHashMap<String, String> datensatz:db_daten_01){
			String regel=""+datensatz.get("regel");
			if ((regel==null)||(regel.trim().length()==0)) continue;
			long frage_ID_naechste=Long.parseLong(datensatz.get("frage_ID_naechste"));
			if (regel.trim().equals("DEFAULT")){
				frage_ID_default=frage_ID_naechste;
			}
			else{
			    if(Regelwerk.erfuellt(beantwortet, regel)){
			    	redirect="frage.jsp?frage_ID="+frage_ID_naechste;
			    	ok=true;
			    	break;
			    } 
			}
		}
		if ((!ok)&&(frage_ID_default>0)){
			redirect="frage.jsp?frage_ID="+frage_ID_default;
	    	ok=true;
		}
	}
}
if (!ok) beantwortet.removeFrage(session,frage);
response.sendRedirect(redirect);

%>

<jsp:directive.include file='module/footer.jspf' />