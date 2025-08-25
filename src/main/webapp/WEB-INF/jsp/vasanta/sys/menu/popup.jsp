<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div id="popup" class="popupWrap">
    <div class="popupInner">
<%--        <div class="popupTop">
            <h5 id="popupTitle">프로그램 선택</h5>
        </div>--%>
        <form id="frmSearch">
            <div class="srchFltrWrap">
                <div class="srchFltrItem">
                    <div class="subsearch">
                        <div class="selectWrap">
                            <select id="searchCondition" name="searchCondition" class="selectBox">
                            </select>
                        </div>
                        <div class="rightItem">
                            <input type="search" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요">
                            <button type="button" id="btnSearch" class="btn searchBtn">검색</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="boardCount">
            총 <span id="totCnt"></span>건
        </div>
        <div class="table-area">
            <table class="tbl board">
                <thead id="table-head" class="tblHeader">
                </thead>
                <tbody id="table-body">
                </tbody>
            </table>
            <div class="pagination-area">
                <ul id="pagination" class="pagination">
                </ul>
            </div>
        </div>
        <div class="buttonArea right">
            <a href="javascript:void(0);" class="btn line popupClose">취소</a>
            <a href="javascript:void(0);" id="btnSelect" class="btn">확인</a>
        </div>
    </div>
</div>