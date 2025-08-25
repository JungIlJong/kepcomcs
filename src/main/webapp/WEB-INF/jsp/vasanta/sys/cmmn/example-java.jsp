<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>목록 페이지 샘플</title>
    <script src="/static/vendor/sneat/libs/swiper/swiper.js"></script>
    <script src="/static/js/common/commonUi.js"></script>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/swiper/swiper.css" />
    <!-- Highlight.js -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/github-dark-dimmed.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/languages/java.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/languages/xml.min.js"></script>
    <script src="/static/js/common/snippetUtil.js"></script>
</head>
<body data-bs-spy="scroll" data-bs-target="#tocNav" data-bs-offset="100" tabindex="0">
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->
        <!-- / Menu -->

        <!-- Layout page -->
        <div class="layout-page">

            <!-- Navbar -->
            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
                <div class="container-xxl flex-grow-1 container-p-y">
                    <div class="row">
                        <!-- Main Content -->
                        <div class="col-md-10">
                            <%--TODO 화면 콘텐츠 구현--%>
                            <h1 class="card-header">신규 기능 개발</h1>
                            <!-- 컨텐츠 시작 -->
                            <!-- Datatable Example Card -->
                            <div class="card mb-4">
                                <h3 class="card-header">패키지 구조</h3>
                                <div class="collapse show">
                                    <div class="card-body">
                                        <!-- language switcher -->
                                        <!-- Code snippet display area -->
                                        <pre id="package-structure">
com.kepco.app
├── domain                          # 비즈니스 도메인별 패키지 구조
│   └── sample                      # 샘플 도메인 (다른 도메인도 동일한 구조)
│       ├── api                     # REST API 컨트롤러
│       │   ├── SampleApi.java      # 사용자용 API 컨트롤러 클래스
│       │   └── SampleSysApi.java   # 관리자용 API 컨트롤러 클래스
│       ├── dto                     # 데이터 전송 객체
│       │   ├── SampleResponse.java # 응답 데이터 구조 정의 (Getter만 사용)
│       │   └── SampleSearchRequest.java # 검색 요청 파라미터 정의
│       ├── mapper                  # MyBatis 매퍼 인터페이스
│       │   ├── SampleMapper.java   # 사용자용 SQL 쿼리와 자바 객체 매핑 인터페이스
│       │   └── SampleSysMapper.java # 관리자용 SQL 쿼리와 자바 객체 매핑 인터페이스
│       ├── service                 # 비즈니스 로직 담당 계층
│       │   ├── SampleService.java  # 사용자용 서비스 인터페이스
│       │   ├── SampleSysService.java # 관리자용 서비스 인터페이스
│       │   └── impl                # 서비스 구현체 패키지
│       │        ├── SampleServiceImpl.java # 사용자용 비즈니스 로직 구현 클래스
│       │        └── SampleSysServiceImpl.java # 관리자용 비즈니스 로직 구현 클래스
├── front                           # 프론트엔드 관련 컨트롤러
│   └── sample                      # 샘플 프론트 컨트롤러
│       └── controller              # MVC 컨트롤러
│           └── SampleController.java # 샘플 화면 컨트롤러

src/main/resources/egovframework/sqlmap  # MyBatis SQL 매핑 파일 경로
└── mappers                         # 도메인별 SQL 매핑 XML 파일 저장 위치
    └── sample                      # 도메인 SQL 매핑
        ├── SampleMapper_mysql.xml  # 사용자용 SQL 매핑 (postfix로 "_mysql" 추가)
        └── SampleSysMapper_mysql.xml # 관리자용 SQL 매핑 (postfix로 "_mysql" 추가)
