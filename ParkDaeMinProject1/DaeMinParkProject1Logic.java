package ParkDaeMinProject1;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.util.TreeMap;
import java.util.Vector;
import common.utility.CommonUtilities;

public class DaeMinParkProject1Logic {
	Map<Character, List<Address>> addressBook = 
			new TreeMap<Character, List<Address>>();
	List<Address> ri = new Vector<Address>();
	List<Address> si = new Vector<Address>();
	List<Address> ei = new Vector<Address>();
	List<Address> fi = new Vector<Address>();
	List<Address> ai = new Vector<Address>();
	List<Address> qi = new Vector<Address>();
	List<Address> ti = new Vector<Address>();
	List<Address> di = new Vector<Address>();
	List<Address> wi = new Vector<Address>();
	List<Address> ci = new Vector<Address>();
	List<Address> zi = new Vector<Address>();
	List<Address> xi = new Vector<Address>();
	List<Address> vi = new Vector<Address>();
	List<Address> gi = new Vector<Address>();

	public void printMainMenu() {
		System.out.println("==============메인 메뉴==============");
		System.out.println("1.입력 2.출력 3.수정 4.삭제 5.검색 9.종료");
		System.out.println("===================================");
		System.out.println("메인 메뉴번호를 입력하세요.");
	}///// printMainMenu()

	public int getMenuNumber() {
		Scanner sc = new Scanner(System.in);
		String mainMenu;
		while (true) {
			mainMenu = sc.nextLine();
			boolean check = false;
			if (!CommonUtilities.isNumber(mainMenu)) {
				System.out.println("숫자만 입력하세요.");
				check = true;
			}
			if (check) {
				continue;
			}
			break;
		}
		return Integer.parseInt(mainMenu);
	}////// getMenuNumber

	public void seperarteMainMenu(int mainMenu) {
		switch (mainMenu) {
		case 1:
			setAddress();
			break;
		case 2:
			printAddress();
			break;
		case 3:
			updateAddress();
			break;
		case 4:
			deleteAddress();
			break;
		case 5:
			searchAddress();
			break;
		case 9:
			System.out.println("종료합니다.");
			System.exit(9);
			break;
		default:
			System.out.println("메뉴에 없는 번호 입니다.");
		}//// switch
	}
	
	public void setAddress() {
		Scanner sc = new Scanner(System.in);
		System.out.println("이름을 입력하세요.");
		String name = sc.nextLine();
		System.out.println("나이를 입력하세요.");
		String age;
		while (true) {
			age = sc.nextLine();
			boolean check = false;
			if (!CommonUtilities.isNumber(age)) {
				System.out.println("숫자만 입력하세요.");
				System.out.println("나이를 입력하세요.");
				check = true;
			}
			if (check) {
				continue;
			}
			break;
		}
		System.out.println("주소를 입력하세요");
		String addr = sc.nextLine();
		System.out.println("전화번호를 입력하세요");
		String contact = sc.nextLine();
		if (name.codePointAt(0) >= '가' && name.codePointAt(0) < '나') {
			ri.add(new Address(name, age, addr, contact));
			addressBook.put('ㄱ', ri);
		} else if (name.codePointAt(0) >= '나' && name.codePointAt(0) < '다') {
			si.add(new Address(name, age, addr, contact));
			addressBook.put('ㄴ', si);
		} else if (name.codePointAt(0) >= '다' && name.codePointAt(0) < '라') {
			ei.add(new Address(name, age, addr, contact));
			addressBook.put('ㄷ', ei);
		} else if (name.codePointAt(0) >= '라' && name.codePointAt(0) < '마') {
			fi.add(new Address(name, age, addr, contact));
			addressBook.put('ㄹ', fi);
		} else if (name.codePointAt(0) >= '마' && name.codePointAt(0) < '바') {
			ai.add(new Address(name, age, addr, contact));
			addressBook.put('ㅁ', ai);
		} else if (name.codePointAt(0) >= '바' && name.codePointAt(0) < '사') {
			qi.add(new Address(name, age, addr, contact));
			addressBook.put('ㅂ', qi);
		} else if (name.codePointAt(0) >= '사' && name.codePointAt(0) < '아') {
			ti.add(new Address(name, age, addr, contact));
			addressBook.put('ㅅ', ti);
		} else if (name.codePointAt(0) >= '아' && name.codePointAt(0) < '자') {
			di.add(new Address(name, age, addr, contact));
			addressBook.put('ㅇ', di);
		} else if (name.codePointAt(0) >= '자' && name.codePointAt(0) < '차') {
			wi.add(new Address(name, age, addr, contact));
			addressBook.put('ㅈ', wi);
		} else if (name.codePointAt(0) >= '차' && name.codePointAt(0) < '카') {
			ci.add(new Address(name, age, addr, contact));
			addressBook.put('ㅊ', ci);
		} else if (name.codePointAt(0) >= '카' && name.codePointAt(0) < '타') {
			zi.add(new Address(name, age, addr, contact));
			addressBook.put('ㅋ', zi);
		} else if (name.codePointAt(0) >= '타' && name.codePointAt(0) < '파') {
			xi.add(new Address(name, age, addr, contact));
			addressBook.put('ㅌ', xi);
		} else if (name.codePointAt(0) >= '파' && name.codePointAt(0) < '하') {
			vi.add(new Address(name, age, addr, contact));
			addressBook.put('ㅍ', vi);
		} else if (name.codePointAt(0) >= '하' && name.codePointAt(0) <= '힣') {
			gi.add(new Address(name, age, addr, contact));
			addressBook.put('ㅎ', gi);
		} else
			System.out.println("성은 한글로 입력 바랍니다.");
	}

