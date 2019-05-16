package fachlogik;

public enum AntworttypEnum {
	Undefiniert,Auswahl1N,AuswahlNM,Ganzzahl,Festkommazahl2,Datum,Freitext;

	public static AntworttypEnum vonZahl(String zahlString){
		try{
			return AntworttypEnum.values()[Integer.parseInt(zahlString)];
		}
		catch (Exception e){
			return AntworttypEnum.Undefiniert;
		}
		
	}
}