</pre>
                                    </div>
                                </div>
                            </div>

                                <div class="card mb-4" id="section1">
                                    <!-- 소제목 -->
                                    <h3 class="card-header">
                                        <i class="bx bx-code-alt me-2 text-primary"></i>
                                        <span class="snippet-title">Mapper 생성</span>
                                    </h3>

                                    <!-- 설명 -->
                                    <div class="card-body">
                                        <div class="snippet-description mb-3">
                                            <ul>
                                                <li>com.kepco.app.domain.sample.mapper에 Mapper 인터페이스 구현</li>
                                                <li>org.apache.ibatis.annotations.Mapper의 Mapper 어노테이션 필수</li>
                                                <li>관리자용 경우 Sys를 중간에 추가</li>
                                            </ul>
                                        </div>

                                        <!-- 코드 스닛 -->
                                        <div class="code-container">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="badge bg-label-primary">Java</span>
                                                <button class="btn btn-sm btn-primary rounded-pill copy-btn" type="button" onclick="copyToClipboard('code-snippet-1')">
                                                    <i class="bx bx-copy me-1"></i>
                                                    <span>복사</span>
                                                </button>
                                            </div>
                                            <pre><code class="language-java" id="code-snippet-1">import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface SampleMapper {

    /* 1. 단건 조회 */
    SampleResponse selectSample(@Param("id") Long id);

    /* 2. 목록 조회 (조건+페이징) */
    List<SampleResponse> selectSampleList(SampleSearchRequest sampleSearchRequest);

    /* 3. 총 개수 */
    int selectSampleTotCnt(SampleSearchRequest sampleSearchRequest);

    /* 4. 등록 */
    int insertSample(Map<String, Object> params);

    /* 5. 수정 */
    int updateSample(Map<String, Object> params);

    /* 6. 삭제 */
    int deleteSample(@Param("id") Long id);
}</code></pre>
                                        </div>
                                    </div>
                                </div>

                                <div class="card mb-4" id="mapper-xml">
                                    <!-- 소제목 -->
                                    <h3 class="card-header">
                                        <i class="bx bx-code-alt me-2 text-primary"></i>
                                        <span class="snippet-title">Mapper.xml 생성</span>
                                    </h3>

                                    <!-- 설명 -->
                                    <div class="card-body">
                                        <div class="snippet-description mb-3">
                                            코드 예제에 대한 설명이 들어갑니다. 이 부분에 코드의 목적, 사용법, 주요 기능 등을 설명합니다.
                                        </div>

                                        <!-- 코드 스닛 -->
                                        <div class="code-container">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="badge bg-label-primary">Xml</span>
                                                <button class="btn btn-sm btn-primary rounded-pill copy-btn" type="button" onclick="copyToClipboard('snippet-code-example')">
                                                    <i class="bx bx-copy me-1"></i>
                                                    <span>복사</span>
                                                </button>
                                            </div>
                                            <pre><code class="language-xml" id="snippet-code-example2"></code></pre>
                                        </div>
                                    </div>
                                </div>

                                <div class="card mb-4" id="dto">
                                    <!-- 소제목 -->
                                    <h3 class="card-header">
                                        <i class="bx bx-code-alt me-2 text-primary"></i>
                                        <span class="snippet-title">DTO 생성</span>
                                    </h3>

                                    <!-- 설명 -->
                                    <div class="card-body">
                                        <div class="snippet-description mb-3">
                                            <ul>
                                                <li>dto 패키지에 DTO 클래스 생성</li>
                                                <li>목록 조회 DTO의 경우는 <b class="text-danger">ComSearchVO를 상속</b></li>
                                            </ul>
                                            <b>DTO 네이밍 컨벤션</b>
                                            <ul>
                                                <li>SampleCreateRequest: 생성 요청 DTO</li>
                                                <li>SampleCreateResponse: 생성 응답 DTO</li>
                                                <li>SampleUpdateRequest: 수정 요청 DTO</li>
                                                <li>SampleUpdateResponse: 수정 응답 DTO</li>
                                                <li>SampleSearchRequest: 목록 조회 요청 DTO(ComsearchVO 상속)</li>
                                                <li>SampleSearchResponse: 목록 조회 응답 DTO</li>
                                                <li>SampleDetailRequest: 단건 조회 요청 DTO(혹은 ID 기준)</li>
                                                <li>SampleDetailResponse: 단건 조회 응답 DTO</li>
                                            </ul>
                                        </div>
                                        <!-- 코드 스닛 -->
                                        <div class="code-container">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="badge bg-label-primary">Java</span>
                                                <button class="btn btn-sm btn-primary rounded-pill copy-btn" type="button" onclick="copyToClipboard('snippet-code-example')">
                                                    <i class="bx bx-copy me-1"></i>
                                                    <span>복사</span>
                                                </button>
                                            </div>
                                            <pre><code class="language-java" id="snippet-code-example3">
