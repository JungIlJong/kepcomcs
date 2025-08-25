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
                            <!-- 컨텐츠 시작 -->
                            <!-- Datatable Example Card -->
                            <div class="card mb-4">
                                <h1 id="datatable-section" class="card-header">Datatable 생성</h1>
                                <div class="row card-body">
                                    <div class="card-datatable">
                                        <div class="dt-container dt-bootstrap5 dt-empty-footer border-bottom">
                                            <div class="row mx-3 my-0 justify-content-between">
                                                <div>
                                                    <div class="row me-4 mb-4 col-12 justify-content-between">
                                                        <div class="col-6">
                                                            <div class="form-control-validation fv-plugins-icon-container">
                                                                <label class="form-label" for="ntce">등록일자 범위 선택</label>
                                                                <div class="d-flex justify-content-start" id="ntce">
                                                                    <div class="mb-0 me-4">
                                                                        <div class="input-group input-group-merge">
                                                                            <input type="text"
                                                                                   class="dt-datetime form-control flatpickr-input"
                                                                                   placeholder="<spring:message code='table.header.stDt'/>"
                                                                                   id="stDt" name="stDt" readonly>
                                                                            <span class="input-group-text cursor-pointer"
                                                                                  onclick=""><i
                                                                                    class="icon-base bx bx-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mb-0 me-4 d-flex align-items-center">
                                                                <span class="form-label"><i
                                                                        class="icon-base bx bx-minus"></i></span>
                                                                    </div>
                                                                    <div class="mb-0 me-4">
                                                                        <div class="input-group input-group-merge">
                                                                            <input type="text"
                                                                                   class="dt-datetime form-control flatpickr-input"
                                                                                   placeholder="<spring:message code='table.header.endDt'/>"
                                                                                   id="endDt" name="endDt" readonly>
                                                                            <span class="input-group-text cursor-pointer"
                                                                                  onclick=""><i
                                                                                    class="icon-base bx bx-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="justify-content-between dt-layout-table">
                                            <div class="justify-content-between align-items-center dt-layout-full table-responsive">
                                                <table class="datatables-ntts table border-top dataTable dtr-column"
                                                       id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="code-section" class="card-header bg-transparent border-0 pt-4 pb-0">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <h5 class="m-0 fw-semibold d-flex align-items-center">
                                            <i class="icon-base bx bx-code-alt me-2 text-primary"></i>
                                            <span>Code Implementation</span>
                                        </h5>
                                        <button id="toggleCode" class="btn btn-sm btn-primary rounded-pill shadow-sm" type="button" data-bs-toggle="collapse" data-bs-target="#codeSample" aria-expanded="false" aria-controls="codeSample">
                                            <i class="icon-base bx bx-code me-1"></i>
                                            <span>View Code</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="collapse" id="codeSample">
                                    <div class="card-body">
                                        <!-- language switcher -->
                                        <div class="mb-2">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <button id="html-code" type="button" class="btn btn-outline-secondary active" data-lang="html">html</button>
                                                <button id="javascript-code" type="button" class="btn btn-outline-secondary" data-lang="javascript">javascript</button>
                                            </div>
                                        </div>
                                        <!-- Code snippet display area -->
                                        <pre><code id="codeSampleBlock" class="language-javascript"></code></pre>
                                        <!-- Hidden raw snippets -->
                                        <script id="init-js" type="text/plain">
                                            DataTableUtil.create('#DataTables_Table_0', {
                                                            ajax: { url: '/api/samples', type: 'GET' },
                                                            showAddButton: false,
                                                            // columns: 데이터 테이블의 각 열을 정의
                                                            // data 속성은 DTO의 필드명과 일치해야 함
                                                            columns: [
                                                                // 1번 열
                                                                {data: null},
                                                                // 2번 열
                                                                {data: 'title'},
                                                                // 3번 열
                                                                {data: 'writer'},
                                                                // 4번 열
                                                                {data: 'createdAt'},
                                                                // 5번 열
                                                                {data: 'id'}
                                                            ],
                                                            // columnDefs: 열에 대한 추가 정의 및 렌더링 방식 설정
                                                            columnDefs: [
                                                                {
                                                                    // targets: 0 - 첫 번째 열(번호)에 대한 설정
                                                                    targets: 0,
                                                                    // 검색 불가능
                                                                    searchable: false,
                                                                    // 정렬 불가능
                                                                    orderable: false,
                                                                    // 열 제목
                                                                    title: '번호',
                                                                    // CSS 클래스 추가(필요할 경우)
                                                                    className: 'dt-col-num',
                                                                    // 렌더링 함수 - 자동 번호 생성 (페이지 내 행 번호)
                                                                    render: function (data, type, full, meta) {
                                                                        // 현재 페이지의 첫번째 row index(meta.settings._iDisplayStart)에
                                                                        // 0-based row 번호(meta.row) 를 더한 뒤 1 보정
                                                                        return meta.settings._iDisplayStart + meta.row + 1;
                                                                    }
                                                                },
                                                                {
                                                                    // targets: 1 - 두 번째 열(제목)에 대한 설정
                                                                    targets: 1,
                                                                    // 열 제목
                                                                    title: '제목',
                                                                    // 렌더링 함수 - 제목 표시
                                                                    render: function (data, type, full, meta) {
                                                                        return data;
                                                                    }
                                                                },
                                                                {
                                                                    // targets: 2 - 세 번째 열(작성자)에 대한 설정
                                                                    targets: 2,
                                                                    // 열 제목
                                                                    title: '작성자',
                                                                    // 렌더링 함수 - 작성자 표시
                                                                    render: function (data, type, full, meta) {
                                                                        return data;
                                                                    }
                                                                },
                                                                {
                                                                    // targets: 3 - 네 번째 열(등록 날짜)에 대한 설정
                                                                    targets: 3,
                                                                    // 열 제목
                                                                    title: '등록 날짜',
                                                                    // CSS 클래스
                                                                    className: 'dt-col-date',
                                                                    // 렌더링 함수 - 등록 날짜 표시
                                                                    render: function (data, type, full, meta) {
                                                                        return data;
                                                                    }
                                                                },
                                                                {
                                                                    // targets: 4 - 다섯 번째 열(ID)에 대한 설정
                                                                    targets: 4,
                                                                    // 렌더링 함수 - 액션 버튼 표시
                                                                    render: function (data, type, full, meta) {
                                                                        return `<div class="d-flex gap-1 justify-content-center" data-id="${'${data}'}">
                <button onclick="#!" class="btn btn-sm btn-label-secondary" data-action="detail">
                  <i class="icon-base bx bx-pencil icon-xs"></i>상세
                </button>
                <button onclick="#!" class="btn btn-sm btn-label-danger" data-action="delete">
                  <i class="icon-base bx bx-trash icon-xs"></i>삭제
                </button>
              </div>`
                                                                    }
                                                                }
                                                            ]
                                                        });
                                        </script>
                                        <!-- HTML 스니펫 -->
                                        <script id="snippet-html" type="text/plain">
