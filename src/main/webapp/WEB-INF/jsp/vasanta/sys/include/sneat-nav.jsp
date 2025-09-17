<%@ page import="com.kepco.app.core.security.util.UserDetailsUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String name = UserDetailsUtil.getName();
    String userId = UserDetailsUtil.getId();
    boolean isLogin = UserDetailsUtil.isAuthenticated();
    String locale = (String) session.getAttribute("locale");
%>
<c:set var="name" value="<%=name%>"/>
<c:set var="userId" value="<%=userId%>"/>
<c:set var="isLogin" value="<%=isLogin%>"/>
<c:set var="locale" value="<%=locale%>"/>
<link rel="stylesheet" href="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.css"/>

<nav class="layout-navbar container-xxl navbar-detached navbar navbar-expand-xl align-items-center bg-navbar-theme"
     id="layout-navbar">
    <div class="w-100 d-flex justify-content-between">
      <!-- Basic Breadcrumb -->
      <nav aria-label="breadcrumb" class="d-flex align-items-center d-none d-xl-flex">
        <ol class="breadcrumb mb-0">
          <li class="breadcrumb-item">
            <a href="/sys/system/menu/mngrmenu/list"><img src="/static/assets/images/icon/home.svg" alt=""></a>
          </li>
          <c:if test="${not empty menuItems and not empty menuItems.childList and not empty requestUri}">
            <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
              <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}" />
              <c:if test="${not empty depth1Url and not empty requestUri and fn:length(fn:split(depth1Url, '/')) > 1 and fn:length(fn:split(requestUri, '/')) > 1}">
                <c:if test="${fn:contains(fn:split(depth1Url, '/')[1], fn:split(requestUri, '/')[1])}">
                  <c:set var="hasDepth2Match" value="false" />
                  <c:if test="${not empty depth1.childList}">
                    <c:forEach var="depth2" items="${depth1.childList}" varStatus="depth2Status">
                      <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}" />
                      <c:if test="${not empty depth2Url and fn:length(fn:split(depth2Url, '/')) > 2 and fn:length(fn:split(requestUri, '/')) > 2}">
                        <c:if test="${fn:contains(fn:split(depth2Url, '/')[2], fn:split(requestUri, '/')[2])}">
                          <c:set var="hasDepth2Match" value="true" />
                        </c:if>
                      </c:if>
                    </c:forEach>
                  </c:if>

                  <li class="breadcrumb-item ${hasDepth2Match ? '' : 'active'}">
                    <c:choose>
                      <c:when test="${hasDepth2Match}">
                        <a href="<c:url value='${depth1Url}'/>">${depth1.menuNm}</a>
                      </c:when>
                      <c:otherwise>
                        ${depth1.menuNm}
                      </c:otherwise>
                    </c:choose>
                  </li>

                  <c:if test="${not empty depth1.childList}">
                    <c:forEach var="depth2" items="${depth1.childList}" varStatus="depth2Status">
                      <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}" />
                      <c:if test="${not empty depth2Url and fn:length(fn:split(depth2Url, '/')) > 2 and fn:length(fn:split(requestUri, '/')) > 2}">
                        <c:if test="${fn:contains(fn:split(depth2Url, '/')[2], fn:split(requestUri, '/')[2])}">
                          <c:set var="hasDepth3Match" value="false" />
                          <c:if test="${not empty depth2.childList}">
                            <c:forEach var="depth3" items="${depth2.childList}" varStatus="depth3Status">
                              <c:set var="depth3Url" value="${depth3.menuTy eq 'DIR' ? depth3.firstMatchUrl : depth3.url}" />
                              <c:if test="${not empty depth3Url and fn:length(fn:split(depth3Url, '/')) > 3 and fn:length(fn:split(requestUri, '/')) > 3}">
                                <c:if test="${fn:split(depth3Url, '/')[3] eq fn:split(requestUri, '/')[3]}">
                                  <c:set var="hasDepth3Match" value="true" />
                                </c:if>
                              </c:if>
                            </c:forEach>
                          </c:if>

                          <li class="breadcrumb-item ${hasDepth3Match ? '' : 'active'}">
                            <c:choose>
                              <c:when test="${hasDepth3Match}">
                                <a href="<c:url value='${depth2Url}'/>">${depth2.menuNm}</a>
                              </c:when>
                              <c:otherwise>
                                ${depth2.menuNm}
                              </c:otherwise>
                            </c:choose>
                          </li>

                          <c:if test="${not empty depth2.childList}">
                            <c:forEach var="depth3" items="${depth2.childList}" varStatus="depth3Status">
                              <c:set var="depth3Url" value="${depth3.menuTy eq 'DIR' ? depth3.firstMatchUrl : depth3.url}" />
                              <c:if test="${not empty depth3Url and fn:length(fn:split(depth3Url, '/')) > 3 and fn:length(fn:split(requestUri, '/')) > 3}">
                                <c:if test="${fn:split(depth3Url, '/')[3] eq fn:split(requestUri, '/')[3]}">
                                  <li class="breadcrumb-item active">${depth3.menuNm}</li>
                                </c:if>
                              </c:if>
                            </c:forEach>
                          </c:if>
                        </c:if>
                      </c:if>
                    </c:forEach>
                  </c:if>
                </c:if>
              </c:if>
            </c:forEach>
          </c:if>
        </ol>
      </nav>
        <!--// Navbar -->
        <%-- Mobile Menu --%>
        <div class="mb-nav-btn layout-menu-toggle navbar-nav align-items-xl-center me-4 me-xl-0 d-xl-none">
            <a class="nav-item nav-link px-0 me-xl-6" href="javascript:void(0)">
                <i class="icon-base bx bx-menu icon-md"></i>
            </a>
        </div>

        <!-- 우측 아이템 -->
        <div class="d-flex align-items-center justify-content-end flex-fill" id="navbar-collapse">
            <ul class="navbar-nav flex-row align-items-center ms-md-auto gap-3">
                <li class="navbar-nav align-items-center">
                    <div class="nav-item dropdown me-2 me-xl-0">
                        <a
                                class="nav-link dropdown-toggle hide-arrow"
                                id="nav-theme"
                                href="javascript:void(0);"
                                data-bs-toggle="dropdown">
                            <i class="icon-base bx bx-sun icon-md theme-icon-active"></i>
                            <span class="d-none ms-2" id="nav-theme-text">Toggle theme</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="nav-theme-text">
                            <li>
                                <button
                                        type="button"
                                        class="dropdown-item align-items-center active"
                                        data-bs-theme-value="light"
                                        aria-pressed="false">
                                    <span><i class="icon-base bx bx-sun icon-md me-3" data-icon="sun"></i>Light</span>
                                </button>
                            </li>
                            <li>
                                <button
                                        type="button"
                                        class="dropdown-item align-items-center"
                                        data-bs-theme-value="dark"
                                        aria-pressed="true">
                                    <span><i class="icon-base bx bx-moon icon-md me-3" data-icon="moon"></i>Dark</span>
                                </button>
                            </li>
                            <li>
                                <button
                                        type="button"
                                        class="dropdown-item align-items-center"
                                        data-bs-theme-value="system"
                                        aria-pressed="false">
                                    <span><i class="icon-base bx bx-desktop icon-md me-3" data-icon="desktop"></i>System</span>
                                </button>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item dropdown-notifications navbar-dropdown dropdown me-3 me-xl-2">
                    <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="true">
                    <span class="position-relative" id="ntfExist">
                      <i class="icon-base bx bx-bell icon-md"></i>
                    </span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end p-0" data-bs-popper="static">
                        <li class="dropdown-menu-header border-bottom">
                            <div class="dropdown-header d-flex align-items-center py-3">
                                <h6 class="mb-0 me-auto text-muted">현재 알림이 없습니다.</h6>
                                <div class="d-flex align-items-center h6 mb-0">
