package fachlogik;

import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import bsh.Interpreter;
import util.Log;

public class Regelwerk {
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("dd.mm.yyyy", Locale.GERMAN);
	private static Pattern pD = Pattern.compile("[0-9]{2}\\.[0-9]{2}\\.[0-9]{4}");
	private static Pattern p1 = Pattern.compile("F[0-9]+[^A]");
	
	public static boolean erfuellt(BeantwortetBean bab,String regel){
		try{
			Interpreter interpreter = new Interpreter(); 
			regel="x = "+regel;
			
			// 1:N oder N:M
			Pattern p2 = Pattern.compile("F[0-9]+A[0-9]+");
		    Matcher m2 = p2.matcher(regel);
		    while (m2.find()) {
		        String F_ganz = m2.group();
		        String[] FA=F_ganz.split("A");
		        String F = FA[0].substring(1,FA[0].length());
		        String A = FA[1];
		        boolean antwort_ID_vorhanden=false;
		        try{
			    	AntwortBean ab=bab.getFrage_beantwortet(F).getAntwort(A);
			    	antwort_ID_vorhanden=(A.equals(""+ab.getId()));
		        }
		        catch (Exception e){}
		        if (antwort_ID_vorhanden)
		        	regel=regel.replace(F_ganz, "true");
		        else
		        	regel=regel.replace(F_ganz, "false");
		    }
			
			// Zahl oder Datum
		    Matcher m1 = p1.matcher(regel);
		    while (m1.find()) {
		    	String F_ganz = m1.group().trim();
		    	String F = F_ganz.substring(1,F_ganz.length()).trim();
		    	String antwort=bab.getFrage_beantwortet(F).getErsteAntwort().getAntwort_text().trim();
		    	Matcher mD = pD.matcher(antwort);
		    	if (mD.matches()) // Datum als gegebene Antwort durch Timestamp ersetzen
			    	regel=regel.replace(F_ganz,""+sdf.parse(antwort).getTime()+"L");
		    	else // Zahl als gegebene Antwort einsetzen
			    	regel=regel.replace(F_ganz, antwort);
		    }
		    Matcher mD = pD.matcher(regel);
		    while (mD.find()) { // vorgegebene Datumswerte der Regel durch Timestamp ersetzen
		    	String datum = mD.group().trim();
		    	regel=regel.replace(datum,""+sdf.parse(datum).getTime()+"L");
		    }

		    regel=regel.replace(",",".");
		    Log.schreibe("REGEL EVAL: "+regel);
		    interpreter.eval(regel);
		    return ((""+interpreter.get("x")).equals(""+true));
		}
		catch (Exception e){
			e.printStackTrace();
			return false;
		}
	}
}