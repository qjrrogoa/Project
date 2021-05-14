package controller.pdm;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.Elements;

import model.pdm.Address;

public class UlsanController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			List<Address> list = new Vector<Address>();
			Address address = null;
			
			Document doc = Jsoup.connect("https://tour.ulsan.go.kr/board/view.ulsan?boardId=ATTRACTION&menuCd=DOM_000000102005000000&orderBy=DATA_TITLE%20ASC&startPage=1&categoryCode1=C005&dataSid=143#1").get();
	     	List<TextNode> texts1= doc.select("#tabCont0").textNodes();
	     	Elements addr1 = doc.select("#tabCont0 > table > tbody > tr:nth-child(1) > td");
	     	Elements tel1 = doc.select("#tabCont0 > table > tbody > tr:nth-child(2) > td");
	     	Elements page1 = doc.select("#tabCont0 > table > tbody > tr:nth-child(3) > td > a");
	     	StringBuffer sb1 = new StringBuffer();
	      	for(TextNode text1:texts1){
	      		sb1.append(text1+"<br/><br/>");
	      	}
	      	list.add(new Address(addr1,tel1,page1,sb1));
	      	
	      	
	      	doc = Jsoup.connect("https://tour.ulsan.go.kr/board/view.ulsan?boardId=ATTRACTION&menuCd=DOM_000000102005000000&orderBy=DATA_TITLE:ASC&startPage=1&categoryCode1=C005&dataSid=88").get();
	      	List<TextNode> texts2= doc.select("#tabCont0").textNodes();
	      	Elements addr2 = doc.select("#tabCont0 > table > tbody > tr:nth-child(1) > td");
	      	Elements tel2 = doc.select("#tabCont0 > table > tbody > tr:nth-child(2) > td");
	      	Elements page2 = doc.select("#tabCont0 > table > tbody > tr:nth-child(3) > td > a");
	      	StringBuffer sb2 = new StringBuffer();
	      	for(TextNode text2:texts2){
	      		sb2.append(text2+"<br/><br/>");
	      	}
	      	
	      	list.add(new Address(addr2,tel2,page2,sb2));
	      	
	      	
	      	
	      	doc = Jsoup.connect("https://tour.ulsan.go.kr/board/view.ulsan?boardId=ATTRACTION&menuCd=DOM_000000102003000000&orderBy=DATA_TITLE:ASC&startPage=1&categoryCode1=C003&dataSid=80").get();
	      	List<TextNode> texts3= doc.select("#tabCont0").textNodes();
	      	Elements addr3 = doc.select("#tabCont0 > table > tbody > tr:nth-child(1) > td");
	      	Elements tel3 = doc.select("#tabCont0 > table > tbody > tr:nth-child(2) > td");
	      	Elements page3 = doc.select("#tabCont0 > table > tbody > tr:nth-child(3) > td > a");
	      	StringBuffer sb3 = new StringBuffer();
	      	for(TextNode text3:texts3){
	      		sb3.append(text3+"<br/><br/>");
	      	}
	      	
	      	list.add(new Address(addr3,tel3,page3,sb3));
	      	
	      
	      	doc = Jsoup.connect("https://tour.ulsan.go.kr/board/view.ulsan?boardId=ATTRACTION&menuCd=DOM_000000102003000000&orderBy=DATA_TITLE:ASC&startPage=1&categoryCode1=C003&dataSid=119").get();
	      	List<TextNode> texts4= doc.select("#tabCont0").textNodes();
	      	Elements addr4 = doc.select("#tabCont0 > table > tbody > tr:nth-child(1) > td");
	      	Elements tel4 = doc.select("#tabCont0 > table > tbody > tr:nth-child(2) > td");
	      	Elements page4 = doc.select("#tabCont0 > table > tbody > tr:nth-child(3) > td > a");
	      	StringBuffer sb4 = new StringBuffer();
	      	for(TextNode text4:texts4){
	      		sb4.append(text4+"<br/><br/>");
	      	}
	      	
	      	list.add(new Address(addr4,tel4,page4,sb4));
	      	
	      	doc = Jsoup.connect("https://tour.ulsan.go.kr/board/view.ulsan?boardId=ATTRACTION&menuCd=DOM_000000102005000000&orderBy=DATA_TITLE:ASC&startPage=1&categoryCode1=C005&dataSid=140").get();
	      	List<TextNode> texts5= doc.select("#tabCont0").textNodes();
	      	Elements addr5 = doc.select("#tabCont0 > table > tbody > tr:nth-child(1) > td");
	      	Elements tel5 = doc.select("#tabCont0 > table > tbody > tr:nth-child(2) > td");
	      	Elements page5 = doc.select("#tabCont0 > table > tbody > tr:nth-child(3) > td > a");
	      	StringBuffer sb5 = new StringBuffer();
	      	for(TextNode text5:texts5){
	      		sb5.append(text5+"<br/><br/>");
	      	}
	      	
	      	list.add(new Address(addr5,tel5,page5,sb5));
	      	
	      	doc = Jsoup.connect("https://tour.ulsan.go.kr/board/view.ulsan?boardId=ATTRACTION&menuCd=DOM_000000102006000000&orderBy=DATA_TITLE%20ASC&startPage=1&categoryCode1=C006&dataSid=527").get();
	      	List<TextNode> texts6= doc.select("#tabCont0").textNodes();
	      	Elements addr6 = doc.select("#tabCont0 > table > tbody > tr:nth-child(1) > td");
	      	Elements tel6 = doc.select("#tabCont0 > table > tbody > tr:nth-child(2) > td");
	      	Elements page6 = doc.select("#tabCont0 > table > tbody > tr:nth-child(3) > td > a");
	      	StringBuffer sb6 = new StringBuffer();
	      	for(TextNode text6:texts6){
	      		sb6.append(text6+"<br/><br/>");
	      	}
	      	
	      	list.add(new Address(addr6,tel6,page6,sb6));
	      	
	      	doc = Jsoup.connect("https://tour.ulsan.go.kr/board/view.ulsan?boardId=ATTRACTION&menuCd=DOM_000000102006000000&orderBy=DATA_TITLE%20ASC&startPage=1&categoryCode1=C006&dataSid=374").get();
	      	List<TextNode> texts7= doc.select("#tabCont0").textNodes();
	      	Elements addr7 = doc.select("#tabCont0 > table > tbody > tr:nth-child(1) > td");
	      	Elements tel7 = doc.select("#tabCont0 > table > tbody > tr:nth-child(2) > td");
	      	Elements page7 = doc.select("#tabCont0 > table > tbody > tr:nth-child(3) > td > a");
	      	StringBuffer sb7 = new StringBuffer();
	      	for(TextNode text7:texts7){
	      		sb7.append(text7+"<br/><br/>");
	      	}
	      	
	      	list.add(new Address(addr7,tel7,page7,sb7));
	      	
	      	doc = Jsoup.connect("https://tour.ulsan.go.kr/board/view.ulsan?boardId=ATTRACTION&dataSid=360&menuCd=DOM_000000101004001001&contentsSid=647&cpath=").get();
	      	List<TextNode> texts8= doc.select("#tabCont0").textNodes();
	      	Elements addr8 = doc.select("#tabCont0 > table > tbody > tr:nth-child(1) > td");
	      	Elements tel8 = doc.select("#tabCont0 > table > tbody > tr:nth-child(2) > td");
	      	Elements page8 = doc.select("#tabCont0 > table > tbody > tr:nth-child(3) > td > a");
	      	StringBuffer sb8 = new StringBuffer();
	      	for(TextNode text8:texts8){
	      		sb8.append(text8+"<br/><br/>");
	      	}
	      	
	      	list.add(new Address(addr8,tel8,page8,sb8));
	      	
	      	doc = Jsoup.connect("https://tour.ulsan.go.kr/board/view.ulsan?boardId=ATTRACTION&menuCd=DOM_000000102003000000&orderBy=DATA_TITLE:ASC&startPage=1&categoryCode1=C003&dataSid=392").get();
	      	List<TextNode> texts9= doc.select("#tabCont0 > p").textNodes();
	      	Elements addr9 = doc.select("#tabCont0 > table > tbody > tr:nth-child(1) > td");
	      	Elements tel9 = doc.select("#tabCont0 > table > tbody > tr:nth-child(2) > td");
	      	Elements page9 = doc.select("#tabCont0 > table > tbody > tr:nth-child(3) > td > a");
	      	StringBuffer sb9 = new StringBuffer();
	      	for(TextNode text9:texts9){
	      		sb9.append(text9+"<br/><br/>");
	      	}
	      	
	      	list.add(new Address(addr9,tel9,page9,sb9));
	      	
	      	
	      	req.setAttribute("list",list);
	      	req.getRequestDispatcher("/Pdm/Ulsan2.jsp").forward(req, resp);
	}

	
}	
