package fachlogik;

import java.io.Serializable;

public class AntwortBean implements Serializable,Comparable<AntwortBean>{
	private static final long serialVersionUID = 1L;
	private long id=0;
	private long antwort_text_ID=0;
	private String antwort_text;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public long getAntwort_text_ID() {
		return antwort_text_ID;
	}
	public void setAntwort_text_ID(long antwort_text_ID) {
		this.antwort_text_ID = antwort_text_ID;
	}

	public String getAntwort_text() {
		return antwort_text;
	}
	public void setAntwort_text(String antwort_text) {
		this.antwort_text = antwort_text;
	}

	@Override
	public int compareTo(AntwortBean a) {
		if (getId()>a.getId()) return 1;
		if (getId()<a.getId()) return -1;
		return 0;
	}
	
	@Override
	public boolean equals(Object o){
		if (!(o instanceof AntwortBean)) return false;
		return (this.compareTo((AntwortBean)o)==0);
	}
	
	@Override
	public int hashCode(){
		return (""+this.getId()).hashCode();
	}
	
	@Override
	public String toString(){
		String s="";
		s+="  ID: "+getId()+", ";
		s+="  antwort_text_ID: "+getAntwort_text_ID()+", ";
		s+="  antwort_text: "+getAntwort_text()+"\n";
		return s;
	}
}