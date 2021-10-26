package user.main;

import java.util.Scanner;

import user.service.UserDeleteService;
import user.service.UserInsertService;
import user.service.UserSearchService;
import user.service.UserSelectService;
import user.service.UserService;
import user.service.UserUpdateService;

public class UserMain {

	public static void main(String[] args) {
		UserMain userMain = new UserMain();
		userMain.menu();
		System.out.println("프로그램을 종료합니다.");

	}

	private void menu() {

		Scanner scan = new Scanner(System.in);
		int num;

		UserService userService = null; // 부모 설정 - 부모는 생성할 필요 없고 참조만 해주면 된다

		while (true) {
			System.out.println();
			System.out.println("*************");
			System.out.println("   1. 입력");
			System.out.println("   2. 출력");
			System.out.println("   3. 수정");
			System.out.println("   4. 삭제");
			System.out.println("   5. 검색");
			System.out.println("   6. 종료");
			System.out.println("*************");
			System.out.print("번호 입력 : ");
			num = scan.nextInt();
			if (num == 6)
				break;

			// 결합도를 낮춰 생성을 해줘라
			if (num == 1)
				userService = new UserInsertService(); //부모 = 자식
			else if (num == 2)
				userService = new UserSelectService(); //부모 = 자식
			else if (num == 3)
				userService = new UserUpdateService();
			else if (num == 4)
				userService = new UserDeleteService();
			else if (num == 5)
				userService = new UserSearchService();
			
			userService.execute(); // 메소드 호출 - insert, select 모두 execute로

		} //while
	}//menu()
}
