package fachlogik;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

public class BeantwortetBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private TreeSet<FrageBean> fragen_beantwortet=null;
	
	public BeantwortetBean(){
		fragen_beantwortet=new TreeSet<FrageBean>();
	}
	
	public BeantwortetBean(HttpSession session){
		this();
		@SuppressWarnings("unchecked")
		TreeSet<FrageBean> fragen_beantwortet=(TreeSet<FrageBean>)session.getAttribute("fragen_beantwortet");
		if (fragen_beantwortet==null){
			fragen_beantwortet=getFragen_beantwortet();
			session.setAttribute("fragen_beantwortet", fragen_beantwortet);
		}
		else{
			setFragen_beantwortet(fragen_beantwortet);
		}
	}
	
	public void addFrage(HttpSession session,FrageBean frage){
		addFrage(frage);
		session.setAttribute("fragen_beantwortet", fragen_beantwortet);
	}
	public void removeFrage(HttpSession session,FrageBean frage){
		removeFrage(frage);
		session.setAttribute("fragen_beantwortet", fragen_beantwortet);
	}
	
	public void addFrage(FrageBean frage){
		if (fragen_beantwortet.contains(frage)) fragen_beantwortet.remove(frage);
		frage.setZeitstempel(new Timestamp(System.currentTimeMillis()));
		fragen_beantwortet.add(frage);
	}
	public void removeFrage(FrageBean frage){
		if (fragen_beantwortet.contains(frage)) fragen_beantwortet.remove(frage);
	}

	public TreeSet<FrageBean> getFragen_beantwortet() {
		return fragen_beantwortet;
	}
	public void setFragen_beantwortet(TreeSet<FrageBean> fragen_beantwortet) {
		this.fragen_beantwortet = fragen_beantwortet;
	}
	public FrageBean getFrage_beantwortet(String frage_ID_string) {
		long frage_ID=Long.parseLong(frage_ID_string.trim());
		for(FrageBean frage:fragen_beantwortet){
			if (frage.getId()==frage_ID) return frage;
		}
		throw new RuntimeException("Frage mit ID "+frage_ID_string+" nicht vorhanden!");
	}

	@Override
	public String toString(){
		String s="";
		if (fragen_beantwortet.size()==0){
			s+="Bislang keine Fragen beantwortet!\n";
		}
		else{
			for(FrageBean frage:fragen_beantwortet){
				s+=""+frage+"\n";
			}
		}
		return s;
	}
}
