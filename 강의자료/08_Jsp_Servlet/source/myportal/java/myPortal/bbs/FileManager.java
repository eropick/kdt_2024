package myPortal.bbs;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileManager {
	//private static final long serialVersionUID = 1L;
	static final String CHARSET="UTF-8";
	static final String ATTACHES_DIR = "c:\\java\\temp";
	public String fileName="";
	int fileSize=0;
	public void fileUpload( HttpServletRequest req) throws 
			IOException, ServletException {
		
		fileUpload(req,ATTACHES_DIR );
	}
	public void fileUpload( HttpServletRequest req, String targetDir) throws 
	IOException, ServletException {
		Collection<Part> parts = req.getParts();
		for(Part part : parts) {
			fileSize = (int)part.getSize();
			if(part.getHeader("Content-Disposition").contains("filename=")){
				fileName= extractFileName(part.getHeader("Content-Disposition"));
				if(part.getSize()>0){
					//System.out.printf("업로드 파일 명 : %s  \n", fileName);
					part.write(targetDir + File.separator + fileName);
					part.delete();
				}
			} 
		}
	}
	
	
	private String extractFileName(String parHeader) {
		for (String cd: parHeader.split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf("=") + 1).trim().replace("\"","");
				int index = fileName.lastIndexOf(File.separator);
				return fileName.substring( index + 1);
			}
		}
		return null;
	}
}