@Getter
@Setter
public class SampleSearchRequest extends ComSearchVO {
}
                                            </code></pre>
                                        </div>
                                    </div>

                                </div>

                                <div class="card mb-4" id="service-impl">
                                    <!-- 소제목 -->
                                    <h3 class="card-header">
                                        <i class="bx bx-code-alt me-2 text-primary"></i>
                                        <span class="snippet-title">서비스 구현체 생성</span>
                                    </h3>

                                    <!-- 설명 -->
                                    <div class="card-body">
                                        <div class="snippet-description mb-3">
                                            <ul>
                                                <li>반드시 <b class="text-danger">EgovAbstractServiceImpl</b>를 상속을 받아야 전자정부인증을 받을 수 있습니다.</li>
                                                <li>searchList, searchTotCnt의ComSearchVO는 형변환을 통해 Mapper로 전달해주세요.</li>
                                            </ul>
                                        </div>

                                        <!-- 코드 스닛 -->
                                        <div class="code-container">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="badge bg-label-primary">Java</span>
                                                <button class="btn btn-sm btn-primary rounded-pill copy-btn" type="button" onclick="copyToClipboard('snippet-code-example')">
                                                    <i class="bx bx-copy me-1"></i>
                                                    <span>복사</span>
                                                </button>
                                            </div>
                                            <pre><code class="language-java" id="snippet-code-example5">
@RequiredArgsConstructor
@Service
public class SampleServiceImpl extends EgovAbstractServiceImpl implements SampleService {
    private final SampleMapper sampleMapper;

    @Override
    public List<?> searchList(ComSearchVO comSearchVO) {
        return sampleMapper.selectSampleList((SampleSearchRequest) comSearchVO);
    }

    @Override
    public int searchTotCnt(ComSearchVO comSearchVO) {
        return sampleMapper.countSample((SampleSearchRequest) comSearchVO);
    }
}
</code></pre>
                                        </div>
                                    </div>
                                </div>

                                <div class="card mb-4" id="service-interface">
                                    <!-- 소제목 -->
                                    <h3 class="card-header">
                                        <i class="bx bx-code-alt me-2 text-primary"></i>
                                        <span class="snippet-title">서비스 인터페이스 생성</span>
                                    </h3>

                                    <!-- 설명 -->
                                    <div class="card-body">
                                        <div class="snippet-description mb-3">
                                            최대한 import com.kepco.app.core.service.ComSearchService 인터페이스를 상속해주세요.
                                        </div>

                                        <!-- 코드 스닛 -->
                                        <div class="code-container">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="badge bg-label-primary">Java</span>
                                                <button class="btn btn-sm btn-primary rounded-pill copy-btn" type="button" onclick="copyToClipboard('snippet-code-example')">
                                                    <i class="bx bx-copy me-1"></i>
                                                    <span>복사</span>
                                                </button>
                                            </div>
                                            <pre><code class="language-java" id="snippet-code-example4">
import com.kepco.app.core.service.ComSearchService;

