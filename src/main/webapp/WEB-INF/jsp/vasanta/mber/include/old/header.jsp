<%@ page import="com.kepco.app.core.security.util.UserDetailsUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String name = UserDetailsUtil.getName();
    boolean isLogin = UserDetailsUtil.isAuthenticated();
    String locale = (String) session.getAttribute("locale");
%>
<c:set var="name" value="<%=name%>"/>
<c:set var="isLogin" value="<%=isLogin%>"/>
<c:set var="locale" value="<%=locale%>"/>
<header id="header">
    <div class="udBox">
        <!-- Navigation -->
        <div class="headerTop">
            <div class="container">

                <!-- logo -->
                <h1 class="logo">
                    <a href="/">
                        <img src="/mber/assets/image/common/logo_color.svg" alt="LOGO">
                    </a>
                </h1>

                <ul class="gnbItemBox">
                    <c:if test="${isLogin}">
                        <li><a href="/mber/support/logout" class="login"><spring:message code="button.logout"/></a></li>
                    </c:if>
                    <c:if test="${!isLogin}">
                        <li><a href="/mber/support/login/login" class="login"><spring:message code="button.login"/></a></li>
                        <li><a href="/mber/support/join/join/step1" class="join"><spring:message code="button.signup"/></a></li>
                    </c:if>
<%--                    <li class="zoomBox">
                            <span class="zoomBoxItem">
                                <button type="button" class="zoomin"><img src="/mber/assets/icon/App_Bar/zomInBtn.svg" alt="확대"></button>
                                <p>100%</p>
                                <button type="button" class="zoomout"><img src="/mber/assets/icon/App_Bar/zomOutBtn.svg" alt="축소"></button>
                            </span>
                    </li>--%>
<%--                    <li>
                        <div class="selectWrap">
                            <img src="/mber/assets/image/common/language.svg">
                            <select id="selectLang" name="selectLang" class="selectBox">
                                <option value="ko" <c:if test="${locale eq 'ko'}">selected</c:if>>한국어</option>
                                <option value="en" <c:if test="${locale eq 'en'}">selected</c:if>>English</option>
                            </select>
                        </div>
                    </li>--%>
                </ul>
            </div>
        </div>

        <!-- GNB -->
        <nav class="Hd-wrap">
            <button class="Hd-mb-menu"></button>
            <ul class="login-box">
                <c:if test="${isLogin}">
                    <li><a href="/mber/support/logout"><spring:message code="button.logout"/></a></li>
                </c:if>
                <c:if test="${!isLogin}">
                    <li><a href="/mber/support/login/login"><spring:message code="button.login"/></a></li>
                    <li><a href="/mber/support/join/join/step1"><spring:message code="button.signup"/></a></li>
                </c:if>
            </ul>
                <ul class="Hd-menu">
                    <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
                        <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}"/>
                        <c:if test="${depth1.gnbAt eq 'Y'}">
                            <li>
                                <a <c:if test="${depth1.menuTy eq 'LINK'}">target="_blank"</c:if> href="javascript:void(0);" class="dp-menu <c:if test="${fn:contains(fn:split(depth1Url, '/')[1], fn:split(requestUri, '/')[1])}">active</c:if>"><c:out value="${depth1.menuNm}"/></a>
                                <ul class="submenu">
                                    <c:forEach var="depth2" items="${depth1.childList}" varStatus="depth2Status">
                                        <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}"/>
                                        <li><a <c:if test="${depth2.menuTy eq 'LINK'}">target="_blank"</c:if> href="<c:url value="${depth2Url}"/>"><c:out value="${depth2.menuNm}"/></a>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
                <div class="Hd-sitemap">
                    <a href="/mber/support/sitemap/sitemap/view" class="">
                        <img src="/mber/assets/icon/App_Bar/menu.svg" alt="">
                    </a>
                </div>
        </nav>

    </div>
</header>