<!-- DataTable 기본 구조 -->
<div class="row card-body">
                                    <div class="card-datatable">
                                        <div class="dt-container dt-bootstrap5 dt-empty-footer border-bottom">
                                            <div class="row mx-3 my-0 justify-content-between">
                                                <div>
                                                    <div class="row me-4 mb-4 col-12 justify-content-between">
                                                        <div class="col-6">
                                                            <div class="form-control-validation fv-plugins-icon-container">
                                                                <label class="form-label" for="ntce">등록일자 범위 선택</label>
                                                                <div class="d-flex justify-content-start" id="ntce">
                                                                    <div class="mb-0 me-4">
                                                                        <div class="input-group input-group-merge">
                                                                            <input type="text"
                                                                                   class="dt-datetime form-control flatpickr-input"
                                                                                   placeholder="<spring:message code='table.header.stDt'/>"
                                                                                   id="stDt" name="stDt" readonly>
                                                                            <span class="input-group-text cursor-pointer"
                                                                                  onclick=""><i
                                                                                    class="icon-base bx bx-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="mb-0 me-4 d-flex align-items-center">
                                                                <span class="form-label"><i
                                                                        class="icon-base bx bx-minus"></i></span>
                                                                    </div>
                                                                    <div class="mb-0 me-4">
                                                                        <div class="input-group input-group-merge">
                                                                            <input type="text"
                                                                                   class="dt-datetime form-control flatpickr-input"
                                                                                   placeholder="<spring:message code='table.header.endDt'/>"
                                                                                   id="endDt" name="endDt" readonly>
                                                                            <span class="input-group-text cursor-pointer"
                                                                                  onclick=""><i
                                                                                    class="icon-base bx bx-calendar"></i></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="justify-content-between dt-layout-table">
                                            <div class="justify-content-between align-items-center dt-layout-full table-responsive">
                                                <table class="datatables-ntts table border-top dataTable dtr-column"
                                                       id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                        </script>
                                    </div>
                            </div>
                            </div>

                            <div class="card mb-4">
                                <h1 id="datatable-section2" class="card-header">Input, select 추가</h1>
                                <div class="row card-body">
                                    <div class="card-datatable">
                                        <div class="dt-container dt-bootstrap5 dt-empty-footer border-bottom">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="form-label" for="ntce2">등록일자 범위 선택</label>
                                                    <div class="d-flex justify-content-start" id="ntce2">
                                                        <div class="mb-0 me-2 col-5">
                                                            <div class="input-group input-group-merge">
                                                                <input type="text"
                                                                       class="dt-datetime form-control flatpickr-input"
                                                                       placeholder="<spring:message code='table.header.stDt'/>"
                                                                       id="stDt2" name="stDt" readonly>
                                                                <span class="input-group-text cursor-pointer"
                                                                      onclick="openStDt(this)"><i
                                                                        class="icon-base bx bx-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="mb-0 me-2 d-flex align-items-center">
                                                                        <span class="form-label"><i
                                                                                class="icon-base bx bx-minus"></i></span>
                                                        </div>
                                                        <div class="mb-0 col-5">
                                                            <div class="input-group input-group-merge">
                                                                <input type="text"
                                                                       class="dt-datetime form-control flatpickr-input"
                                                                       placeholder="<spring:message code='table.header.endDt'/>"
                                                                       id="endDt2" name="endDt" readonly>
                                                                <span class="input-group-text cursor-pointer"
                                                                      onclick="openEndDt(this)"><i
                                                                        class="icon-base bx bx-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">카테고리</label>
                                                    <div class="d-flex">
                                                        <div class="mb-0 me-3 col-5">
                                                            <select id="user" name="user" class="select2 form-select form-select-lg" data-allow-clear="false">
                                                                <option value="">선택하세요</option>
                                                                <option value="user1">user1</option>
                                                                <option value="user2">user2</option>
                                                                <option value="user3">user3</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="justify-content-between dt-layout-table">
                                            <div class="justify-content-between align-items-center dt-layout-full table-responsive">
                                                <table class="datatables-ntts table border-top dataTable dtr-column"
                                                       id="DataTables_Table_2" aria-describedby="DataTables_Table_0_info">
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="code-section2" class="card-header bg-transparent border-0 pt-4 pb-0">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <h5 class="m-0 fw-semibold d-flex align-items-center">
                                            <i class="icon-base bx bx-code-alt me-2 text-primary"></i>
                                            <span>Code Implementation</span>
                                        </h5>
                                        <button id="toggleCode2" class="btn btn-sm btn-primary rounded-pill shadow-sm" type="button" data-bs-toggle="collapse" data-bs-target="#codeSample2" aria-expanded="false" aria-controls="codeSample2">
                                            <i class="icon-base bx bx-code me-1"></i>
                                            <span>View Code</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="collapse" id="codeSample2">
                                    <div class="card-body">
                                        <!-- language switcher -->
                                        <div class="mb-2">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <button id="html-code2" type="button" class="btn btn-outline-secondary active" data-lang="html">html</button>
                                                <button id="javascript-code2" type="button" class="btn btn-outline-secondary" data-lang="javascript">javascript</button>
                                            </div>
                                        </div>
                                        <!-- Code snippet display area -->
                                        <pre><code id="codeSampleBlock2" class="language-javascript"></code></pre>
                                        <!-- Hidden raw snippets -->
                                        <script id="init-js2" type="text/plain">
                                            DataTableUtil.create('#DataTables_Table_2', {
            ajax: { url: '/api/samples', type: 'GET' },
            showAddButton: false,
            // columns: 데이터 테이블의 각 열을 정의
            // data 속성은 DTO의 필드명과 일치해야 함
            columns: [
                // 1번 열
                {data: null},
                // 2번 열
                {data: 'title'},
                // 3번 열
                {data: 'writer'},
                // 4번 열
                {data: 'createdAt'},
                // 5번 열
                {data: 'id'}
            ],
            // columnDefs: 열에 대한 추가 정의 및 렌더링 방식 설정
            columnDefs: [
                {
                    // targets: 0 - 첫 번째 열(번호)에 대한 설정
                    targets: 0,
                    // 검색 불가능
                    searchable: false,
                    // 정렬 불가능
                    orderable: false,
                    // 열 제목
                    title: '번호',
                    // CSS 클래스 추가(필요할 경우)
                    className: 'dt-col-num',
                    // 렌더링 함수 - 자동 번호 생성 (페이지 내 행 번호)
                    render: function (data, type, full, meta) {
                        // 현재 페이지의 첫번째 row index(meta.settings._iDisplayStart)에
                        // 0-based row 번호(meta.row) 를 더한 뒤 1 보정
                        return meta.settings._iDisplayStart + meta.row + 1;
                    }
                },
                {
                    // targets: 1 - 두 번째 열(제목)에 대한 설정
                    targets: 1,
                    // 열 제목
                    title: '제목',
                    // 렌더링 함수 - 제목 표시
                    render: function (data, type, full, meta) {
                        return data;
                    }
                },
                {
                    // targets: 2 - 세 번째 열(작성자)에 대한 설정
                    targets: 2,
                    // 열 제목
                    title: '작성자',
                    // 렌더링 함수 - 작성자 표시
                    render: function (data, type, full, meta) {
                        return data;
                    }
                },
                {
                    // targets: 3 - 네 번째 열(등록 날짜)에 대한 설정
                    targets: 3,
                    // 열 제목
                    title: '등록 날짜',
                    // CSS 클래스
                    className: 'dt-col-date',
                    // 렌더링 함수 - 등록 날짜 표시
                    render: function (data, type, full, meta) {
                        return data;
                    }
                },
                {
                    // targets: 4 - 다섯 번째 열(ID)에 대한 설정
                    targets: 4,
                    // 렌더링 함수 - 액션 버튼 표시
                    render: function (data, type, full, meta) {
                        return `<div class="d-flex gap-1 justify-content-center" data-id="${data}">
                <button onclick="#!" class="btn btn-sm btn-label-secondary" data-action="detail">
                  <i class="icon-base bx bx-pencil icon-xs"></i>상세
                </button>
                <button onclick="#!" class="btn btn-sm btn-label-danger" data-action="delete">
                  <i class="icon-base bx bx-trash icon-xs"></i>삭제
                </button>
              </div>`
                    }
                }
            ],
            externalFilters: { // 외부 필터 추가
                user: '#user' // 파라미터명: 필터 선택자
            }
        });
                                        </script>
                                        <!-- HTML 스니펫 -->
                                        <script id="snippet-html2" type="text/plain">
