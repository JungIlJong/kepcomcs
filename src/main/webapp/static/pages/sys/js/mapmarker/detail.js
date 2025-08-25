$(() => {
    // FormValidation 초기화
    initFvMapmarker();
    
    // 카테고리 데이터 정의
    const categoryData = {
        'A1': [
            {id: 'A1-1', text: '지구대'},
            {id: 'A1-2', text: '파출소'},
            {id: 'A1-3', text: '경찰서'}
        ],
        'A2': [
            {id: 'A2-1', text: '이비인후과'},
            {id: 'A2-2', text: '정형외과'},
            {id: 'A2-3', text: '안과'},
            {id: 'A2-4', text: '내과'}
        ],
        'A3': [
            {id: 'A3-1', text: '민원실'},
            {id: 'A3-2', text: '복지과'},
            {id: 'A3-3', text: '세무과'}
        ],
        'A4': [
            {id: 'A4-1', text: '기타1'},
            {id: 'A4-2', text: '기타2'}
        ]
    };
    const markerId = getUrlParameter('markerId');

    $('#categoryCode1').select2();

    $('#categoryCode2').select2({
        placeholder: '대분류를 먼저 선택하세요'
    });
    
    // 대분류 변경 이벤트
    $('#categoryCode1').on('change', function() {
        const parentCategoryId = $(this).val();
        const $childCategory = $('#categoryCode2');
        
        // 소분류 초기화
        $childCategory.empty().prop('disabled', true);
        
        // 기본 옵션 추가
        $childCategory.append(new Option('선택하세요', '', false, false));
        
        // 대분류가 선택되었을 때
        if (parentCategoryId) {
            // 해당 하위 카테고리 데이터 가져오기
            const childCategories = categoryData[parentCategoryId] || [];
            
            // 하위 카테고리가 있다면
            if (childCategories.length > 0) {
                // 소분류 활성화
                $childCategory.prop('disabled', false);
                
                // 소분류 옵션 추가
                childCategories.forEach(category => {
                    const option = new Option(category.text, category.id, false, false);
                    $childCategory.append(option);
                });
            }
        }
        
        // select2 갱신
        $childCategory.trigger('change');
        fvMapmarkerInstance.revalidateField('categoryCode1')
    });

    // 지도 초기화
    var mapOptions = {
        center: new naver.maps.LatLng(37.3595704, 127.105399),
        zoom: 10
    };
    
    var map = new naver.maps.Map('map', mapOptions);
    var marker = null; // 마커 객체를 저장할 변수

    $('.searchAddress').on('click', () => {
        new daum.Postcode({
            oncomplete: function(result) {
                // 지번 주소, 도로명 주소 콘솔에 출력
                // 검색 주소 필드 업데이트
                $('#searchAddress').val(result.address);
                // 도로명 주소 필드 업데이트
                $('#roadAddress').val(result.roadAddress || '');
                // 지번 주소 필드 업데이트
                $('#jibunAddress').val(result.jibunAddress || '');
                
                // FormValidation 재검증
                if (fvMapmarkerInstance) {
                    fvMapmarkerInstance.revalidateField('roadAddress');
                    fvMapmarkerInstance.revalidateField('jibunAddress');
                }
                
                // 선택한 주소로 좌표 검색 (네이버 지도 API 사용)
                naver.maps.Service.geocode({
                    query: result.roadAddress || result.jibunAddress
                }, function(status, response) {
                    if (status === naver.maps.Service.Status.OK) {
                        var item = response.v2.addresses[0];
                        console.log('주소 -> 좌표 변환 결과:', item);
                        
                        // 검색 결과의 좌표
                        var latlng = new naver.maps.LatLng(item.y, item.x);
                        
                        // 지도 중심 이동
                        map.setCenter(latlng);
                        map.setZoom(15); // 적절한 줌 레벨로 설정
                        
                        // 위도 및 경도 값 저장
                        $('#latitude').val(item.y);
                        $('#longitude').val(item.x);
                        
                        // 이미 생성된 마커가 있다면 위치 이동
                        if (marker) {
                            marker.setPosition(latlng);
                        } else {
                            // 마커 생성
                            marker = new naver.maps.Marker({
                                position: latlng,
                                map: map,
                                animation: naver.maps.Animation.DROP
                            });
                        }
                    } else {
                        customAlertAsync({
                            title: '오류',
                            content: '주소를 좌표로 변환하는데 실패했습니다.',
                            confirmText: '확인',
                            showCancel: false
                        });
                    }
                });
            }
        }).open();
    });
    
    // 저장 버튼 클릭 시 처리
    $('#btnSave').on('click', function() {
        // FormValidation 라이브러리를 사용하여 유효성 검사 수행
        if (fvMapmarkerInstance) {
            fvMapmarkerInstance.validate().then(function(status) {
                if (status === 'Valid') {
                    // 유효성 검사 성공 시 저장 확인 대화상자 표시
                    customAlertAsync({
                        title: '확인',
                        content: '마커를 저장하시겠습니까?',
                        confirmText: '저장',
                        cancelText: '취소',
                        showCancel: true
                    }).then(function(result) {
                        // 사용자가 '저장'을 선택한 경우에만 폼 제출
                        if (result) {
                            submitForm();
                        }
                    });
                }
            });
        }
    });
    
    // 목록 버튼 클릭 이벤트
    $('#btnList').on('click', function() {
        window.location.href = 'list';
    });
    
    // 폼 제출 함수
    const submitForm = async () => {
        // 폼 데이터 수집
        const formData = {
            name: $('#name').val(),
            description: $('#description').val() || '',
            latitude: $('#latitude').val(),
            longitude: $('#longitude').val(),
            iconUrl: $('#iconUrl').val() || '',
            roadAddress: $('#roadAddress').val(),
            jibunAddress: $('#jibunAddress').val(),
            detailAddress: $('#detailAddress').val() || '',
            categoryCode1: $('#categoryCode1').val(),
            categoryCode2: $('#categoryCode2').val(),
            useYn: $('#useYn').is(':checked') ? 'Y' : 'N'
        };

        // ajaxWrapper의 postAjax 함수 사용하여 요청 전송
        postAjax(`/api/sys/mapmarkers/${markerId}`,
            // 성공 콜백
            function(response) {
                customAlertAsync({
                    title: '마커가 성공적으로 수정되었습니다.',
                    confirmText: '확인',
                    showCancel: false
                }).then(() => {
                    window.location.href = 'list';
                });
            },
            // 실패 콜백
            function(xhr, status, error) {
                let errorMessage = '마커 수정에 실패했습니다.';

                // 서버에서 반환한 오류 메시지가 있으면 표시
                if (xhr.responseJSON && xhr.responseJSON.message) {
                    errorMessage += '\n' + xhr.responseJSON.message;
                }

                customAlertAsync({
                    title: '오류',
                    content: errorMessage,
                    confirmText: '확인',
                    showCancel: false
                });
            },
            // 추가 옵션
            { data: JSON.stringify(formData) }
        );
    }

    if (markerId) {
        // 마커 정보 조회 - asyncAjaxWrapper 사용
        async function getMarkerDetails() {
            try {
                const response = await asyncAjaxWrapper(`/api/sys/mapmarkers/${markerId}`, {
                    method: 'GET'
                });
                
                $('#name').val(response.name);
                $('#description').val(response.description);
                $('#latitude').val(response.latitude);
                $('#longitude').val(response.longitude);
                $('#iconUrl').val(response.iconUrl);
                $('#roadAddress').val(response.roadAddress);
                $('#jibunAddress').val(response.jibunAddress);
                $('#detailAddress').val(response.detailAddress);
                
                // 카테고리 값 설정
                $('#categoryCode1').val(response.categoryCode1).trigger('change');
                
                // 소분류 카테고리가 로드된 후 값 설정을 위한 지연
                setTimeout(() => {
                    $('#categoryCode2').val(response.categoryCode2).trigger('change');
                }, 100);
                
                $('#useYn').prop('checked', response.useYn === 'Y');
                
                // 지도에 마커 표시
                if (response.latitude && response.longitude) {
                    const latlng = new naver.maps.LatLng(response.latitude, response.longitude);
                    map.setCenter(latlng);
                    map.setZoom(15);
                    
                    if (marker) {
                        marker.setPosition(latlng);
                    } else {
                        marker = new naver.maps.Marker({
                            position: latlng,
                            map: map
                        });
                    }
                }
            } catch (error) {
                customAlertAsync({
                    title: '오류',
                    content: '마커 정보를 불러오는데 실패했습니다.',
                    confirmText: '확인',
                    showCancel: false
                });
            }
        }

        getMarkerDetails();
    }
});
