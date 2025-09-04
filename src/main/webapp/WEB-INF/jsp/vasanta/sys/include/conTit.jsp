<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<div class="container">
    <div class="row">
        <div class="col m12 conTop">
            <div class="conTit">
                <h3 class=""><c:out value="${menuTitle}"/></h3>
                <div class="breadCrumbBox">
                    <ul class="breadCrumb arrow">
                        <li class="breadCumbItem"><a href="/sys/system/menu/mngrmenu/list"><c:out value="${menuItems.menuNm}"/></a></li>
                        <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
                            <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}"/>
                            <c:if test="${fn:contains(fn:split(depth1Url, '/')[1], fn:split(requestUri, '/')[1])}">
                                <li class="breadCumbItem"><a href="<c:url value="${depth1Url}"/>"><c:out value="${depth1.menuNm}"/></a></li>
                                <c:forEach var="depth2" items="${depth1.childList}" varStatus="depth2Status">
                                    <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}"/>
                                    <c:if test="${fn:contains(fn:split(depth2Url, '/')[2], fn:split(requestUri, '/')[2])}">
                                        <li class="breadCumbItem"><a href="<c:url value="${depth2Url}"/>"><c:out value="${depth2.menuNm}"/></a></li>
                                        <c:forEach var="depth3" items="${depth2.childList}" varStatus="depth3Status">
                                            <c:set var="depth3Url" value="${depth3.menuTy eq 'DIR' ? depth3.firstMatchUrl : depth3.url}"/>
                                            <c:if test="${fn:contains(fn:split(depth3Url, '/')[3], fn:split(requestUri, '/')[3])}">
                                                <li class="breadCumbItem"><a href="<c:url value="${depth3Url}"/>"><c:out value="${depth3.menuNm}"/></a></li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>