<div class="row card-body">
                                    <div class="card-datatable">
                                        <div class="dt-container dt-bootstrap5 dt-empty-footer border-bottom">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <label class="form-label" for="ntce2">등록일자 범위 선택</label>
                                                    <div class="d-flex justify-content-start" id="ntce2">
                                                        <div class="mb-0 me-2 col-5">
                                                            <div class="input-group input-group-merge">
                                                                <input type="text"
                                                                       class="dt-datetime form-control flatpickr-input"
                                                                       placeholder="<spring:message code='table.header.stDt'/>"
                                                                       id="stDt2" name="stDt" readonly>
                                                                <span class="input-group-text cursor-pointer"
                                                                      onclick="openStDt(this)"><i
                                                                        class="icon-base bx bx-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="mb-0 me-2 d-flex align-items-center">
                                                                        <span class="form-label"><i
                                                                                class="icon-base bx bx-minus"></i></span>
                                                        </div>
                                                        <div class="mb-0 col-5">
                                                            <div class="input-group input-group-merge">
                                                                <input type="text"
                                                                       class="dt-datetime form-control flatpickr-input"
                                                                       placeholder="<spring:message code='table.header.endDt'/>"
                                                                       id="endDt2" name="endDt" readonly>
                                                                <span class="input-group-text cursor-pointer"
                                                                      onclick="openEndDt(this)"><i
                                                                        class="icon-base bx bx-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">카테고리</label>
                                                    <div class="d-flex">
                                                        <div class="mb-0 me-3 col-5">
                                                            <select id="user" name="user" class="select2 form-select form-select-lg" data-allow-clear="false">
                                                                <option value="">선택하세요</option>
                                                                <option value="user1">user1</option>
                                                                <option value="user2">user2</option>
                                                                <option value="user3">user3</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="justify-content-between dt-layout-table">
                                            <div class="justify-content-between align-items-center dt-layout-full table-responsive">
                                                <table class="datatables-ntts table border-top dataTable dtr-column"
                                                       id="DataTables_Table_2" aria-describedby="DataTables_Table_0_info">
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                        </script>
                                    </div>
                            </div>
                            </div>
                                <div class="card mb-4">
                                    <h1 id="datatable-section3" class="card-header">Row 버튼 이벤트 등록</h1>
                                                                    <div id="code-section3" class="card-header bg-transparent border-0 pt-4 pb-0">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <h5 class="m-0 fw-semibold d-flex align-items-center">
                                            <i class="icon-base bx bx-code-alt me-2 text-primary"></i>
                                            <span>Code Implementation</span>
                                        </h5>
                                        <button id="toggleCode3" class="btn btn-sm btn-primary rounded-pill shadow-sm" type="button" data-bs-toggle="collapse" data-bs-target="#codeSample3" aria-expanded="false" aria-controls="codeSample3">
                                            <i class="icon-base bx bx-code me-1"></i>
                                            <span>View Code</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="collapse" id="codeSample3">
                                    <div class="card-body">
                                        <!-- language switcher -->
                                        <div class="mb-2">
                                            <div class="btn-group btn-group-sm" role="group">
                                                <button id="html-code3" type="button" class="btn btn-outline-secondary active" data-lang="html">html</button>
                                                <button id="javascript-code3" type="button" class="btn btn-outline-secondary" data-lang="javascript">javascript</button>
                                            </div>
                                        </div>
                                        <!-- Code snippet display area -->
                                        <pre><code id="codeSampleBlock3" class="language-javascript"></code></pre>
                                        <!-- Hidden raw snippets -->
                                        <script id="init-js3" type="text/plain">
