package util;

public class Common {
	//내부 클래스
	
	public static final String ADMIN_PATH = "/WEB-INF/views/admin/";
	public static final String USER_PATH = "/WEB-INF/views/user/";
	public static final String PRODUCT_PATH = "/WEB-INF/views/product/";
	public static final String POPUP_PATH = "/WEB-INF/views/popup_Shop/";
	
	//일반 게시판 전용 클래스
	public static class Board{
		//한페이지에 보여줄 게시물 갯수
		public final static int BLOCKLIST = 5;
		
		//페이지 메뉴 수
		//<- 1 2 3 ->
		public final static int BLOCKPAGE = 3;
	}
	
	//공지사항 게시판
	public static class Notice{
		
		//한페이지에 보여줄 게시물 갯수
		public final static int BLOCKLIST = 20;
		
		//페이지 메뉴 수
		//<- 1 2 3 4 5 ->
		public final static int BLOCKPAGE = 5;
		
	}
	
}
