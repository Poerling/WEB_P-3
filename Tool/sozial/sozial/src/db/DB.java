package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DB {
	private PreparedStatement ps=null;
	private Connection con=null;
	private int counter_prepared=1;
	
	public DB() throws Exception{
		try {
			if (Zugangsdaten.pool.length()>0){ // Zugang ueber Glassfish Pool
				InitialContext ctx=new InitialContext(); 
				DataSource myDataSource=(DataSource)ctx.lookup(Zugangsdaten.pool);				
				con=myDataSource.getConnection();
			}
			else{ // JDBC direkt unter Verwendung vorhandener Zugangsdaten
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				String kommando=
						"jdbc:mysql://localhost/"+Zugangsdaten.db+
						"?user="+Zugangsdaten.user+
						"&password="+Zugangsdaten.pass;
				con = DriverManager.getConnection(kommando);
			}
		} catch (Exception e) {
			throw e;
		//	e.printStackTrace();
		//	throw new RuntimeException("Der DB-Zugang ist nicht vorhanden!");
		} 
	}
	
	public DB(String sql) throws Exception{
		this();
		setSQL(sql);
	}
		
	// JDBC direkt unter Angabe der Zugangsdaten
	public DB(String db,String user,String pass){
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String kommando=
					"jdbc:mysql://localhost/"+db+
					"?user="+Zugangsdaten.user+
					"&password="+Zugangsdaten.pass;
			con = DriverManager.getConnection(kommando);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("Der DB-Zugang ist nicht vorhanden!");
		} 
	}
	
	public void setSQL(String sql){
		try {
			System.out.println("SQL:"+sql);
			if ((sql==null)||(sql.length()==0)) return;
			counter_prepared=1;
			ps=con.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("SQL-Fehler: "+e.getMessage());
		} 
	}
	
	public void close(){
		finalize();
	}
	
	public void setString(char c){
		try {
			setString(""+c);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB setString '"+c+"': "+e.getMessage());
		}
	}
	public void setString(String s){
		try {
			ps.setString(counter_prepared++,s);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB setString '"+s+"': "+e.getMessage());
		}
	}

	public void setInt(char c){
		try {
			setInt(Integer.parseInt(""+c));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB setInt '"+c+"': "+e.getMessage());
		}
	}
	public void setInt(String s){
		try {
			setInt(Integer.parseInt(s));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB setInt '"+s+"': "+e.getMessage());
		}
	}
	public void setInt(int i){
		try {
			ps.setInt(counter_prepared++,i);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB setInt '"+i+"': "+e.getMessage());
		}
	}

	public void setDouble(String s){
		try {
			setDouble(Double.parseDouble(s));
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB setDouble '"+s+"': "+e.getMessage());
		}
	}
	public void setDouble(double d){
		try {
			ps.setDouble(counter_prepared++,d);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB setDouble '"+d+"': "+e.getMessage());
		}
	}
	
	public void schreiben(){
		try {
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB schreiben: "+e.getMessage());
		}
	}
	
	public ArrayList<LinkedHashMap<String, String>> lesenJava() {
		try {
			return konvertiereJava(ps.executeQuery());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB lesenJava: "+e.getMessage());
		}
	}

	public String lesenXML() {
		try {
			return konvertiereXML(ps.executeQuery());
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("DB lesenXML: "+e.getMessage());
		}
	}
	
	public static ArrayList<LinkedHashMap<String, String>> konvertiereJava(ResultSet rs) throws SQLException {
		ArrayList<LinkedHashMap<String, String>> daten=new ArrayList<>();
		int anz_spalten=rs.getMetaData().getColumnCount();
		if (anz_spalten==0) return daten;
		while (rs.next()) {
			LinkedHashMap<String, String> datensatz=new LinkedHashMap<>();
			for (int i=1;i<=anz_spalten;i++) {
				String name=rs.getMetaData().getColumnLabel(i);
				String wert=rs.getString(name);
				if (wert!=null)
					datensatz.put(name,wert);					
				else
					datensatz.put(name,"");					
			}
			daten.add(datensatz);
		}
		return daten;
	}
	
	
	public static String konvertiereXML(ResultSet rs) throws SQLException {
		StringBuffer sb=new StringBuffer();
		int anz_spalten=rs.getMetaData().getColumnCount();
		if (anz_spalten==0) return "<daten/>\n";
		sb.append("<daten>\n");
		while (rs.next()) {
			sb.append("<datensatz>\n");
			for (int i=1;i<=anz_spalten;i++) {
				String name=rs.getMetaData().getColumnLabel(i);
				String wert=rs.getString(name);
				if (wert!=null)
					sb.append("<"+name+">"+wert+"</"+name+">\n");
				else
					sb.append("<"+name+"></"+name+">\n");
			}
			sb.append("</datensatz>\n");
		}
		sb.append("</daten>\n");
		return sb.toString();
	}
	
	@Override
	public void finalize(){
		counter_prepared=1;
		try {
			ps.close();
		} catch (Exception e) {}
		ps=null;
		try {
			con.close();
		} catch (Exception e) {}
		con=null;
	}
	
	// Zusatzfunktionen der Anwendung

	public String getText(String nummer){
		setSQL("SELECT * FROM sprache_deutsch WHERE ID="+nummer);
		ArrayList<LinkedHashMap<String, String>> daten = lesenJava();
		return daten.get(0).get("text");
	}
	
	
}