$('#DataTables_Table_0').on('click', 'button[data-action]', e => {
        e.preventDefault();
        // button에 data-action attribute로 action 정의
        const $btn      = $(e.currentTarget);
        const action    = $btn.data('action');
        const rowData   = dt.row($btn.closest('tr')).data();

        action === 'delete'
            ? deleteMarker(rowData)
            : detailMarker(rowData);
    });</script>
                                        <!-- HTML 스니펫 -->
                                        <script id="snippet-html3" type="text/plain">
// datatable 생성할 때 column에 html 정의
<div class="d-flex gap-1 justify-content-center" data-id="">
                <button onclick="#!" class="btn btn-sm btn-label-secondary" data-action="detail">
                  <i class="icon-base bx bx-pencil icon-xs"></i>상세
                </button>
                <button onclick="#!" class="btn btn-sm btn-label-danger" data-action="delete">
                  <i class="icon-base bx bx-trash icon-xs"></i>삭제
                </button>
              </div></script>
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
                            <!-- 1단계 항목 -->
                            <a class="list-group-item list-group-item-action" href="#datatable-section">초기 생성</a>
                            <a class="list-group-item list-group-item-action ps-4 border-start-0 border-end-0" href="#code-section">
                                <i class="bx bx-right-arrow-alt me-1 text-primary"></i>
                                <span>Code Implementation</span>
                            </a>
                            <a class="list-group-item list-group-item-action" href="#datatable-section2">Input, select 추가</a>
                            <a class="list-group-item list-group-item-action ps-4 border-start-0 border-end-0" href="#code-section2">
                                <i class="bx bx-right-arrow-alt me-1 text-primary"></i>
                                <span>Code Implementation</span>
                            </a>
                            <a class="list-group-item list-group-item-action" href="#datatable-section3">Row 버튼 이벤트 등록</a>
                            <a class="list-group-item list-group-item-action ps-4 border-start-0 border-end-0" href="#code-section3">
                                <i class="bx bx-right-arrow-alt me-1 text-primary"></i>
                                <span>Code Implementation</span>
                            </a>
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

