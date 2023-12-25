package com.util;

import java.util.Map;

public class BoardPage {
    public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, Map<String,Object> map, String reqUrl){
        String pagingStr = "";
        //전체 페이지 계산
        int totalPage =  (int)Math.ceil((double)totalCount/pageSize);
        String searchField = (String) map.get("searchField");
        String searchWord = (String) map.get("searchWord");
        String keyword = "";
        if(searchWord != null){
            keyword = "&searchField=" + searchField + "&searchWord=" + searchWord;
        }

        //이전 페이지 블록 바로가기
        int pageTemp = (((pageNum -1 ) / blockPage) * blockPage) +1;
        if(pageTemp != 1){
            pagingStr += "<a href ='" + reqUrl + "?pageNum=1" + keyword + "'>[첫 페이지]</a>";
            pagingStr += "&nbsp";
            pagingStr += "<a href ='" + reqUrl + "?pageNum="+ (pageTemp -1) + keyword + "'>[이전 블럭]</a>";
        }

        //각 페이지 번호 출력
        int blockCount =1;
        while (blockCount <= blockPage && pageTemp <= totalPage){
            if(pageTemp == pageNum){
                //현재페이지는 링크 걸지 않음
                pagingStr += "&nbsp;" + pageTemp + "&nbsp;";

            }else{
                pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp + keyword + "'>" + pageTemp + "</a>&nbsp;";
            }
            pageTemp++;
            blockCount++;

        }

        //다음 페이지 블록 바로가기
        if(pageTemp <= totalPage){
            pagingStr += "<a href ='" + reqUrl + "?pageNum=" + pageTemp + keyword + "'>[다음 블록]</a>";
            pagingStr += "&nbsp";
            pagingStr += "<a href ='" + reqUrl + "?pageNum=" + totalPage + keyword + "'>[마지막 페이지]</a>";
        }


        return pagingStr;
    }

}