	public void printAddress() {
		Set<Character> keys = addressBook.keySet();
		for (Character key : keys) {
			List<Address> vals = addressBook.get(key);
			System.out.println(String.format("[%s로 시작하는 명단]", key));
			Collections.sort(vals);
			for (Address val : vals)
				val.print();
		}
	}

	private Address findPersonByName(String title) {
		System.out.println(title + "할 이름을 입력하세요.");
		Scanner sc = new Scanner(System.in);
		String name = sc.nextLine();
		Set<Character> keys = addressBook.keySet();
		for (Character key : keys) {
			List<Address> vals = addressBook.get(key);
			for (Address val : vals) {
				if (val.name.equals(name)) {
					return val;
				}
			}
		}
		System.out.println(name + "으로 검색된 정보가 없어요.");
		return null;
	}//////// findPersonByName

	private void updateAddress() {
		Address findPerson = findPersonByName("수정");
		if (findPerson != null) {
			Scanner sc = new Scanner(System.in);
			System.out.println("몇 살로 수정하시겠습니까?");
			while (true) {
				findPerson.age = sc.nextLine();
				boolean check = false;
				if (!CommonUtilities.isNumber(findPerson.age)) {
					System.out.println("숫자만 입력하세요.");
					System.out.println("나이를 입력하세요.");
					check = true;
				}
				if (check) {
					continue;
				}
				break;
			}
			System.out.println("주소를 어떻게 수정하시겠습니까?");
			findPerson.addr = sc.nextLine();
			System.out.println("연락처를 어떻게 수정하시겠습니까?");
			findPerson.contact = sc.nextLine();
			System.out.printf("[%s가 아래와 같이 수정이 완료 됐습니다.]%n", findPerson.name);
			findPerson.print();
		}
	}

	private void deleteAddress() {
		Address findPerson = findPersonByName("삭제");
		if (findPerson != null) {
			Set<Character> keys = addressBook.keySet();
			for (Character key : keys) {
				List<Address> vals = addressBook.get(key);
				for (Address val : vals) {
					if (findPerson.equals(val)) {
						vals.remove(val);
						System.out.printf("[%s가 삭제되었습니다.]%n", findPerson.name);
						break;
					}
				}
			}
		}
	}

	private void searchAddress() {
		Address findPerson = findPersonByName("검색");
		if (findPerson != null) { // 찾은 사람의 정보 출력
			System.out.printf("[%s로 검색한 결과]%n", findPerson.name);
			findPerson.print();
		}
	}
}/////////
