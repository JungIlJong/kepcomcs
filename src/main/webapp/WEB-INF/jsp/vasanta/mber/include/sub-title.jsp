<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section
        class="bg-vasanta-section d-flex flex-column justify-content-center align-items-center h-px-300 position-relative">
    <h3 class="text-center mb-2"><c:out value="${bbs.bbsNm}"/></h3>
    <!-- Bootstrap Breadcrumb Navigation -->
    <nav aria-label="breadcrumb" class="px-4">
        <ol class="breadcrumb justify-content-center">
            <!-- 홈 메뉴 -->
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/">
                    <i class="bx bx-home-alt me-1"></i>홈
                </a>
            </li>

            <!-- 대메뉴(1단계) -->
            <c:forEach var="depth1" items="${menuItems.childList}">
                <c:set var="depth1Url" value="${depth1.menuTy eq 'DIR' ? depth1.firstMatchUrl : depth1.url}" />
                <c:if test="${fn:contains(fn:split(depth1Url, '/')[1], fn:split(requestUri, '/')[1])}">
                    <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}${depth1Url}">${depth1.menuNm}</a>
                    </li>

                    <!-- 서브메뉴(2단계) -->
                    <c:forEach var="depth2" items="${depth1.childList}">
                        <c:set var="depth2Url" value="${depth2.menuTy eq 'DIR' ? depth2.firstMatchUrl : depth2.url}" />
                        <c:if test="${fn:contains(fn:split(depth2Url, '/')[2], fn:split(requestUri, '/')[2])}">
                            <li class="breadcrumb-item active" aria-current="page">${depth2.menuNm}</li>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </ol>
    </nav>
</section>