<!-- Overlay -->
<div class="layout-overlay layout-menu-toggle"></div>

<!-- Drag Target Area To SlideIn Menu On Small Screens -->
<div class="drag-target"></div>

<!--/ Layout wrapper -->

<script>
    $(document).ready(function () {
        // 현재 페이지에 있는 모든 스니펫 섹션 초기화
        // 섹션 ID 배열 - 빈 문자열은 기본 섹션, 숫자는 추가 섹션
        const sectionIds = ['', '2', '3'];
        SnippetUtil.initAllSnippets(sectionIds);
 
        // 구문 강조 적용
        if(window.hljs){hljs.highlightAll();}
 
        // 초기 렌더링 – 기본 언어 스니펫 표시
        SnippetUtil.renderInitialSnippets(sectionIds, 'html');

        DataTableUtil.create('#DataTables_Table_0', {
            ajax: { url: '/api/samples', type: 'GET' },
            showAddButton: false,
            // columns: 데이터 테이블의 각 열을 정의
            // data 속성은 DTO의 필드명과 일치해야 함
            columns: [
                // 1번 열
                {data: null},
                // 2번 열
                {data: 'title'},
                // 3번 열
                {data: 'writer'},
                // 4번 열
                {data: 'createdAt'},
                // 5번 열
                {data: 'id'}
            ],
            // columnDefs: 열에 대한 추가 정의 및 렌더링 방식 설정
            columnDefs: [
                {
                    // targets: 0 - 첫 번째 열(번호)에 대한 설정
                    targets: 0,
                    // 검색 불가능
                    searchable: false,
                    // 정렬 불가능
                    orderable: false,
                    // 열 제목
                    title: '번호',
                    // CSS 클래스 추가(필요할 경우)
                    className: 'dt-col-num',
                    // 렌더링 함수 - 자동 번호 생성 (페이지 내 행 번호)
                    render: function (data, type, full, meta) {
                        // 현재 페이지의 첫번째 row index(meta.settings._iDisplayStart)에
                        // 0-based row 번호(meta.row) 를 더한 뒤 1 보정
                        return meta.settings._iDisplayStart + meta.row + 1;
                    }
                },
                {
                    // targets: 1 - 두 번째 열(제목)에 대한 설정
                    targets: 1,
                    // 열 제목
                    title: '제목',
                    // 렌더링 함수 - 제목 표시
                    render: function (data, type, full, meta) {
                        return data;
                    }
                },
                {
                    // targets: 2 - 세 번째 열(작성자)에 대한 설정
                    targets: 2,
                    // 열 제목
                    title: '작성자',
                    // 렌더링 함수 - 작성자 표시
                    render: function (data, type, full, meta) {
                        return data;
                    }
                },
                {
                    // targets: 3 - 네 번째 열(등록 날짜)에 대한 설정
                    targets: 3,
                    // 열 제목
                    title: '등록 날짜',
                    // CSS 클래스
                    className: 'dt-col-date',
                    // 렌더링 함수 - 등록 날짜 표시
                    render: function (data, type, full, meta) {
                        return data;
                    }
                },
                {
                    // targets: 4 - 다섯 번째 열(ID)에 대한 설정
                    targets: 4,
                    // 렌더링 함수 - 액션 버튼 표시
                    render: function (data, type, full, meta) {
                        return `<div class="d-flex gap-1 justify-content-center" data-id="${data}">
                <button onclick="#!" class="btn btn-sm btn-label-secondary" data-action="detail">
                  <i class="icon-base bx bx-pencil icon-xs"></i>상세
                </button>
                <button onclick="#!" class="btn btn-sm btn-label-danger" data-action="delete">
                  <i class="icon-base bx bx-trash icon-xs"></i>삭제
                </button>
              </div>`
                    }
                }
            ]
        });

        DataTableUtil.create('#DataTables_Table_2', {
            ajax: { url: '/api/samples', type: 'GET' },
            showAddButton: false,
            // columns: 데이터 테이블의 각 열을 정의
            // data 속성은 DTO의 필드명과 일치해야 함
            columns: [
                // 1번 열
                {data: null},
                // 2번 열
                {data: 'title'},
                // 3번 열
                {data: 'writer'},
                // 4번 열
                {data: 'createdAt'},
                // 5번 열
                {data: 'id'}
            ],
            // columnDefs: 열에 대한 추가 정의 및 렌더링 방식 설정
            columnDefs: [
                {
                    // targets: 0 - 첫 번째 열(번호)에 대한 설정
                    targets: 0,
                    // 검색 불가능
                    searchable: false,
                    // 정렬 불가능
                    orderable: false,
                    // 열 제목
                    title: '번호',
                    // CSS 클래스 추가(필요할 경우)
                    className: 'dt-col-num',
                    // 렌더링 함수 - 자동 번호 생성 (페이지 내 행 번호)
                    render: function (data, type, full, meta) {
                        // 현재 페이지의 첫번째 row index(meta.settings._iDisplayStart)에
                        // 0-based row 번호(meta.row) 를 더한 뒤 1 보정
                        return meta.settings._iDisplayStart + meta.row + 1;
                    }
                },
                {
                    // targets: 1 - 두 번째 열(제목)에 대한 설정
                    targets: 1,
                    // 열 제목
                    title: '제목',
                    // 렌더링 함수 - 제목 표시
                    render: function (data, type, full, meta) {
                        return data;
                    }
                },
                {
                    // targets: 2 - 세 번째 열(작성자)에 대한 설정
                    targets: 2,
                    // 열 제목
                    title: '작성자',
                    // 렌더링 함수 - 작성자 표시
                    render: function (data, type, full, meta) {
                        return data;
                    }
                },
                {
                    // targets: 3 - 네 번째 열(등록 날짜)에 대한 설정
                    targets: 3,
                    // 열 제목
                    title: '등록 날짜',
                    // CSS 클래스
                    className: 'dt-col-date',
                    // 렌더링 함수 - 등록 날짜 표시
                    render: function (data, type, full, meta) {
                        return data;
                    }
                },
                {
                    // targets: 4 - 다섯 번째 열(ID)에 대한 설정
                    targets: 4,
                    // 렌더링 함수 - 액션 버튼 표시
                    render: function (data, type, full, meta) {
                        return `<div class="d-flex gap-1 justify-content-center" data-id="${data}">
                <button onclick="#!" class="btn btn-sm btn-label-secondary" data-action="detail">
                  <i class="icon-base bx bx-pencil icon-xs"></i>상세
                </button>
                <button onclick="#!" class="btn btn-sm btn-label-danger" data-action="delete">
                  <i class="icon-base bx bx-trash icon-xs"></i>삭제
                </button>
              </div>`
                    }
                }
            ],
            externalFilters: {
                user: '#user'
            }
        });
    });
</script>

</body>

</html>
