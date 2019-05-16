package fachlogik;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.TreeSet;

public class FrageBean implements Serializable,Comparable<FrageBean>{
	private static final long serialVersionUID = 1L;
	private long id;
	private long frage_text_ID;
	private String frage_text;
	private long antwort_typ_ID;
	private TreeSet<AntwortBean> antworten=new TreeSet<AntwortBean>();
	private Timestamp zeitstempel;

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	public long getFrage_text_ID() {
		return frage_text_ID;
	}
	public void setFrage_text_ID(long frage_text_ID) {
		this.frage_text_ID = frage_text_ID;
	}

	public String getFrage_text() {
		return frage_text;
	}
	public void setFrage_text(String frage_text) {
		this.frage_text = frage_text;
	}

	public long getAntwort_typ_ID() {
		return antwort_typ_ID;
	}
	public void setAntwort_typ_ID(long antwort_typ_ID) {
		this.antwort_typ_ID = antwort_typ_ID;
	}
	
	public Timestamp getZeitstempel() {
		return zeitstempel;
	}
	public void setZeitstempel(Timestamp zeitstempel) {
		this.zeitstempel = zeitstempel;
	}
	
	public void addAntwort(AntwortBean antwort){
		antworten.add(antwort);
	}
	
	public TreeSet<AntwortBean> getAntworten() {
		return antworten;
	}
	public void setAntworten(TreeSet<AntwortBean> antworten) {
		this.antworten = antworten;
	}
	public AntwortBean getErsteAntwort() { // sinnvoll, wenn nur 1 Antwort da sein kann wie bei einer Zahl
		for(AntwortBean antwort:antworten){
			return antwort;
		}
		throw new RuntimeException("Keine Antwort vorhanden!");
	}
	public AntwortBean getAntwort(String antwort_ID_string) {
		long antwort_ID=Long.parseLong(antwort_ID_string.trim());
		for(AntwortBean antwort:antworten){
			if (antwort.getId()==antwort_ID) return antwort;
		}
		throw new RuntimeException("Antwort mit ID "+antwort_ID_string+" in der Frage mit ID "+getId()+" nicht vorhanden!");
	}

	@Override
	public int compareTo(FrageBean f) {
		if (getId()>f.getId()) return 1;
		if (getId()<f.getId()) return -1;
		return 0;
	}
	
	@Override
	public boolean equals(Object o){
		if (!(o instanceof FrageBean)) return false;
		return (this.compareTo((FrageBean)o)==0);
	}
	
	@Override
	public int hashCode(){
		return (""+this.getId()).hashCode();
	}
	
	@Override
	public String toString(){
		String s="Antwort ";
		s+="ID: "+getId()+", ";
		s+="Zeit: "+getZeitstempel()+", ";
		s+="frage_text_ID: "+getFrage_text_ID()+", ";
		s+="frage_text: "+getFrage_text()+", ";
		s+="antwort_typ_ID: "+getAntwort_typ_ID()+"\n";
		s+="Antworten:\n";
		if (antworten.size()==0){
			s+="  ---\n";
		}
		else{
			for(AntwortBean antwort:antworten){
				s+=""+antwort+"\n";
			}
		}
		return s;
	}

}
