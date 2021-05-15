package ParkDaeMinProject1;

class Address implements Comparable<Address>{
	String name;
	String age;
	String addr;
	String contact;
	char abc;
	public Address() 
		
	}
	public Address(String name, String age, String addr, String contact) {
		super();
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.contact = contact;
	}
	
	public String get() {
		return String.format("이름:%s,나이:%s,주소:%s,연락처:%s",name,age,addr,contact);
	}
	public void print() {
		System.out.println(get());
	}
	
	@Override
	public int compareTo(Address target) {
		return this.name.compareTo(target.name);
	}
	
	
}///Address

