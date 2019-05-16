package fachlogik;

public class Test {
	
	public static BeantwortetBean generiere(){
		BeantwortetBean bab=new BeantwortetBean();
		long id=1;
		
		FrageBean fb;
		AntwortBean ab;
		
		fb=new FrageBean();
		fb.setId(id++);
		fb.setAntwort_typ_ID(1); // 1:n: 3 geantwortet
		ab=new AntwortBean();
		ab.setId(3);
		fb.addAntwort(ab);
		bab.addFrage(fb);

		fb=new FrageBean();
		fb.setId(id++);
		fb.setAntwort_typ_ID(1); // 1:n: 4 geantwortet
		bab.addFrage(fb);
		ab=new AntwortBean();
		ab.setId(4);
		fb.addAntwort(ab);
		bab.addFrage(fb);
		
		fb=new FrageBean();
		fb.setId(id++);
		fb.setAntwort_typ_ID(2); // n:m: 2,3 geantwortet
		ab=new AntwortBean();
		ab.setId(2);
		fb.addAntwort(ab);
		ab=new AntwortBean();
		ab.setId(3);
		fb.addAntwort(ab);
		bab.addFrage(fb);

		fb=new FrageBean();
		fb.setId(id++);
		fb.setAntwort_typ_ID(2); // n:m: 1,5,6 geantwortet
		ab=new AntwortBean();
		ab.setId(1);
		fb.addAntwort(ab);
		ab=new AntwortBean();
		ab.setId(5);
		fb.addAntwort(ab);
		ab=new AntwortBean();
		ab.setId(6);
		fb.addAntwort(ab);
		bab.addFrage(fb);

		fb=new FrageBean();
		fb.setId(id++);
		fb.setAntwort_typ_ID(3); // Ganzzahl: 536
		ab=new AntwortBean();
		ab.setAntwort_text("536");
		fb.addAntwort(ab);
		bab.addFrage(fb);
		
		fb=new FrageBean();
		fb.setId(id++);
		fb.setAntwort_typ_ID(4); // Festkomma 2 Stellen: 123,45
		ab=new AntwortBean();
		ab.setAntwort_text("123,45");
		fb.addAntwort(ab);
		bab.addFrage(fb);
		
		fb=new FrageBean();
		fb.setId(id++);
		fb.setAntwort_typ_ID(5); // Datum: 12.03.2018
		ab=new AntwortBean();
		ab.setAntwort_text("12.03.2018");
		fb.addAntwort(ab);
		bab.addFrage(fb);

		return bab;
	}

	public static void main(String[] args) {
		BeantwortetBean bab=generiere();
	}

}