public interface SampleService extends ComSearchService {
}</code></pre>
                                        </div>
                                    </div>
                                </div>

                                <div class="card mb-4" id="api">
                                    <!-- 소제목 -->
                                    <h3 class="card-header">
                                        <i class="bx bx-code-alt me-2 text-primary"></i>
                                        <span class="snippet-title">API 생성</span>
                                    </h3>

                                    <!-- 설명 -->
                                    <div class="card-body">
                                        <div class="snippet-description mb-3">
                                            <ul>
                                                <li class="text-danger">관리자의 경우에는 API 경로를 "/api/sys"를 prefix로 사용</li>
                                                <li>Validation 처리는 Spring Validation 사용</li>
                                            </ul>
                                        </div>
                                        <!-- 코드 스닛 -->
                                        <div class="code-container">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="badge bg-label-primary">Java</span>
                                                <button class="btn btn-sm btn-primary rounded-pill copy-btn" type="button" onclick="copyToClipboard('snippet-code-example')">
                                                    <i class="bx bx-copy me-1"></i>
                                                    <span>복사</span>
                                                </button>
                                            </div>
                                            <pre><code class="language-java" id="snippet-code-example6">
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/samples")
public class SampleApi {
    private final SampleService sampleService;

    @GetMapping
    public ResponseEntity<?> List(@Valid SampleSearchRequest sampleSearchRequest) {
        return ResponseEntity.ok(SearchUtil.search(sampleSearchRequest, sampleService));
    }
}
                                            </code></pre>
                                        </div>
                                    </div>
                                </div>

                                <div class="card mb-4" id="controller">
                                    <!-- 소제목 -->
                                    <h3 class="card-header">
                                        <i class="bx bx-code-alt me-2 text-primary"></i>
                                        <span class="snippet-title">View 코드 생성</span>
                                    </h3>

                                    <!-- 설명 -->
                                    <div class="card-body">
                                        <div class="snippet-description mb-3">
                                            <ul>
                                                <li class="text-danger">관리자의 경우에는 View 경로를 "/sys"를 prefix로 사용</li>
                                                <li>View 코드의 패키지 경로는 반드시 <b>com.kepco.app.front</b> 에 생성</li>
                                            </ul>
                                        </div>

                                        <!-- 코드 스닛 -->
                                        <div class="code-container">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="badge bg-label-primary">Java</span>
                                                <button class="btn btn-sm btn-primary rounded-pill copy-btn" type="button" onclick="copyToClipboard('snippet-code-example')">
                                                    <i class="bx bx-copy me-1"></i>
                                                    <span>복사</span>
                                                </button>
                                            </div>
                                            <pre><code class="language-java" id="snippet-code-example7">
@Controller
public class SampleController {

    /* 디자인팀 협업용 샘플 페이지 이동 */
    @GetMapping("/sample/list")
    public  String goSampleListPage() {
        return "sys/cmmn/list-page-template";
    }

    @GetMapping("/sample/example-datatable")
    public String goSampleTablePage() {
        return "sys/cmmn/example-datatable";
    }

    @GetMapping("/sample/java")
    public String goSampleJavaPage() {
        return "sys/cmmn/example-java";
    }
}
                                            </code></pre>
                                        </div>
                                    </div>
                                </div>
                            <!-- 컨텐츠 끝 -->
                        </div><!-- /col-md-10 -->
                        <!-- TOC Sidebar -->
                        <nav id="tocNav" class="col-md-2 d-none d-md-block list-group position-fixed" style="top: 80px; right: 20px; max-width: 250px;">
                            <div class="mb-3">
                                <a href="/sample" class="btn btn-outline-primary btn-sm d-flex align-items-center">
                                    <i class="bx bx-arrow-back me-1"></i>
                                    <span>목록으로 돌아가기</span>
                                </a>
                            </div>
                            <h5 class="mb-3">목차</h5>
                            <div class="list-group">
                                <a class="list-group-item list-group-item-action" href="#package-structure">
                                    <i class="bx bx-folder me-2 text-primary"></i>패키지 구조
                                </a>
                                <a class="list-group-item list-group-item-action" href="#section1">
                                    <i class="bx bx-code me-2 text-primary"></i>Mapper 생성
                                </a>
                                <a class="list-group-item list-group-item-action" href="#mapper-xml">
                                    <i class="bx bx-file me-2 text-primary"></i>Mapper.xml 생성
                                </a>
                                <a class="list-group-item list-group-item-action" href="#dto">
                                    <i class="bx bx-data me-2 text-primary"></i>DTO 생성
                                </a>
                                <a class="list-group-item list-group-item-action" href="#service-impl">
                                    <i class="bx bx-cog me-2 text-primary"></i>서비스 구현체 생성
                                </a>
                                <a class="list-group-item list-group-item-action" href="#service-interface">
                                    <i class="bx bx-layer me-2 text-primary"></i>서비스 인터페이스 생성
                                </a>
                                <a class="list-group-item list-group-item-action" href="#api">
                                    <i class="bx bx-server me-2 text-primary"></i>API 생성
                                </a>
                                <a class="list-group-item list-group-item-action" href="#controller">
                                    <i class="bx bx-window me-2 text-primary"></i>화면 코드 생성
                                </a>
                            </div>
                        </nav>
                    </div><!-- /row -->
                </div>
                <!--/ Content -->
                <div class="content-backdrop fade"></div>
            </div>
            <!--/ Content wrapper -->
        </div>
        <!--/ Layout page -->

    </div>
