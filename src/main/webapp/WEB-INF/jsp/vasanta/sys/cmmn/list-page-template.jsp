<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/vasanta/cmmn/taglib.jsp" %>
<html lang="ko" data-theme="light" dir="ltr" data-bs-theme="light" data-skin="bordered" data-template="vertical-menu-template" data-assets-path="/vendor/sneat/">
<head>
    <%@ include file="/WEB-INF/jsp/vasanta/sys/include/head.jsp" %>
    <title>목록 페이지 샘플</title>
    <script src="/static/vendor/sneat/libs/swiper/swiper.js"></script>
    <script src="/static/js/common/commonUi.js"></script>
    <link rel="stylesheet" href="/static/vendor/sneat/libs/swiper/swiper.css" />
</head>
<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <div class="layout-page">

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
                <div class="container-xxl flex-grow-1 container-p-y">
                    <%--TODO 화면 콘텐츠 구현--%>
                    <!-- 컨텐츠 -->
                    <div class="row">
                        <div class="col-md-10">
                            <div class="card" id="member-management">
                                <div class="card-header">
                                    <h5 class="mb-0">회원관리</h5>
                                </div>
                                <div class="card-body">
                                    <!-- 유형1 -->
                                    <div class="card-datatable">
                                        <div class="d-flex flex-column gap-4 mb-8">
                                            <div class="d-flex align-items-end flex-wrap gap-2">
                                                <div class="form-control-validation fv-plugins-icon-container w-sm-100">
                                                    <label class="form-label" for="ntce">등록일자 범위 선택</label>
                                                    <div class="d-flex flex-column flex-sm-row align-items-center justify-content-start gap-2 " id="ntce">
                                                        <div class="input-group input-group-merge w-sm-100">
                                                            <input type="text" class="dt-datetime form-control flatpickr-input" placeholder="시작일자 선택" id="stDt" name="stDt" readonly="readonly"/>
                                                            <span class="input-group-text cursor-pointer" onclick="openStDt(this)"><i class="icon-base bx bx-calendar"></i></span>
                                                        </div>
                                                        <span class="form-label"><i class="icon-base bx bx-minus"></i></span>
                                                        <div class="input-group input-group-merge">
                                                            <input type="text" class="dt-datetime form-control flatpickr-input" placeholder="종료일자 선택" id="endDt" name="endDt" readonly="readonly"/>
                                                            <span class="input-group-text cursor-pointer" onclick="openEndDt(this)"><i class="icon-base bx bx-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="DatePickerBtn">
                                                    <div class="d-flex gap-2 flex-wrap justify-content-start">
                                                        <button type="button" id="btnYesterday" class="btn btn-outline-secondary">하루전</button>
                                                        <button type="button" id="btn1Week" class="btn btn-outline-secondary">1주일</button>
                                                        <button type="button" id="btn1Month" class="btn btn-outline-secondary">1개월</button>
                                                        <button type="button" id="btn3Months" class="btn btn-outline-secondary">3개월</button>
                                                        <button type="button" id="btn6Months" class="btn btn-outline-secondary">6개월</button>
                                                        <button type="button" id="btn1Year" class="btn btn-outline-secondary">1년</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-column">
                                                <label class="form-label" for="">검색</label>
                                                <div class="d-flex flex-column flex-sm-row gap-2">
                                                    <div id="">
                                                        <select
                                                                name="DataTables_Table_0_length"
                                                                aria-controls="DataTables_Table_0"
                                                                class="form-select ms-0"
                                                                id="dt-length-0"
                                                        >
                                                            <option value="">전체</option>
                                                        </select
                                                        ><label for="dt-length-0"></label>
                                                    </div>
                                                    <div class="flex-fill">
                                                        <input
                                                                type="search"
                                                                class="form-control"
                                                                id="dt-search-0"
                                                                placeholder="검색어를 입력하세요"
                                                                aria-controls="DataTables_Table_0"
                                                        /><label for="dt-search-0"></label>
                                                    </div>
                                                    <button
                                                            class="btn btn-secondary"
                                                            tabindex="0"
                                                            aria-controls="DataTables_Table_0"
                                                            type="button"
                                                            onclick="location.href='save'"
                                                    >
            <span
            ><i
                    class="icon-base bx bx-search icon-sm me-0 me-sm-2"
            ></i
            ><span class="d-none d-sm-inline-block">검색</span></span
            >
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--// 유형1 -->

                                    <!-- 유형2 -->
                                    <div class="card-datatable">
                                        <div class="d-flex flex-column gap-4 mb-8">
                                            <div class="d-flex align-items-end flex-wrap gap-2">
                                                <div class="form-control-validation fv-plugins-icon-container w-sm-100">
                                                    <label class="form-label" for="ntce">등록일자 범위 선택</label>
                                                    <div class="d-flex flex-column flex-sm-row align-items-center justify-content-start gap-2 " id="ntce">
                                                        <div class="input-group input-group-merge w-sm-100">
                                                            <input type="text" class="dt-datetime form-control flatpickr-input" placeholder="시작일자 선택" id="stDt" name="stDt" readonly="readonly"/>
                                                            <span class="input-group-text cursor-pointer" onclick="openStDt(this)"><i class="icon-base bx bx-calendar"></i></span>
                                                        </div>
                                                        <span class="form-label"><i class="icon-base bx bx-minus"></i></span>
                                                        <div class="input-group input-group-merge">
                                                            <input type="text" class="dt-datetime form-control flatpickr-input" placeholder="종료일자 선택" id="endDt" name="endDt" readonly="readonly"/>
                                                            <span class="input-group-text cursor-pointer" onclick="openEndDt(this)"><i class="icon-base bx bx-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="DatePickerBtn">
                                                    <div class="d-flex gap-2 flex-wrap justify-content-start">
                                                        <button type="button" id="btnYesterday" class="btn btn-outline-secondary">하루전</button>
                                                        <button type="button" id="btn1Week" class="btn btn-outline-secondary">1주일</button>
                                                        <button type="button" id="btn1Month" class="btn btn-outline-secondary">1개월</button>
                                                        <button type="button" id="btn3Months" class="btn btn-outline-secondary">3개월</button>
                                                        <button type="button" id="btn6Months" class="btn btn-outline-secondary">6개월</button>
                                                        <button type="button" id="btn1Year" class="btn btn-outline-secondary">1년</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-column flex-sm-row gap-2">
                                                <div class="form-control-validation fv-plugins-icon-container w-100">
                                                    <label class="form-label" for="reflctAt">상태</label>
                                                    <select class="form-control form-select" id="reflctAt" name="reflctAt">
                                                        <option value="" selected="">전체</option>
                                                        <option value="plus">활성</option>
                                                        <option value="zero">종료</option>
                                                        <option value="min">비활성</option>
                                                    </select>
                                                </div>
                                                <div class="form-control-validation fv-plugins-icon-container w-100">
                                                    <label class="form-label" for="bannerSeCode">위치</label>
                                                    <select class="form-control form-select" id="bannerSeCode" name="bannerSeCode">
                                                        <option value="" selected="">전체</option>
                                                        <option value="BA001">메인</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="d-flex flex-column">
                                                <label class="form-label" for="">검색</label>
                                                <div class="d-flex flex-column flex-sm-row gap-2">
                                                    <div>
                                                        <select
                                                                name="DataTables_Table_0_length"
                                                                aria-controls="DataTables_Table_0"
                                                                class="form-select ms-0"
                                                                id="dt-length-0"
                                                        >
                                                            <option value="">전체</option>
                                                        </select
                                                        ><label for="dt-length-0"></label>
                                                    </div>
                                                    <div class="flex-fill">
                                                        <input
                                                                type="search"
                                                                class="form-control"
                                                                id="dt-search-0"
                                                                placeholder="검색어를 입력하세요"
                                                                aria-controls="DataTables_Table_0"
                                                        /><label for="dt-search-0"></label>
                                                    </div>
                                                    <button
                                                            class="btn btn-secondary"
                                                            tabindex="0"
                                                            aria-controls="DataTables_Table_0"
                                                            type="button"
                                                            onclick="location.href='save'"
                                                    >
                <span
                ><i
                        class="icon-base bx bx-search icon-sm me-0 me-sm-2"
                ></i
                ><span class="d-none d-sm-inline-block">검색</span></span
                >
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--// 유형2 -->

                                    <div class="justify-content-between dt-layout-table">
                                        <div
                                                class="justify-content-between align-items-center dt-layout-full table-responsive"
                                        >
                                            <div
                                                    id="DataTables_Table_0_wrapper"
                                                    class="dt-container dt-bootstrap5 dt-empty-footer"
                                            >
                                                <div
                                                        class="d-flex flex-column flex-md-row justify-content-between mb-4 gap-2"
                                                >
                                                    <div
                                                            class="flex-c justify-content-between align-items-center dt-layout-start col-md-auto me-auto mt-0"
                                                    >
                                                        <div
                                                                class="dt-info pb-0"
                                                                aria-live="polite"
                                                                id="DataTables_Table_0_info"
                                                                role="status"
                                                                style=""
                                                        >
                                                            1 - 5 (총 5 건) (전체 9 건 중 검색결과)
                                                        </div>
                                                    </div>
                                                    <div
                                                            class="d-md-flex align-items-center dt-layout-end col-md-auto ms-auto d-flex gap-md-4 justify-content-md-between justify-content-center gap-4 flex-wrap mt-0"
                                                    >
                                                        <div class="dt-buttons btn-group flex-wrap d-flex gap-2 mb-0">
                                                            <div>
                                                                <select
                                                                        name="DataTables_Table_0_length"
                                                                        aria-controls="DataTables_Table_0"
                                                                        class="form-select ms-0"
                                                                        id="dt-length-0"
                                                                >
                                                                    <option value="10">10</option>
                                                                    <option value="25">25</option>
                                                                    <option value="50">50</option>
                                                                    <option value="100">100</option></select
                                                                ><label for="dt-length-0"></label>
                                                            </div>
                                                            <div class="btn-group">
                                                                <button
                                                                        class="btn buttons-collection btn-label-secondary dropdown-toggle"
                                                                        tabindex="0"
                                                                        aria-controls="DataTables_Table_0"
                                                                        type="button"
                                                                        aria-haspopup="dialog"
                                                                        aria-expanded="false"
                                                                >
                      <span
                      ><span class="d-flex align-items-center gap-2"
                      ><i class="icon-base bx bx-export icon-sm"></i>
                          <span class="d-none d-sm-inline-block"
                          >내보내기</span
                          ></span
                      ></span
                      >
                                                                </button>
                                                            </div>
                                                            <button
                                                                    class="btn add-new btn-primary"
                                                                    tabindex="0"
                                                                    aria-controls="DataTables_Table_0"
                                                                    type="button"
                                                                    onclick="location.href='save'"
                                                            >
                    <span
                    ><i class="icon-base bx bx-plus icon-sm me-0 me-sm-2"></i
                    ><span class="d-none d-sm-inline-block">등록</span></span
                    >
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="justify-content-between dt-layout-table">
                                                    <div
                                                            class="d-md-flex justify-content-between align-items-center dt-layout-full table-responsive"
                                                    >
                                                        <table class="datatables-users table border-top dataTable dtr-column" id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info" style="width: 100%;"><colgroup><col data-dt-column="0" style="width: 151.938px;"><col data-dt-column="1" style="width: 149.422px;"><col data-dt-column="2" style="width: 196.969px;"><col data-dt-column="3" style="width: 289.047px;"><col data-dt-column="4" style="width: 317.859px;"><col data-dt-column="5" style="width: 136.656px;"><col data-dt-column="6" style="width: 277.109px;"></colgroup>
                                                            <thead><tr><th data-dt-column="0" rowspan="1" colspan="1" class="dt-orderable-none dt-type-numeric" aria-label="멤버ID"><span class="dt-column-title">멤버ID</span><span class="dt-column-order"></span></th><th data-dt-column="1" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="아이디: Activate to sort" tabindex="0"><span class="dt-column-title" role="button">아이디</span><span class="dt-column-order"></span></th><th data-dt-column="2" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc dt-ordering-asc" aria-label="이름: Activate to invert sorting" tabindex="0" aria-sort="ascending"><span class="dt-column-title" role="button">이름</span><span class="dt-column-order"></span></th><th data-dt-column="3" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="이메일: Activate to sort" tabindex="0"><span class="dt-column-title" role="button">이메일</span><span class="dt-column-order"></span></th><th data-dt-column="4" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc dt-type-date" aria-label="등록일시: Activate to sort" tabindex="0"><span class="dt-column-title" role="button">등록일시</span><span class="dt-column-order"></span></th><th data-dt-column="5" rowspan="1" colspan="1" class="dt-orderable-asc dt-orderable-desc" aria-label="상태: Activate to sort" tabindex="0"><span class="dt-column-title" role="button">상태</span><span class="dt-column-order"></span></th><th data-dt-column="6" rowspan="1" colspan="1" class="dt-orderable-none" aria-label="액션"><span class="dt-column-title">액션</span><span class="dt-column-order"></span></th></tr></thead><tbody><tr><td class="dt-type-numeric" tabindex="0">17</td><td>test130</td><td class="sorting_1">김김김</td><td>example@naver.com</td><td class="dt-type-date">2025-05-19 18:06:38</td><td><span class="badge text-bg-success">신청</span></td><td>
                                                                <div class="d-flex gap-1 justify-content-center">
                                                                    <button onclick="location.href='/sys/system/mbr/mbr/detail?uuid=92783fb6-3490-11f0-a3a8-0242ac110004'" class="btn btn-sm btn-label-secondary">
                                                                        <i class="icon-base bx bx-pencil icon-xs"></i>수정
                                                                    </button>
                                                                    <button onclick="deleteUser('92783fb6-3490-11f0-a3a8-0242ac110004')" class="btn btn-sm btn-label-danger">
                                                                        <i class="icon-base bx bx-trash icon-xs"></i>삭제
                                                                    </button>
                                                                </div>
                                                            </td></tr><tr><td class="dt-type-numeric" tabindex="0">16</td><td>test120</td><td class="sorting_1">김민우</td><td>ltest@gmail.com</td><td class="dt-type-date">2025-05-19 17:11:47</td><td><span class="badge text-bg-success">신청</span></td><td>
                                                                <div class="d-flex gap-1 justify-content-center">
                                                                    <button onclick="location.href='/sys/system/mbr/mbr/detail?uuid=e8daa55a-3488-11f0-a3a8-0242ac110004'" class="btn btn-sm btn-label-secondary">
                                                                        <i class="icon-base bx bx-pencil icon-xs"></i>수정
                                                                    </button>
                                                                    <button onclick="deleteUser('e8daa55a-3488-11f0-a3a8-0242ac110004')" class="btn btn-sm btn-label-danger">
                                                                        <i class="icon-base bx bx-trash icon-xs"></i>삭제
                                                                    </button>
                                                                </div>
                                                            </td></tr><tr><td class="dt-type-numeric" tabindex="0">18</td><td>test01</td><td class="sorting_1">밈미밈</td><td>test0@gmail.com</td><td class="dt-type-date">2025-05-20 17:46:04</td><td><span class="badge text-bg-success">신청</span></td><td>
                                                                <div class="d-flex gap-1 justify-content-center">
                                                                    <button onclick="location.href='/sys/system/mbr/mbr/detail?uuid=dd0a8cb9-3556-11f0-bc24-0242ac110009'" class="btn btn-sm btn-label-secondary">
                                                                        <i class="icon-base bx bx-pencil icon-xs"></i>수정
                                                                    </button>
                                                                    <button onclick="deleteUser('dd0a8cb9-3556-11f0-bc24-0242ac110009')" class="btn btn-sm btn-label-danger">
                                                                        <i class="icon-base bx bx-trash icon-xs"></i>삭제
                                                                    </button>
                                                                </div>
                                                            </td></tr><tr><td class="dt-type-numeric" tabindex="0">20</td><td>jaegj96</td><td class="sorting_1">조재경</td><td>jaegj96@gmail.com</td><td class="dt-type-date">2025-05-30 07:56:30</td><td><span class="badge text-bg-primary">승인</span></td><td>
                                                                <div class="d-flex gap-1 justify-content-center">
                                                                    <button onclick="location.href='/sys/system/mbr/mbr/detail?uuid=28c3c1cd-3ce0-11f0-ac17-0242ac110008'" class="btn btn-sm btn-label-secondary">
                                                                        <i class="icon-base bx bx-pencil icon-xs"></i>수정
                                                                    </button>
                                                                    <button onclick="deleteUser('28c3c1cd-3ce0-11f0-ac17-0242ac110008')" class="btn btn-sm btn-label-danger">
                                                                        <i class="icon-base bx bx-trash icon-xs"></i>삭제
                                                                    </button>
                                                                </div>
                                                            </td></tr><tr><td class="dt-type-numeric" tabindex="0">19</td><td>bebo007</td><td class="sorting_1">테스트사용자</td><td>aaaa@naver.com</td><td class="dt-type-date">2025-05-22 14:40:52</td><td><span class="badge text-bg-primary">승인</span></td><td>
                                                                <div class="d-flex gap-1 justify-content-center">
                                                                    <button onclick="location.href='/sys/system/mbr/mbr/detail?uuid=52cbb934-36cf-11f0-9af3-0242ac11000d'" class="btn btn-sm btn-label-secondary">
                                                                        <i class="icon-base bx bx-pencil icon-xs"></i>수정
                                                                    </button>
                                                                    <button onclick="deleteUser('52cbb934-36cf-11f0-9af3-0242ac11000d')" class="btn btn-sm btn-label-danger">
                                                                        <i class="icon-base bx bx-trash icon-xs"></i>삭제
                                                                    </button>
                                                                </div>
                                                            </td></tr></tbody><tfoot></tfoot></table>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div
                                                            class="d-md-flex align-items-center dt-layout-end ms-auto d-flex gap-md-4 justify-content-center gap-4 flex-wrap mt-0 mt-3"
                                                    >
                                                        <div class="dt-paging">
                                                            <nav aria-label="pagination">
                                                                <ul class="pagination">
                                                                    <li class="dt-paging-button page-item disabled">
                                                                        <button
                                                                                class="page-link previous"
                                                                                role="link"
                                                                                type="button"
                                                                                aria-controls="DataTables_Table_0"
                                                                                aria-disabled="true"
                                                                                aria-label="Previous"
                                                                                data-dt-idx="previous"
                                                                                tabindex="-1"
                                                                        >
                                                                            <i class="icon-base bx bx-chevron-left icon-18px"></i>
                                                                        </button>
                                                                    </li>
                                                                    <li class="dt-paging-button page-item active">
                                                                        <button
                                                                                class="page-link"
                                                                                role="link"
                                                                                type="button"
                                                                                aria-controls="DataTables_Table_0"
                                                                                aria-current="page"
                                                                                data-dt-idx="0"
                                                                        >
                                                                            1
                                                                        </button>
                                                                    </li>
                                                                    <li class="dt-paging-button page-item disabled">
                                                                        <button
                                                                                class="page-link next"
                                                                                role="link"
                                                                                type="button"
                                                                                aria-controls="DataTables_Table_0"
                                                                                aria-disabled="true"
                                                                                aria-label="Next"
                                                                                data-dt-idx="next"
                                                                                tabindex="-1"
                                                                        >
                                                                            <i
                                                                                    class="icon-base bx bx-chevron-right icon-18px"
                                                                            ></i>
                                                                        </button>
                                                                    </li>
                                                                </ul>
                                                            </nav>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 팝업 모달 버튼 -->
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#fullscreenModal" id="popup-modal">팝업 모달 버튼</button>
                                    <!--// 팝업 모달 버튼 -->

                                    <!-- 팝업 모달 -->
                                    <div class="modal fade popup-modal" id="fullscreenModal" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-fullscreen" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header p-0">
                                                    <div class="form-check popup-day-close">
                                                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" />
                                                        <label class="form-check-label" for="defaultCheck1"> 오늘 하루 열지 않기</label>
                                                    </div>
                                                    <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body flex-c" >
                                                    <div class="inner w-xl-100 mx-auto" >
                                                        <h1 class="text-center mb-1">POPUPZONE</h1>
                                                        <div class="pop_num">팝업 <span>총 0건</span></div>
                                                        <div class="swiper mySwiper popup-swiper">
                                                            <div class="swiper-wrapper">
                                                                <div class="swiper-slide"><a href=""><img src="/static/assets/images/popup-test.png" alt=""></a></div>
                                                                <div class="swiper-slide"><img src="/static/assets/images/popup-test.png" alt=""></div>
                                                                <div class="swiper-slide"><img src="/static/assets/images/popup-test.png" alt=""></div>
                                                                <div class="swiper-slide"><img src="/static/assets/images/popup-test.png" alt=""></div>
                                                                <div class="swiper-slide"><img src="/static/assets/images/popup-test.png" alt=""></div>
                                                                <div class="swiper-slide"><img src="/static/assets/images/popup-test.png" alt=""></div>
                                                                <div class="swiper-slide"><img src="/static/assets/images/popup-test.png" alt=""></div>
                                                                <div class="swiper-slide"><img src="/static/assets/images/popup-test.png" alt=""></div>
                                                                <div class="swiper-slide"><img src="/static/assets/images/popup-test.png" alt=""></div>
                                                            </div>
                                                        </div>
                                                        <div class="swiper-pagination"></div>
                                                        <div class="swiper-button-next"></div>
                                                        <div class="swiper-button-prev"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--// 팝업 모달 -->

                                    <!-- Loading 함수 사용 예제 -->
                                    <div class="card mt-4" id="loading-example">
                                        <div class="card-header">
                                            <h5 class="mb-0">Loading 함수 사용 예제</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="row g-3">
                                                <!-- 페이지 전체 로딩 -->
                                                <div class="col-md-6">
                                                    <h6>페이지 전체 로딩</h6>
                                                    <div class="d-flex gap-2 flex-wrap">
                                                        <button type="button" class="btn btn-primary btn-sm" onclick="showLoading()">로딩 표시</button>
                                                        <button type="button" class="btn btn-success btn-sm" onclick="showLoading('데이터를 처리중입니다...')">메시지와 함께 표시</button>
                                                        <button type="button" class="btn btn-secondary btn-sm" onclick="hideLoading()">로딩 해제</button>
                                                    </div>
                                                </div>

                                                <!-- 특정 영역 블록 UI -->
                                                <div class="col-md-6">
                                                    <h6>특정 영역 블록 UI</h6>
                                                    <div class="d-flex gap-2 flex-wrap">
                                                        <button type="button" class="btn btn-info btn-sm" onclick="showBlockUI('#example-block')">블록 UI 표시</button>
                                                        <button type="button" class="btn btn-warning btn-sm" onclick="showBlockUI('#example-block', '저장 중...')">메시지와 함께 표시</button>
                                                        <button type="button" class="btn btn-secondary btn-sm" onclick="hideBlockUI('#example-block')">블록 UI 해제</button>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- 블록 UI 테스트 영역 -->
                                            <div class="mt-4">
                                                <h6>블록 UI 테스트 영역</h6>
                                                <div id="example-block" class="p-4 border rounded bg-light" style="min-height: 150px;">
                                                    <p>이 영역에 블록 UI가 적용됩니다.</p>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                                </div>
                                            </div>

                                            <!-- 라이브러리 상태 확인 -->
                                            <div class="mt-4">
                                                <h6>라이브러리 상태 확인</h6>
                                                <div class="d-flex gap-2 flex-wrap mb-3">
                                                    <button type="button" class="btn btn-outline-info btn-sm" onclick="checkLibraries()">라이브러리 상태 확인</button>
                                                </div>
                                                <div id="library-status" class="alert alert-info" style="display:none;"></div>
                                            </div>

                                            <!-- Ajax 예제 코드 -->
                                            <div class="mt-4">
                                                <h6>Ajax 사용 예제 코드</h6>
                                                <pre class="bg-dark text-light p-3 rounded"><code>// Ajax 호출 시 사용 예제
