<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="/static/pages/mber/css/common-custom.css" />

<aside id="layout-menu" class="layout-menu menu-vertical menu">
    <div class="app-brand demo">
        <a href="/sys/system/menu/mngrmenu/list" class="app-brand-link">
              <span class="app-brand-logo demo mt-5 mb-10">
                <img src="/resources/landing/images/main/logo.png" alt="MCS" style="width:100%; height:100%;">
              </span>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
            <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}"/>
            <c:choose>
                <c:when test="${not empty depth1.childList}">
                    <li class="menu-item <c:if test='${fn:contains(fn:split(depth1Url, "/")[1], fn:split(requestUri, "/")[1])}'>open active</c:if>">
                        <a href="javascript:void(0);" class="menu-link menu-toggle <c:if test='${fn:contains(fn:split(depth1Url, "/")[1], fn:split(requestUri, "/")[1])}'>active</c:if>">
                            <i class="menu-icon bx bx-folder"></i>
                            <div>${depth1.menuNm}</div>
                        </a>
                        <ul class="menu-sub">
                            <c:forEach var="depth2" items="${depth1.childList}" varStatus="depth2Status">
                                <c:set var="depth2Url"
                                       value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}"/>
                                <c:choose>
                                    <c:when test="${not empty depth2.childList}">
                                        <li class="menu-item <c:if test='${fn:contains(fn:split(depth2Url, "/")[2], fn:split(requestUri, "/")[2])}'>open active</c:if>">
                                            <a href="javascript:void(0);" class="menu-link menu-toggle <c:if test='${fn:contains(fn:split(depth2Url, "/")[2], fn:split(requestUri, "/")[2])}'>active</c:if>">
                                                <div>${depth2.menuNm}</div>
                                            </a>
                                            <ul class="menu-sub">
                                                <c:forEach var="depth3" items="${depth2.childList}"
                                                           varStatus="depth3Status">
                                                    <c:set var="depth3Url"
                                                           value="${depth3.menuTy eq 'DIR' ? depth3.firstMatchUrl : depth3.url}"/>
                                                    <li class="menu-item <c:if test='${fn:split(depth3Url, "/")[3] eq fn:split(requestUri, "/")[3]}'>active</c:if>">
                                                        <a href="<c:url value='${depth3Url}'/>"
                                                           class="menu-link <c:if test='${fn:split(depth3Url, "/")[3] eq fn:split(requestUri, "/")[3]}'>active</c:if>">
                                                            <div>${depth3.menuNm}</div>
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="menu-item <c:if test='${fn:contains(fn:split(depth2Url, "/")[2], fn:split(requestUri, "/")[2])}'>active</c:if>">
                                            <a href="<c:url value='${depth2Url}'/>"
                                               class="menu-link <c:if test='${fn:contains(fn:split(depth2Url, "/")[2], fn:split(requestUri, "/")[2])}'>active</c:if>">
                                                <div>${depth2.menuNm}</div>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ul>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="menu-item <c:if test='${fn:contains(fn:split(depth1Url, "/")[1], fn:split(requestUri, "/")[1])}'>active</c:if>">
                        <a href="<c:url value='${depth1Url}'/>"
                           class="menu-link <c:if test='${fn:contains(fn:split(depth1Url, "/")[1], fn:split(requestUri, "/")[1])}'>active</c:if>">
                            <i class="menu-icon bx bx-folder"></i>
                            <div>${depth1.menuNm}</div>
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </ul>
</aside>

<script>
    const templateName = "Vasanta";
    document.addEventListener('DOMContentLoaded', function () {
        try {
            // 디버깅용 콘솔 로그
            console.log('Menu 초기화 시작');
            console.log('Menu 클래스 존재 여부:', typeof Menu !== 'undefined');

            const menuElement = document.getElementById('layout-menu');
            console.log('메뉴 요소 존재 여부:', menuElement !== null);

            if (menuElement && typeof Menu !== 'undefined') {
                const menu = new Menu(menuElement, {
                    orientation: 'vertical',
                    closeChildren: false,
                    showDropdownOnHover: false
                });
                window.templateMenu = menu; // 개발자도구에서 접근할 수 있도록 전역에 바인딩
                console.log('메뉴 초기화 완료');
            } else {
                console.error('메뉴 초기화 실패: 요소 또는 클래스 누락');
            }
        } catch (e) {
            console.error('메뉴 초기화 중 오류 발생:', e);
        }
    });
</script>
