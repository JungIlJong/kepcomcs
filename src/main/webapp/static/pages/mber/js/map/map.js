$(function () {
    // 네이버 지도 객체
    let map = null;
    
    // 마커 정보를 담을 배열
    let markers = [];
    
    // 마커 데이터 저장 배열
    let markerDataArray = [];
    
    // 인포윈도우 객체
    let infowindow = null;
    
    // 현재 선택된 마커 인덱스
    let selectedMarkerIndex = -1;
    
    // 지도 초기화 함수
    function initMap() {
        // 서울 시청 좌표 (기본 중심점)
        const defaultPosition = new naver.maps.LatLng(37.5665, 126.9780);
        
        // 지도 옵션 설정
        const mapOptions = {
            center: defaultPosition,
            zoom: 12,
            zoomControl: true,
            zoomControlOptions: {
                position: naver.maps.Position.TOP_RIGHT
            }
        };
        
        // 지도 생성
        map = new naver.maps.Map('map', mapOptions);
        
        // 인포윈도우 생성
        infowindow = new naver.maps.InfoWindow({
            backgroundColor: "#fff",
            borderWidth: 1,
            borderColor: "#888",
            disableAnchor: true,
            pixelOffset: new naver.maps.Point(0, -5)
        });
        
        // 마커 데이터 로드
        loadMarkers();
    }
    
    // 마커 데이터 로드 함수
    function loadMarkers() {
        Ajax.get(
            '/api/mber/mapmarkers',
            function(data) {
                // 받아온 데이터 저장
                markerDataArray = data;
                
                // 마커 목록 생성
                updateMarkerList(data);
                
                // 받아온 데이터로 마커 생성
                createMarkers(data);
            },
            function(xhr, status, error) {
                console.error('마커 데이터 로딩 실패:', error);
                alert('마커 정보를 불러오는데 실패했습니다.');
            }
        );
    }
    
    // 마커 목록 업데이트 함수
    function updateMarkerList(markerData) {
        const $markerList = $('.marker-list');
        $markerList.empty();
        
        if (!markerData || markerData.length === 0) {
            $markerList.append('<div class="list-group-item">표시할 마커가 없습니다.</div>');
            return;
        }
        
        markerData.forEach(function(item, index) {
            const $markerItem = $('<a>')
                .attr('href', '#')
                .addClass('list-group-item list-group-item-action')
                .data('marker-index', index);
            
            // 마커 아이콘이 있으면 작은 아이콘 표시
            let iconHtml = '';
            if (item.iconUrl) {
                iconHtml = `<img src="${item.iconUrl}" alt="마커 아이콘" class="me-2" style="width: 16px; height: 16px;">`;
            }
            
            $markerItem.html(`
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        ${iconHtml}<strong>${item.name}</strong>
                    </div>
                </div>
                <small class="text-muted">${item.roadAddress || ''}</small>
            `);
            
            // 마커 항목 클릭 이벤트
            $markerItem.on('click', function(e) {
                e.preventDefault();
                const idx = $(this).data('marker-index');
                selectMarker(idx);
            });
            
            $markerList.append($markerItem);
        });
    }
    
    // 마커 선택 함수
    function selectMarker(index) {
        // 이전 선택 마커 스타일 제거
        if (selectedMarkerIndex >= 0) {
            $('.marker-list .list-group-item')
                .eq(selectedMarkerIndex)
                .removeClass('active');
        }
        
        // 새 선택 마커 스타일 적용
        selectedMarkerIndex = index;
        $('.marker-list .list-group-item')
            .eq(selectedMarkerIndex)
            .addClass('active');
        
        // 마커로 지도 이동 및 인포윈도우 표시
        const marker = markers[index];
        const markerData = markerDataArray[index];
        
        // 마커 위치로 지도 이동
        map.setCenter(marker.getPosition());
        map.setZoom(15);
        
        // 인포윈도우 표시
        showInfoWindow(marker, markerData);
    }
    
    // 마커 생성 함수
    function createMarkers(markerData) {
        // 기존 마커 제거
        removeAllMarkers();
        
        if (!markerData || markerData.length === 0) {
            console.log('표시할 마커가 없습니다.');
            return;
        }
        
        // 모든 마커의 좌표 저장 (지도 영역 조정용)
        const bounds = new naver.maps.LatLngBounds();
        
        // 마커 생성
        markerData.forEach(function (item, index) {
            // 마커 위치 설정
            const position = new naver.maps.LatLng(item.latitude, item.longitude);
            
            // 마커 생성 옵션
            const markerOptions = {
                position: position,
                map: map,
                title: item.name
            };
            
            // 아이콘 URL이 있으면 아이콘 설정
            if (item.iconUrl) {
                markerOptions.icon = {
                    url: item.iconUrl,
                    size: new naver.maps.Size(32, 32),
                    origin: new naver.maps.Point(0, 0),
                    anchor: new naver.maps.Point(16, 32)
                };
            }
            
            // 마커 생성
            const marker = new naver.maps.Marker(markerOptions);
            
            // 마커 클릭 이벤트
            naver.maps.Event.addListener(marker, 'click', function () {
                // 마커 클릭 시 해당 마커 선택
                selectMarker(index);
            });
            
            // 마커 배열에 추가
            markers.push(marker);
            
            // 지도 영역 확장
            bounds.extend(position);
        });
        
        // 지도 영역 조정 (모든 마커가 보이도록)
        if (markerData.length > 1) {
            map.fitBounds(bounds);
        } else if (markerData.length === 1) {
            map.setCenter(new naver.maps.LatLng(markerData[0].latitude, markerData[0].longitude));
            map.setZoom(15); // 단일 마커일 경우 확대 수준 조정
        }
    }
    
    // 정보창 표시 함수
    function showInfoWindow(marker, markerData) {
        // 이전에 열린 인포윈도우 닫기
        infowindow.close();
        
        // HTML 컨텐츠 생성
        const contentString = [
            '<div class="info-window" style="padding:10px;min-width:200px;">',
            '   <h4 style="margin-top:0;">' + markerData.name + '</h4>',
            '   <p style="margin:5px 0;">' + (markerData.roadAddress || '') + '</p>',
            markerData.description ? '   <p style="margin:5px 0;">' + markerData.description + '</p>' : '',
            '   <div style="margin-top:10px;text-align:right;">',
            '       <button onclick="window.open(\'https://map.naver.com/v5/search/' + encodeURIComponent(markerData.roadAddress) + '\', \'_blank\')" style="padding:5px 10px;">길찾기</button>',
            '   </div>',
            '</div>'
        ].join('');
        
        // 인포윈도우 설정 및 표시
        infowindow.setContent(contentString);
        infowindow.open(map, marker);
    }
    
    // 모든 마커 제거 함수
    function removeAllMarkers() {
        for (let i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
        
        // 선택된 마커 초기화
        selectedMarkerIndex = -1;
    }
    
    // 지도가 로드된 후 초기화
    if (typeof naver !== 'undefined' && naver.maps) {
        initMap();
    } else {
        console.error('네이버 지도 API가 로드되지 않았습니다.');
        $('#map').html('<div style="padding:20px;text-align:center;">지도를 불러올 수 없습니다.</div>');
    }
});