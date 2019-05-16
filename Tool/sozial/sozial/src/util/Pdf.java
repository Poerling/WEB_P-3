package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.TreeSet;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

import fachlogik.AntwortBean;
import fachlogik.FrageBean;



public class Pdf {
	public static void erzeuge(HttpSession session,HttpServletResponse response) throws IOException{
		@SuppressWarnings("unchecked")
		TreeSet<FrageBean> fragen_beantwortet=(TreeSet<FrageBean>) session.getAttribute("fragen_beantwortet");
		if ((fragen_beantwortet==null)||(fragen_beantwortet.size()==0)){
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.print("<!DOCTYPE html>");
			out.print("<html lang='de'>");
			out.print("<head>");
			out.print("<title>Sozialleistungsrechner PDF-Ausgabe</title>");
			out.print("</head>");
			out.print("<body>");
			out.print("<h1 style='color:red;'>Leider wurden noch keine Fragen in dieser Session beantwortet!</h1>");
			out.print("</body>");
			out.print("</html>");
			return;
		}
		response.setContentType("application/pdf");
        PdfWriter writer = new PdfWriter(response.getOutputStream());
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf);
		for(FrageBean frage:fragen_beantwortet){
			long frage_ID = frage.getId();
			long frage_text_ID=frage.getFrage_text_ID();
			String frage_text = frage.getFrage_text();
			long antwort_typ_ID = frage.getAntwort_typ_ID();
			Timestamp zeitstempel = frage.getZeitstempel();
			document.add(new Paragraph("frage_ID: "+frage_ID+", frage_text_ID: "+frage_text_ID+", antwort_typ_ID: "+antwort_typ_ID));
			document.add(new Paragraph("frage_text: "+frage_text));
			document.add(new Paragraph("zeitstempel: "+zeitstempel));
			TreeSet<AntwortBean> antworten = frage.getAntworten();
			if ((antworten==null)||(antworten.size()==0)){
				document.add(new Paragraph("Keine Antworten vorhanden!"));
			}
			else{
				for(AntwortBean antwort:antworten){
					long antwort_ID = antwort.getId();
					long antwort_text_ID = antwort.getAntwort_text_ID();
					String antwort_text = antwort.getAntwort_text();
					document.add(new Paragraph("antwort_ID: "+antwort_ID+", antwort_text_ID: "+antwort_text_ID));
					document.add(new Paragraph("antwort_text: "+antwort_text));
				}
			}
			document.add(new Paragraph("---------------------------------"));
		}
        document.close();
	}
}
