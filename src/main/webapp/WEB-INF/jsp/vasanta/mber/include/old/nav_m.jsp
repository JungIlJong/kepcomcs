<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="asideWrap_m">
    <div class="asideNav_m dropdown">
        <a href="javascript:void(0);" class="dropdownBtn">
            <span>Default</span>
            <div class="arrowIcon">
                <img class="arrow" src="/mber/assets/icon/arrow_w.svg" alt="">
            </div>
        </a>
        <div class="dropdownCon">
            <div class="accordionBox">
                <div class="accordion">
                    <c:forEach var="depth1" items="${menuItems.childList}" varStatus="depth1Status">
                        <c:forEach var="depth2" items="${depth1.childList}" varStatus="depth2Status">
                            <div class="accordionItem">
                            <button class="accordionHeader">
                                <div class="accordionTitle"><c:out value="${depth2.menuNm}"/></div>
                                <div class="accordionIcon">
                                    <img src="/mber/assets/icon/Basic_Icon/Accordion_arrow.svg" alt="">
                                </div>
                            </button>
                            <div class="accordionContent">
                                <c:forEach var="depth3" items="${depth2.childList}" varStatus="depth3Status">
                                    <c:set var="depth3Url" value="${depth3.menuTy eq 'DIR' ? depth3.firstMatchUrl : depth3.url}"/>
                                    <a href="javascript:void(0);" class=""><c:out value="${depth3.menuNm}"/></a>
                                </c:forEach>
                            </div>
                        </c:forEach>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</div>