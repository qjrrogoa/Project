package model.pdm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtils {
	//파일 업로드 로직]
	public static MultipartRequest upload(HttpServletRequest req,String saveDirectory) {
		MultipartRequest mr= null;
		try {
			mr = new MultipartRequest(req, saveDirectory,1024*10000,"UTF-8",new DefaultFileRenamePolicy());
		}
		catch(Exception e) {e.printStackTrace();}
		return mr;
	}/////////////

	
	//파일 삭제 로직]
	public static void deleteFile(HttpServletRequest req, String uploadPath, String attachFile) {
		//서버의 물리적 경로 얻기]
		String saveDirectory = req.getServletContext().getRealPath(uploadPath);
		//파일 객체 생성]
		File file = new File(saveDirectory+File.separator+attachFile);
		//파일 존재 여부 판단후 삭제]
		if(file.exists()) file.delete();
	}/////////////////

	
	
}
