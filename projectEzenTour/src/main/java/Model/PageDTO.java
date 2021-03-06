package Model;

public class PageDTO {
	
	//최소 페이지 번호
	int min;
	//최대 페이지 번호
	int max;
	
	// 버튼의 페이지 번호
	int prevPage;
	int nextPage;
	
	//전체 페이지 개수
	int pageCnt;
	//현재 페이지 번호
	int currentPage;
	
	// contentCnt :전체글 개수, currentPage: 현재글 번호, contentPageCnt : 페이지당 글의 개수 ,paginationCnt: 페이지 버튼의 개수
	public PageDTO(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		
		//현재 페이지 번호
		this.currentPage = currentPage;
		
		//전체 페이지 개수
		pageCnt = contentCnt / contentPageCnt;
		if(contentCnt % contentPageCnt > 0) {
			pageCnt++;
		}
		
		min = ((currentPage -1) / contentPageCnt) * contentPageCnt + 1;
		max = min +  paginationCnt - 1;
		
		if(max > pageCnt) {
			max = pageCnt;
		}
		
		prevPage = min - 1;
		nextPage = max + 1;
		if(nextPage > pageCnt) {
			nextPage = pageCnt;
		}
		
	 
		
	}
	
	public int getMin() {
		return min;
	}
	public int getMax() {
		return max;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	
	

}
