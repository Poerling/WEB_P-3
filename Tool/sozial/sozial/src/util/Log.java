package util;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Log implements Serializable{
	private static final long serialVersionUID = 1L;

	private static BufferedWriter bw;
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd-hh:mm:ss:S");
	static{
		try {
			bw = new BufferedWriter(new FileWriter("C:/sozial.log"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void schreibe(String text){
		try {
			bw.write("LOG <"+sdf.format(new Date())+">:\n"+text+"\n");
			bw.flush();
		} catch (IOException e) {}
	}
}