</div>

<template id="snippet-template">
    <div class="card mb-4">
        <!-- 소제목 -->
        <h3 class="card-header">
            <i class="bx bx-code-alt me-2 text-primary"></i>
            <span class="snippet-title">코드 예제 제목</span>
        </h3>
        
        <!-- 설명 -->
        <div class="card-body">
            <div class="snippet-description mb-3">
                코드 예제에 대한 설명이 들어갑니다. 이 부분에 코드의 목적, 사용법, 주요 기능 등을 설명합니다.
            </div>
            
            <!-- 코드 스닛 -->
            <div class="code-container">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="badge bg-label-primary">Java</span>
                    <button class="btn btn-sm btn-primary rounded-pill copy-btn" type="button" onclick="copyToClipboard('snippet-code-example')">
                        <i class="bx bx-copy me-1"></i>
                        <span>복사</span>
                    </button>
                </div>
                <pre><code class="language-java" id="snippet-code-example">public class Example {
    /**
     * 샘플 메소드
     * @param param 파라미터 설명
     * @return 반환값 설명
     */
    public String sampleMethod(String param) {
        // 코드 구현
        return "결과값";
    }
}</code></pre>
            </div>
        </div>
    </div>
</template>

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

<!--/ Layout wrapper -->

<script>
    $(document).ready(function () {
        // 현재 페이지에 있는 모든 스니펫 섹션 초기화
        // 섹션 ID 배열 - 빈 문자열은 기본 섹션, 숫자는 추가 섹션
        const sectionIds = ['', 'service-impl', 'service-interface', 'api', 'controller'];
        SnippetUtil.initAllSnippets(sectionIds);
 
        // 구문 강조 적용
        if(window.hljs){
            hljs.highlightAll();
            console.log('Highlight.js initialized');
        }
 
        // 초기 렌더링 – 기본 언어 스니펫 표시
        SnippetUtil.renderInitialSnippets(sectionIds, 'java');
    });
    
    // 클립보드에 코드 복사 함수
    function copyToClipboard(elementId) {
        const codeElement = document.getElementById(elementId);
        if (!codeElement) return;
        
        const textToCopy = codeElement.textContent;
        
        // 클립보드에 복사
        navigator.clipboard.writeText(textToCopy).then(
            function() {
                // 복사 성공 시 버튼 텍스트 변경
                const button = document.querySelector(`button[onclick="copyToClipboard('${elementId}')"]`);
                const originalText = button.innerHTML;
                button.innerHTML = '<i class="bx bx-check me-1"></i><span>복사됨</span>';
                
                // 2초 후 원래 텍스트로 복원
                setTimeout(() => {
                    button.innerHTML = originalText;
                }, 2000);
            },
            function() {
                console.error('클립보드 복사 실패');
            }
        );
    }
</script>

</body>

</html>
