<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<aside id="layout-menu" class="layout-menu-horizontal menu-horizontal menu flex-grow-0">
    <div class="container-xxl d-flex h-100 align-items-center justify-content-between">
        <ul class="menu-inner">
            <!-- GNB 메뉴 -->
            <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
                <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}"/>
                <c:if test="${depth1.gnbAt eq 'Y'}">
                    <li class="menu-item">
                        <a href="javascript:void(0);" class="menu-link menu-toggle <c:if test='${fn:contains(fn:split(depth1Url, "/")[1], fn:split(requestUri, "/")[1])}'>active</c:if>">
                            <div><c:out value="${depth1.menuNm}"/></div>
                        </a>
                        <ul class="menu-sub">
                            <c:forEach var="depth2" items="${depth1.childList}">
                                <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}"/>
                                <li class="menu-item">
                                    <a href="<c:url value='${depth2Url}'/>"
                                       class="menu-link"
                                       <c:if test="${depth2.menuTy eq 'LINK'}">target="_blank"</c:if>>
                                        <div><c:out value="${depth2.menuNm}"/></div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:if>
            </c:forEach>

            <!-- 사이트맵 버튼 -->
            <li class="menu-item">
                <a href="/mber/support/sitemap/sitemap/view" class="menu-link">
                    <i class="menu-icon bx bx-map"></i>
                    <div>사이트맵</div>
                </a>
            </li>
        </ul>
    </div>
</aside>
<script>
    const templateName = "Vasanta";
    document.addEventListener('DOMContentLoaded', function() {
        try {
            // 디버깅용 콘솔 로그
            console.log('Menu 초기화 시작');
            console.log('Menu 클래스 존재 여부:', typeof Menu !== 'undefined');

            const menuElement = document.getElementById('layout-menu');
            console.log('메뉴 요소 존재 여부:', menuElement !== null);

            if (menuElement && typeof Menu !== 'undefined') {
                const menu = new Menu(menuElement, {
                    orientation: 'horizontal',
                    closeChildren: false,
                    showDropdownOnHover: true
                });
                console.log('메뉴 초기화 완료');
            } else {
                console.error('메뉴 초기화 실패: 요소 또는 클래스 누락');
            }
        } catch (e) {
            console.error('메뉴 초기화 중 오류 발생:', e);
        }
    });
</script>
<%-- TODO 현재 활성화된 메뉴에 active 클래스 추가 기능 구현 필요 --%>