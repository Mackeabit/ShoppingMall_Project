package util;
/*
        nowPage:현재페이지
        rowTotal:전체데이터갯수
        blockList:한페이지당 게시물수
        blockPage:한화면에 나타낼 페이지 메뉴 수
 */
public class Paging {
	public static String getPaging(String pageURL,int nowPage, int rowTotal,int blockList, int blockPage){
		
		int totalPage/*전체페이지수*/,
            startPage/*시작페이지번호*/,
            endPage;/*마지막페이지번호*/

	      
		
		boolean  isPrevPage,isNextPage;
		boolean  PrevLevPage,NextLevPage;
		StringBuffer sb; //모든 상황을 판단하여 HTML코드를 저장할 곳
		
      //ex)
      //totalPage/*전체페이지수*/,
      //startPage/*시작페이지번호*/,
      //endPage;/*마지막페이지번호*/
      //rowTotal : 총 갯수 24개
      //blockPage : 한번에 보여줄 페이지 수 < 1 2 3 > 3개
      //blockList : 한번에 보여줄 게시물 수 3개
      //nowPage : 현재 페이지 위치 3번
      //pageURL : 받은 URL list.do
      //isPrevPage = 이전페이지
      //isNextPage = 다음페이지
      //isPrevPage = isNextPage = false;
		
		PrevLevPage=NextLevPage=false;
		isPrevPage=isNextPage=false;
		
		//필요한 총 페이지수를 구하는 작업
		//(전체 게시글 수)/(페이지당 보일 게시글)
		//totalPage=몫
		//나머지가 있으면 totalPage++
		totalPage = (int)(rowTotal/blockList);
		if(rowTotal%blockList!=0)totalPage++;
		
		//현재페이지가 만들어둔 페이지보다 높다면
		//현재페이지를 가장 마지막페이지로 변경(오류 잡는 코드)
		if(nowPage > totalPage)nowPage = totalPage;
		

		//< 1 2 3 4 >
		//위와 같은 글자 출력 및 링크를 걸기 위한 코드
		//시작페이지 = ((현재페이지-1)/(한번에 보여줄 페이지 수))*한번에 보여질 페이지수 +1
		// ㄴ '/'로 처리하기 때문에 (현재페이지-1)이 한번에 보여줄 페이지 수 보다 작으면 무조건 시작페이지는 1이다.
		//	ㄴex).blockPage가10이면, 시작페이지는 1,11,21.. 쿼리문 작성때와 똑같음
		//마지막 페이지 = 시작페이지 + 한번에 보여줄 페이지 -1
		// ㄴ ex).blockPage가10이면, 마지막페이지는 10,20,30 ...쿼리문 작성과 같다.
		startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //
		
		//마지막 페이지 수가 전체페이지수보다 크면 마지막페이지 값을 변경(오류방지)
		if(endPage > totalPage)endPage = totalPage;
		
		/* 기존코드
		 * 
		 * if(endPage < totalPage) isNextPage = true;
		 * if(startPage > 1)isPrevPage = true;
		 * 
		 * 해석 : 마지막페이지가 전체페이지보다 작다면 다음버튼 활성화
		 * 		시작페이지가 1보다 크다면 이전버튼 활성화
		 * 
		 * 문제 : 한칸씩 이동이 불가하다.(< 1 2 3 > 이었다면 < 4 5 6 > 으로 건너뛰어짐)
		 * 
		 * 이유 : startPage, endPage에 값을 넣는 코드에 현재페이지가 blackPage와 같거나 작으면 1이 나오는 구조
		 * 		endPage 역시 startPage에 따라 값이 변하는 구조로 현재페이지가 마지막 페이지쪽이라면 작동하지 않는다.
		 * 
		 * 예시 : < 1 *2 3 4 >, < 5 6 7 8 > --> blockPage = 4, nowPage=2 이라면
		 * 		
		 * 			
		 * 		startPage = (2/4)*4 + 1 = 0+1 = 1
		 * startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		 * 		endPage = 1+4-1 = 4
		 * endPage = startPage + blockPage - 1; //
		 * 		if( 4 < 8 ) 이므로 다음페이지 true값(활성)
		 * 		if( 1 > 1) 이므로 이전페이지 false값(비활성)
		 * 
		 * 		< 1 2 3 4 >, < 5 *6 7 8 > --> blockPage = 4, nowPage=6 이라면
		 * 
		 * 		startPage = (5/4)*4 + 1 = 4+1 = 5
		 * 		endPage = 5+4-1 = 8
		 * 		if( 8 < 8 ) 이므로 다음페이지 false값(비활성)
		 * 		if( 5 > 1) 이므로 이전페이지 true값(활성)
		 * 
		 * 해결 방법 : 
		 * 
		 * if(endPage < totalPage) isNextPage = true;
		 * if(startPage > 1)isPrevPage = true;
		 * 
		 * endPage, startPage를 빼고 nowPage로 넣으면 1과 totalPage가 아닌 경우
		 * 이전페이지, 다음페이지가 활성화 된다.
		 * */
		
		/* 기존코드에 변수 추가  << , >> 을 추가시켜서 페이지단위로도 이동시킬 수 있게 만듬 */
		//boolean형 변수의 값을 설정
		if(endPage < totalPage) NextLevPage = true;
		//시작페이지의 값이 1보다 작으면 이전페이징 적용할 수 있도록 값설정
		if(startPage > 1)PrevLevPage = true;
		
		/* 기존코드 수정 */
		//다음페이지 활성화 여부를 판단하는 코드
		if(nowPage < totalPage) isNextPage = true;
		
		//이전페이지 활성화 여부를 판단하는 코드
		if(nowPage > 1)isPrevPage = true;
		
		//HTML코드를 저장할 StringBuffer생성=>코드생성
		sb = new StringBuffer();
		
//----------이전페이지 전체 이동---------------------------------
		if(PrevLevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			sb.append( startPage-1 );
			sb.append("'>&lt;&lt;</a>");
		}
		else
			sb.append("&lt;&lt;");
		sb.append(" ");
		
//---------이전페이지로 한칸 이동----------------------------------
		if(isPrevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			
			//기존코드
			//sb.append( startPage-1 );
			
			//바꾼코드
			//page값에 현재페이지 -1을 넣어 한칸씩 이동하게 코드 바꿈
			sb.append( nowPage-1 ); 
			
			sb.append("'><img src='resources/img/btn_prev.gif'></a>");
		}
		else
			sb.append("<img src='resources/img/btn_prev.gif'>");
		
//------페이지 번호 출력 -------------------------------------------------------------------------------------------------
		sb.append(" ");
		for(int i=startPage; i<= endPage ;i++){
			if(i>totalPage)break;
			if(i == nowPage){ //현재 있는 페이지
				sb.append("&nbsp;<b><font color='#91b72f'>");
				sb.append(i);
				sb.append("</font></b>");
			}
			else{//현재 페이지가 아니면
				sb.append("&nbsp;<a href='"+pageURL+"?page=");
				sb.append(i);
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
		}// end for
		
		sb.append("&nbsp;");
		
//---------다음페이지로 한칸 이동----------------------------------
		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");
			
			//기존코드
			//sb.append(endPage + 1);
			
			//바꾼코드
			//page값에 현재페이지 +1을 넣어 한칸씩 이동하게 코드 바꿈
			sb.append(nowPage + 1);
			
			sb.append("'><img src='resources/img/btn_next.gif'></a>");
		}
		else
			sb.append("<img src='resources/img/btn_next.gif'>");
//---------다음페이지로 전체 이동----------------------------------	    
		sb.append(" ");
		if(NextLevPage){
			sb.append("<a href='"+pageURL+"?page=");
			sb.append(endPage + 1);
			sb.append("'>&gt;&gt;</a>");
		}
		else
			sb.append("&gt;&gt;");
		
		
		return sb.toString();
	}
}