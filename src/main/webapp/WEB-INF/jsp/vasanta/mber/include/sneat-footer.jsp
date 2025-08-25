<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<footer class="landing-footer bg-dark footer-text">
    <div class="footer-top position-relative overflow-hidden z-1">
        <div class="container">
            <div class="row gx-0 gy-6 g-lg-10">
                <div class="col-lg-5">
                    <a href="/" class="app-brand-link mb-6">
                        <span class="app-brand-logo demo">
                            <img src="<c:out value="${footerLogoUrl}" />" alt="EZSS LOGO" width="100">
                        </span>
                    </a>
                    <p class="footer-text footer-logo-description mb-6" style="white-space: pre-wrap;">${setting.companyInfo.content}</p>
                    <p class="small text-muted">${setting.copyrightInfo.content}</p>
                    <p class="small text-muted"> Icons by Boxicons (https://boxicons.com) - Licensed under MIT</p>
                </div>

                <div class="col-lg-2 col-md-4 col-sm-6">
                    <h6 class="footer-title mb-6">사이트 정보</h6>
                    <ul class="list-unstyled">
                        <li class="mb-4"><a href="/mber/support/trmuse/cntnts/1/view" class="footer-link">이용약관</a></li>
                        <li class="mb-4"><a href="/mber/support/prvplc/cntnts/2/view" class="footer-link">개인정보처리방침</a></li>
                        <li><a href="/mber/support/sitemap/sitemap/view" class="footer-link">사이트맵</a></li>
                    </ul>
                </div>

                <div class="col-lg-3 col-md-4">
                    <h6 class="footer-title mb-6">SNS</h6>
                    <div class="d-flex footer-social-icons">
                        <a href="<c:out value="${setting.youtubeLink.content}" />" class="me-3" target="_blank"><img src="/static/pages/mber/assets/icon/sns/youtube.svg" alt="YouTube"></a>
                        <a href="<c:out value="${setting.facebookLink.content}" />" class="me-3" target="_blank"><img src="/static/pages/mber/assets/icon/sns/facebook.svg" alt="Facebook"></a>
                        <a href="<c:out value="${setting.instargramLink.content}" />" class="me-3" target="_blank"><img src="/static/pages/mber/assets/icon/sns/instargram.svg" alt="Instagram"></a>
                        <a href="<c:out value="${setting.naverblogLink.content}" />" target="_blank"><img src="/static/pages/mber/assets/icon/sns/naverblog.svg" alt="Naver Blog"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>