function saveData() {
    showLoading('저장 중입니다...');
    
    $.ajax({
        url: '/api/save',
        method: 'POST',
        data: { /* 데이터 */ },
        success: function(response) {
            hideLoading();
            customAlert({
                title: '성공',
                content: '저장이 완료되었습니다.',
                showCancel: false
            });
        },
        error: function() {
            hideLoading();
            customAlert({
                title: '오류',
                content: '저장 중 오류가 발생했습니다.',
                showCancel: false
            });
        }
    });
}

// 특정 영역만 블록 처리 시
function processSection() {
    showBlockUI('#data-section', '처리 중...');
    
    // 처리 후
    setTimeout(() => {
        hideBlockUI('#data-section');
    }, 3000);
}</code></pre>
                                            </div>

                                            <div class="mt-4">
                                                <h6>browser-image-compression 사용법</h6>
                                                <pre class="bg-dark text-light p-3 rounded"><code>
function handleImageUpload(event) {

  var imageFile = event.target.files[0];
  console.log('originalFile instanceof Blob', imageFile instanceof Blob); // true
  console.log(`originalFile size', mageFile.size / 1024 / 1024});

  var options = {
    maxSizeMB: 0.1
  }
  imageCompression(imageFile, options)
    .then(function (compressedFile) {
      console.log('compressedFile instanceof Blob', compressedFile instanceof Blob); // true
      console.log(`compressedFile size', compressedFile.size / 1024 / 1024); // smaller than maxSizeMB
      return uploadToServer(compressedFile); // write your own logic
    })
    .catch(function (error) {
      console.log(error.message);
    });
}
                                                </code>
                                                </pre>
                                            </div>
                                        </div>
                                    </div>
                                    <!--// Loading 함수 사용 예제 -->
                                </div>
                            </div>
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
                                <a class="list-group-item list-group-item-action" href="#member-management">
                                    <i class="bx bx-user me-2"></i>회원관리
                                </a>
                                <a class="list-group-item list-group-item-action" href="#popup-modal">
                                    <i class="bx bx-window-alt me-2"></i>팝업 모달
                                </a>
                                <a class="list-group-item list-group-item-action" href="#loading-example">
                                    <i class="bx bx-loader me-2"></i>Loading 함수 사용 예제
                                </a>
                            </div>
                        </nav>
                        <!-- /TOC Sidebar -->
                    </div>
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
// 라이브러리 상태 확인 함수
function checkLibraries() {
    const statusDiv = document.getElementById('library-status');
    let status = '<strong>라이브러리 상태:</strong><br>';
    
    // Notiflix 확인
    if (typeof Notiflix !== 'undefined') {
        status += '✅ Notiflix: 사용 가능<br>';
        if (Notiflix.Loading) {
            status += '✅ Notiflix.Loading: 사용 가능<br>';
        } else {
            status += '❌ Notiflix.Loading: 사용 불가<br>';
        }
        if (Notiflix.Block) {
            status += '✅ Notiflix.Block: 사용 가능<br>';
        } else {
            status += '❌ Notiflix.Block: 사용 불가<br>';
        }
    } else {
        status += '❌ Notiflix: 사용 불가<br>';
    }
    
    // jQuery 확인
    if (typeof $ !== 'undefined') {
        status += '✅ jQuery: 사용 가능<br>';
    } else {
        status += '❌ jQuery: 사용 불가<br>';
    }
    
    // commonFn 함수들 확인
    if (typeof showLoading !== 'undefined') {
        status += '✅ showLoading: 사용 가능<br>';
    } else {
        status += '❌ showLoading: 사용 불가<br>';
    }
    
    if (typeof hideLoading !== 'undefined') {
        status += '✅ hideLoading: 사용 가능<br>';
    } else {
        status += '❌ hideLoading: 사용 불가<br>';
    }
    
    if (typeof showBlockUI !== 'undefined') {
        status += '✅ showBlockUI: 사용 가능<br>';
    } else {
        status += '❌ showBlockUI: 사용 불가<br>';
    }
    
    if (typeof hideBlockUI !== 'undefined') {
        status += '✅ hideBlockUI: 사용 가능<br>';
    } else {
        status += '❌ hideBlockUI: 사용 불가<br>';
    }
    
    statusDiv.innerHTML = status;
    statusDiv.style.display = 'block';
}

// alert 함수 오버라이드로 undefined 추적
const originalAlert = window.alert;
window.alert = function(message) {
    if (message === undefined || message === 'undefined') {
        console.error('undefined alert 발생!', new Error().stack);
        console.log('Alert 호출 위치:', new Error().stack);
        return; // undefined alert는 표시하지 않음
    }
    return originalAlert.call(this, message);
};

// 페이지 로드 후 라이브러리 상태 자동 확인
document.addEventListener('DOMContentLoaded', function() {
    console.log('페이지 로드 완료 - 라이브러리 상태 확인');
    
    // 3초 후 자동으로 라이브러리 상태 확인
    setTimeout(() => {
        checkLibraries();
    }, 3000);
});
</script>

</body>

</html>
