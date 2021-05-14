package model.pdm;

import org.jsoup.select.Elements;

public class Address {
	Elements addr;
	Elements tel;
	Elements page;
	StringBuffer sb;
	
	public Address(Elements addr, Elements tel, Elements page, StringBuffer sb) {
		this.addr = addr;
		this.tel = tel;
		this.page = page;
		this.sb = sb;
	}

	public Elements getAddr() {
		return addr;
	}

	public void setAddr(Elements addr) {
		this.addr = addr;
	}

	public Elements getTel() {
		return tel;
	}

	public void setTel(Elements tel) {
		this.tel = tel;
	}

	public Elements getPage() {
		return page;
	}

	public void setPage(Elements page) {
		this.page = page;
	}

	public StringBuffer getSb() {
		return sb;
	}

	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}
	
	
}
