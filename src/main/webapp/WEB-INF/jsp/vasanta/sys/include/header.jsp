<%@ page import="com.kepco.app.core.security.util.UserDetailsUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String name = UserDetailsUtil.getName();
    String locale = (String) session.getAttribute("locale");
%>
<c:set var="name" value="<%=name%>"/>
<c:set var="locale" value="<%=locale%>"/>
<header id="header">
    <h1>
        <a href="/sys/system/menu/mngrmenu/list">
            <span>VASANTA CMS V2.0</span>
        </a>

    </h1>
    <nav class="navbar">
        <div class="container">
            <div class="leftItem">
                <ul class="gnb-menu">
                    <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
                        <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}"/>
                        <c:if test="${depth1.gnbAt eq 'Y'}">
                            <li><a href="<c:url value="${depth1Url}"/>" class="<c:if test="${fn:contains(fn:split(depth1Url, '/')[1], fn:split(requestUri, '/')[1])}">active</c:if>"><c:out value="${depth1.menuNm}"/></a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
            <div class="rightItem">
                <p class="userName"><c:out value="${name}"/></p>
<%--                <span class="zoomBox">
            <button type="button" class="zoomin"><img src="/sys/assets/icon/App_Bar/zomInBtn.svg" alt="확대"></button>
            <p>100%</p>
            <button type="button" class="zoomout"><img src="/sys/assets/icon/App_Bar/zomOutBtn.svg" alt="축소"></button>
          </span>--%>
<%--                <div class="selectWrap">--%>
<%--                    <select id="selectLang" name="selectLang" class="selectBox">--%>
<%--                        <option value="ko" <c:if test="${locale eq 'ko'}">selected</c:if>>한국어</option>--%>
<%--                        <option value="en" <c:if test="${locale eq 'en'}">selected</c:if>>English</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
                <a href="/sys/logout" class="btn"><img src="/sys/assets/icon/App_Bar/gnb_logout.svg" alt="로그아웃"><spring:message code="button.logout"/></a>
            </div>
        </div>
    </nav>
    <!-- mobileBtn -->
    <div class="mBtn">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
    </div>
</header>