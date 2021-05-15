package ParkDaeMinProject1;

public class DaeMinParkProject1App {

	public static void main(String[] args) {

		DaeMinParkProject1Logic logic = new DaeMinParkProject1Logic();
		while(true) {
			logic.printMainMenu();
			int mainMenu = logic.getMenuNumber();
			logic.seperarteMainMenu(mainMenu);
		}///while
	}/////
}///////
