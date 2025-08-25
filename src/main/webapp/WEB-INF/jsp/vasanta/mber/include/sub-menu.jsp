<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-lg-2 col-md-3 col-12 mb-md-0 mb-4">
    <!-- 현재 활성화된 대메뉴 이름 표시 -->
    <div class="card mb-3 p-5 text-center bg-primary text-bg-primary">
        <c:set var="currentMainMenu" value="" />
        <c:forEach var="depth1" items="${menuItems.childList}">
            <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}" />
            <c:if test="${fn:contains(fn:split(depth1Url, '/')[1], fn:split(requestUri, '/')[1])}">
                <c:set var="currentMainMenu" value="${depth1.menuNm}" />
            </c:if>
        </c:forEach>
        ${currentMainMenu}
    </div>
    
    <!-- 서브 메뉴 목록 -->
    <div class="list-group" role="tablist">
        <c:forEach var="depth1" items="${menuItems.childList}">
            <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}" />
            <c:if test="${fn:contains(fn:split(depth1Url, '/')[1], fn:split(requestUri, '/')[1])}">
                <c:forEach var="depth2" items="${depth1.childList}">
                    <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}" />
                    <a class="list-group-item list-group-item-action 
                        <c:if test='${fn:contains(fn:split(depth2Url, "/")[2], fn:split(requestUri, "/")[2])}'>active</c:if>"
                        href="<c:url value='${depth2Url}'/>" 
                        aria-selected="${fn:contains(fn:split(depth2Url, '/')[2], fn:split(requestUri, '/')[2]) ? 'true' : 'false'}" 
                        role="tab">
                        ${depth2.menuNm}
                    </a>
                </c:forEach>
            </c:if>
        </c:forEach>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        try {
            console.log('서브메뉴 초기화 시작');
            
            // 서브메뉴 항목이 없을 경우 메시지 표시
            const menuItems = document.querySelectorAll('.list-group-item');
            if (menuItems.length === 0) {
                const listGroup = document.querySelector('.list-group');
                if (listGroup) {
                    const noMenuMessage = document.createElement('div');
                    noMenuMessage.className = 'list-group-item text-center';
                    noMenuMessage.textContent = '서브메뉴가 없습니다';
                    listGroup.appendChild(noMenuMessage);
                }
            }
            
            // 서브메뉴 클릭 이벤트 처리
            menuItems.forEach(item => {
                item.addEventListener('click', function(e) {
                    const href = this.getAttribute('href');
                    if (href && href !== '#' && href !== 'javascript:void(0);') {
                        window.location.href = href;
                    }
                });
            });
            
            console.log('서브메뉴 초기화 완료');
        } catch (e) {
            console.error('서브메뉴 초기화 중 오류 발생:', e);
        }
    });
</script>
