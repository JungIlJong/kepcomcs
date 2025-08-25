<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<div class="asideWrap">
    <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
        <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}"/>
        <c:if test="${fn:contains(fn:split(depth1Url, '/')[1], fn:split(requestUri, '/')[1])}"><p class="asideTit"><c:out value="${depth1.menuNm}"/></p></c:if>
    </c:forEach>
    <ul class="asideNav">
        <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
            <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}"/>
            <c:if test="${fn:contains(fn:split(depth1Url, '/')[1], fn:split(requestUri, '/')[1])}">
                <c:forEach var="depth2" items="${depth1.childList}" varStatus="depth2Status">
                    <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}"/>
                    <li class="toggle <c:if test="${fn:contains(fn:split(depth2Url, '/')[2], fn:split(requestUri, '/')[2])}">open</c:if>">
                        <a href="<c:url value="${depth2Url}"/>" class="<c:if test="${fn:contains(fn:split(depth2Url, '/')[2], fn:split(requestUri, '/')[2])}">active</c:if>"><c:out value="${depth2.menuNm}"/></a>
                        <ul class="sub-menu">
                            <c:forEach var="depth3" items="${depth2.childList}" varStatus="depth3Status">
                                <c:set var="depth3Url" value="${depth3.menuTy eq 'DIR' ? depth3.firstMatchUrl : depth3.url}"/>
                                <li><a href="<c:url value="${depth3Url}"/>" class="<c:if test="${fn:split(depth3Url, '/')[3] eq fn:split(requestUri, '/')[3]}">active</c:if>"><c:out value="${depth3.menuNm}"/></a></li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:forEach>
            </c:if>
        </c:forEach>
    </ul>
</div>