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
        pagingStr += "<nav aria-label=\"Page navigation example\"><ul class=\"pagination\">";
        if(pageTemp != 1){
            pagingStr += "<li class=\"page-item\"><a class=\"page-link\" href ='" + reqUrl + "?pageNum=1" + keyword + "'><i class=\"bi bi-chevron-double-left\"></i></a></li>";
            pagingStr += "<li class=\"page-item\"><a class=\"page-link\" href ='" + reqUrl + "?pageNum="+ (pageTemp -1) + keyword + "'><i class=\"bi bi-chevron-left\"></i></a></li>";
        }

        //각 페이지 번호 출력
        int blockCount =1;
        while (blockCount <= blockPage && pageTemp <= totalPage){
            if(pageTemp == pageNum){
                //현재페이지는 링크 걸지 않음
                pagingStr += "<li id=\"pageBtn" + pageTemp + "\" class=\"page-item\"><a class=\"page-link\" href=\"#\">" + pageTemp + "</a></li>";

            }else{
                pagingStr += "<li id=\"pageBtn" + pageTemp + "\" class=\"page-item\"><a class=\"page-link\" href='" + reqUrl + "?pageNum=" + pageTemp + keyword + "'>" + pageTemp + "</a></li>";
            }
            pageTemp++;
            blockCount++;

        }

        //다음 페이지 블록 바로가기
        if(pageTemp <= totalPage){
            pagingStr += "<li class=\"page-item\"><a class=\"page-link\" href ='" + reqUrl + "?pageNum=" + pageTemp + keyword + "'><i class=\"bi bi-chevron-right\"></i></a></li>";
            pagingStr += "<li class=\"page-item\"><a class=\"page-link\" href ='" + reqUrl + "?pageNum=" + totalPage + keyword + "'><i class=\"bi bi-chevron-double-right\"></i></a></li>";
        }
        pagingStr += "</ul></nav>";


        return pagingStr;
    }

}
