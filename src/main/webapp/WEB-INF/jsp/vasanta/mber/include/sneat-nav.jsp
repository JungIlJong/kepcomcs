<%@ page import="java.util.List" %>
<%@ page import="com.kepco.app.core.security.util.UserDetailsUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String name = UserDetailsUtil.getName();
    boolean isLogin = UserDetailsUtil.isAuthenticated();
    String locale = (String) session.getAttribute("locale");
    List<String> roles = UserDetailsUtil.getAuthorityList();
%>
<c:set var="name" value="<%=name%>"/>
<c:set var="isLogin" value="<%=isLogin%>"/>
<c:set var="locale" value="<%=locale%>"/>
<c:set var="roles" value="<%=roles%>"/>

<nav class="layout-navbar navbar navbar-expand-xl align-items-center" id="layout-navbar">
    <div class="container-xxl">
        <%-- Mobile Menu --%>
        <div class="layout-menu-toggle navbar-nav align-items-xl-center me-4 me-xl-0 d-xl-none">
            <a class="nav-item nav-link px-0 me-xl-6" href="javascript:void(0)">
                <i class="icon-base bx bx-menu icon-md"></i>
            </a>
        </div>

        <!-- 로고 영역 -->
        <div class="mt-2 mb-2 navbar-brand app-brand demo d-none d-xl-flex py-0 me-4">
            <a href="/" class="app-brand-link gap-2">
                <img src="<c:out value="${logoUrl}" />" alt="LOGO-TXT" class="logo-img">
            </a>
        </div>

        <!-- 우측 아이템 -->
        <div class="navbar-nav-right d-flex align-items-center justify-content-end" id="navbar-collapse">
            <ul class="navbar-nav flex-row align-items-center ms-md-auto">
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

                <!-- 로그인/회원가입/로그아웃 -->
                <c:choose>
                    <c:when test="${isLogin}">
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow p-0" href="javascript:void(0);"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                <div class="avatar avatar-online">
                                    <img src="/static/assets/images/user-default.jpg" alt="" class="rounded-circle">
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="/mber/support/mypage/myinfo/mypage/myinfo"> <i
                                            class="icon-base bx bx-user icon-md me-3"></i><span>내 정보</span> </a>
                                </li>
                                <c:if test="${fn:contains(roles, 'ROLE_ADMIN')}">
                                    <li>
                                        <a class="dropdown-item" href="/sys/system/menu/mngrmenu/list">
                                            <i class="icon-base bx bx-cog icon-md me-3"></i><span>관리자 페이지</span>
                                        </a>
                                    </li>
                                </c:if>
                                <li>
                                    <div class="dropdown-divider my-1"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="/mber/support/logout"> <i
                                            class="icon-base bx bx-power-off icon-md me-3"></i><spring:message
                                            code="button.logout"/></a>
                                </li>
                            </ul>
                        </li>
                        <!-- 로그아웃 버튼 -->
                        <%--<li class="nav-item me-2">
                            <a class="nav-link" href="/mber/support/logout">
                                <i class="icon-base bx bx-log-out icon-md me-1"></i>
                                <span><spring:message code="button.logout"/></span>
                            </a>
                        </li>--%>
                    </c:when>
                    <c:otherwise>
                        <!-- 로그인 버튼 -->
                        <li class="nav-item me-2">
                            <a class="nav-link" href="/mber/support/login/login">
                                <i class="icon-base bx bx-log-in icon-md me-1"></i>
                                <span><spring:message code="button.login"/></span>
                            </a>
                        </li>
                        <!-- 회원가입 버튼 -->
                        <li class="nav-item me-2">
                            <a class="nav-link" href="/mber/support/join/join/step1">
                                <i class="icon-base bx bx-user-plus icon-md me-1"></i>
                                <span><spring:message code="button.signup"/></span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
</nav>

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
</script>