<%--                                    <span class="badge bg-label-primary me-2">8 New</span>--%>
<%--                                    <a href="javascript:void(0)" class="dropdown-notifications-all p-2" data-bs-toggle="tooltip" data-bs-placement="top" aria-label="Mark all as read" data-bs-original-title="Mark all as read"><i class="icon-base bx bx-envelope-open text-heading"></i></a>--%>
                                </div>
                            </div>
                        </li>
                        <li class="dropdown-notifications-list scrollable-container ps ps--active-y">
                            <ul class="list-group list-group-flush" id="ntfList">
                            </ul>
                        </li>
                    </ul>
                </li>
                <!-- 로그인/회원가입/로그아웃 -->
                <c:choose>
                    <c:when test="${isLogin}">
                        <li class="navbar-nav align-items-center navbar-dropdown dropdown-user dropdown">
                    <a class="nav-link dropdown-toggle hide-arrow p-0 flex-c gap-2" href="javascript:void(0);"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="avatar avatar-online">
                            <img src="/static/assets/images/user-default.jpg" alt="" class="rounded-circle">
                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <div class="dropdown-item-text">
                                <div class="d-flex">
                                    <div class="flex-shrink-0 me-3">
                                        <div class="avatar avatar-online">
                                            <img src="/static/assets/images/user-default.jpg" alt="" class="rounded-circle">
                                        </div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="mb-0">${name}</h6>
                                        <small class="text-muted">${userId}</small>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="dropdown-divider my-1"></div>
                        </li>
                        <li>
                            <a class="dropdown-item" href="/sys/logout"> <i
                                    class="icon-base bx bx-power-off icon-md me-3"></i><spring:message
                                    code="button.logout"/></a>
                        </li>
                    </ul>
                </li>
                    </c:when>
                    <c:otherwise>
                        <!-- 로그인 버튼 -->
                        <li class="nav-item me-2">
                            <a class="nav-link" href="/sys/login">
                                <i class="icon-base bx bx-log-in icon-md me-1"></i>
                                <span><spring:message code="button.login"/></span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<template id="ntfElem">
    <li class="list-group-item list-group-item-action dropdown-notifications-item">
        <div class="d-flex">
            <input type="hidden" class="ntfId"/>
            <div class="flex-grow-1 ntfRedirectUrl">
                <h6 class="small mb-0 ntfTitle"></h6>
                <small class="mb-1 d-block text-body ntfContent"></small>
                <small class="text-body-secondary ntfRegistDt"></small>
            </div>
            <div class="flex-shrink-0 dropdown-notifications-actions">
                <a href="javascript:void(0)" class="dropdown-notifications-read"><span class="badge badge-dot"></span></a>
                <a href="javascript:void(0)" class="dropdown-notifications-archive"><span class="icon-base bx bx-x"></span></a>
            </div>
        </div>
    </li>
</template>

<script>
    // 테마를 localStorage에 저장하고 즉시 적용
    document.querySelectorAll('[data-bs-theme-value]').forEach(button => {
        button.addEventListener('click', function () {
            const theme = this.getAttribute('data-bs-theme-value');

            // 저장
            localStorage.setItem('templateCustomizer-sneat--Theme', theme);

            // 적용
            document.documentElement.setAttribute('data-bs-theme', theme);
        });
    });

    let successRead = function (data) {

    }

    let failRead = function (data) {

    }



</script>
<script src="/static/vendor/sneat/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
