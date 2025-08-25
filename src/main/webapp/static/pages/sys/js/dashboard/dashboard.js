'use strict';

let cardColor,
    headingColor,
    labelColor,
    shadeColor,
    borderColor,
    heatMap1,
    heatMap2,
    heatMap3,
    heatMap4,
    fontFamily,
    legendColor;
if (window.Helpers.isDarkStyle()) {
    shadeColor = 'dark';
    heatMap1 = '#4f51c0';
    heatMap2 = '#595cd9';
    heatMap3 = '#8789ff';
    heatMap4 = '#c3c4ff';
} else {
    shadeColor = '';
    heatMap1 = '#e1e2ff';
    heatMap2 = '#c3c4ff';
    heatMap3 = '#a5a7ff';
    heatMap4 = '#696cff';
}

cardColor = config.colors.cardColor;
headingColor = config.colors.headingColor;
labelColor = config.colors.textMuted;
borderColor = config.colors.borderColor;
fontFamily = config.fontFamily;
legendColor = config.colors.bodyColor;

function ajaxGetPromise(url) {
    return new Promise((resolve, reject) => {
        Ajax.get(url, resolve, reject);
    });
}

const byteToGB = (bytes) => bytes / (1024 ** 3);

const fetchWeeklyVisitor = async (date) => {
    return await Promise.all([ajaxGetPromise(dataToQueryString('/api/sys/dashBoard/visitors/weekly', {date}))]);
}

const renderWeeklyVisitorChart = async (date) => {
    const result = await fetchWeeklyVisitor(date);
    const categories = [];
    const data = [];
    let sum = 0;
    for(let i of result[0]) {
        categories.push(i.date);
        data.push(i.visitCount);
        sum += i.visitCount;
    }
    const visitorBarChartEl = document.querySelector('#weeklyVisitorsChart'),
        visitorBarChartConfig = {
            chart: {
                height: 120,
                width: window.innerWidth <= 768 ? 100 : 280,
                parentHeightOffset: 0,
                type: 'bar',
                toolbar: {
                    show: false
                }
            },
            plotOptions: {
                bar: {
                    barHeight: '75%',
                    columnWidth: '60%',
                    startingShape: 'rounded',
                    endingShape: 'rounded',
                    borderRadius: 7,
                    distributed: true
                }
            },
            grid: {
                show: false,
                padding: {
                    top: -25,
                    bottom: -12
                }
            },
            colors: [
                config.colors_label.primary,
                config.colors_label.primary,
                config.colors_label.primary,
                config.colors_label.primary,
                config.colors_label.primary,
                config.colors_label.primary,
                config.colors.primary,
            ],
            dataLabels: {
                enabled: false
            },
            series: [
                {
                    name: '방문자 수',
                    data: data
                }
            ],
            legend: {
                show: false
            },
            responsive: [
                {
                    breakpoint: 1440,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 9,
                                columnWidth: '60%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1300,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 9,
                                columnWidth: '60%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1200,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 8,
                                columnWidth: '50%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 1040,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 8,
                                columnWidth: '50%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 991,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 8,
                                columnWidth: '50%'
                            }
                        }
                    }
                },
                {
                    breakpoint: 420,
                    options: {
                        plotOptions: {
                            bar: {
                                borderRadius: 8,
                                columnWidth: '50%'
                            }
                        }
                    }
                }
            ],
            xaxis: {
                categories: categories,
                axisBorder: {
                    show: false
                },
                axisTicks: {
                    show: false
                },
                labels: {
                    show: false
                }
            },
            yaxis: {
                labels: {
                    show: false
                }
            }
        };
    if (typeof visitorBarChartEl !== undefined && visitorBarChartEl !== null) {
        const visitorBarChart = new ApexCharts(visitorBarChartEl, visitorBarChartConfig);
        visitorBarChart.render();
        const todayPercent = (data[data.length - 1] / sum) * 100;
        const yesterdayPercent = (data[data.length - 2] / sum) * 100;
        const compare = todayPercent - yesterdayPercent;
        const isIncrease = compare > 0;
        const arrowClass = isIncrease ? 'bx-up-arrow-alt text-primary' : 'bx-down-arrow-alt text-danger';
        $('#weeklyVisitorPercent').text(`${todayPercent.toFixed(2)}%`);
        $('#compareWeeklyVisitorPercent').append(`
              <small class="text-nowrap fw-medium">
                <i class="icon-base bx ${arrowClass}"></i>${Math.abs(compare).toFixed(2)}%
              </small>
        `);
    }
}

const fetchCpu = async () => {
    try {
        const [diskFree, diskTotal] = await Promise.all([
            ajaxGetPromise('/api/sys/actuator/metrics/disk.free'),
            ajaxGetPromise('/api/sys/actuator/metrics/disk.total'),
        ]);

        const diskFreeByte = diskFree.measurements[0].value;
        const diskTotalByte = diskTotal.measurements[0].value;

        const freePercent = (diskFreeByte / diskTotalByte) * 100;
        const usedPercent = 100 - freePercent;

        const diskFreeGB = byteToGB(diskFreeByte);
        const diskTotalGB = byteToGB(diskTotalByte);
        const diskUsedGB = diskTotalGB - diskFreeGB;

        return {
            diskFreeByte,
            diskTotalByte,
            freePercent: freePercent.toFixed(2),
            usedPercent: usedPercent.toFixed(2),
            diskFreeGB: diskFreeGB.toFixed(2),
            diskTotalGB: diskTotalGB.toFixed(2),
            diskUsedGB: diskUsedGB.toFixed(2),
        };
    } catch (error) {
        console.error('Error fetching disk metrics:', error);
        return null;
    }
};

const renderCpuChart = async () => {
    const diskInfo = await fetchCpu();
    const expensesRadialChartEl = document.querySelector("#diskChart"),
        expensesRadialChartConfig = {
            chart: {
                height: 230,
                sparkline: {
                    enabled: true,
                },
                parentHeightOffset: 0,
                type: "radialBar",
            },
            colors: [config.colors.danger],
            series: [Number(diskInfo.usedPercent)],
            plotOptions: {
                radialBar: {
                    startAngle: -90,
                    endAngle: 90,
                    hollow: {
                        size: "55%",
                    },
                    track: {
                        background: config.colors_label.secondary,
                    },
                    dataLabels: {
                        name: {
                            show: false,
                        },
                        value: {
                            fontSize: "18px",
                            fontFamily: fontFamily,
                            color: headingColor,
                            fontWeight: 500,
                            offsetY: -5,
                        },
                    },
                },
            },
            grid: {
                show: false,
                padding: {
                    left: -10,
                    right: -10,
                    bottom: 5,
                },
            },
            stroke: {
                lineCap: "round",
            },
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'light',
                    type: "horizontal",
                    shadeIntensity: 0.15,
                    inverseColors: false,
                    opacityFrom: 0.95,
                    opacityTo: 1,
                    stops: [0, 50, 100],
                    colorStops: [
                        {
                            offset: 0,
                            color: '#FF5E45', // 메인 색상보다 약간 밝은 색상
                            opacity: 1
                        },
                        {
                            offset: 50,
                            color: '#FF3E1D', // 사이트 메인 색상 (rgb(255, 62, 29))
                            opacity: 1
                        },
                        {
                            offset: 100,
                            color: '#E02D0F', // 메인 색상보다 진한 색상
                            opacity: 1
                        }
                    ]
                }
            }
        };
    if (
        typeof expensesRadialChartEl !== undefined &&
        expensesRadialChartEl !== null
    ) {
        const expensesRadialChart = new ApexCharts(
            expensesRadialChartEl,
            expensesRadialChartConfig
        );
        expensesRadialChart.render();
        $('#diskSubTitle').text(`남은 용량: ${diskInfo.diskFreeGB}GB`)
    }
}

const fetchUserRanking = async (date) => {
    return await Promise.all([ajaxGetPromise(dataToQueryString('/api/sys/dashBoard/users/ranking', {date}))]);
}

const renderUserRanking = async (date) => {
    const result = await fetchUserRanking(date);
    const now = new Date();
    $('#userRankingTitle').text(`${now.getMonth()}월 회원 랭킹`);
    if(result[0].length > 0) {
        for(let i of result[0]) {
            $('#userRankingList').append(`<div class="d-flex justify-content-between align-items-center mb-6">
                                                    <div class="d-flex align-items-center">
                                                        <div>
                                                            <div>
                                                                <h6 class="mb-0 text-truncate">${i.mbrNm}</h6>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="text-end align-items-center mx-3">
                                                        <h6 class="mb-0">${i.postCount}</h6>
                                                    </div>
                                                </div>`)
        }
        $('#userRankingList').show();
    } else {
        $('#emptyUserRanking').show();
    }
}

const fetchBoardStatics = async (date) => {
    return await Promise.all([ajaxGetPromise(dataToQueryString('/api/sys/dashBoard/boards/statistics', {date}))]);
}

const renderBoardStatics = async (date) => {
    const result = await fetchBoardStatics(date);
    const chartData = result[0];
    const $chart = document.querySelector("#boardStaticsChart");

    // 날짜 추출 (모든 게시판의 날짜가 동일하다고 가정)
    const dates = chartData.map(item => item.date);
    const bbsMap = new Map();

    chartData.forEach(monthData => {
        monthData.boardResultItems.forEach(item => {
            if (!bbsMap.has(item.bbsNm)) {
                bbsMap.set(item.bbsNm, []);
            }
            bbsMap.get(item.bbsNm).push(item.postCount);
        });
    });

    // ApexCharts에서 사용할 series 생성
    const series = Array.from(bbsMap.entries()).map(([name, data]) => ({
        name,
        data
    }));

    const options = {
        series,
        chart: {
            type: 'line',
            height: 350,
            zoom: { enabled: false },
            toolbar: { show: false }
        },
        dataLabels: { enabled: false },
        stroke: {
            curve: 'straight',
            width: 2
        },
        grid: {
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            }
        },
        xaxis: {
            categories: dates,
            title: { text: '월별' }
        },
        yaxis: {
            min: 0,
            forceNiceScale: true,
            tickAmount: 5,
            title: { text: '게시글 수' }
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right'
        },
        tooltip: {
            shared: true,
            intersect: false
        },
        colors: ['#008FFB', '#00E396', '#FEB019', '#FF4560', '#775DD0']
    };

    const chart = new ApexCharts($chart, options);
    chart.render();
}

const fetchApprovalDocumentsInput = async () => {
    return await Promise.all([ajaxGetPromise('/api/sys/dashBoard/approval-documents/inbox')]);
}

const renderApprovalDocumentsInput = async () => {
    const result = await fetchApprovalDocumentsInput();
    result[0].forEach((approvalDocument, index) => {
        $('#approvalDocumentsInputTableBody').append(`<tr>
                                                <th scope="row" class="text-truncate">
                                                    ${result[0].length - index}
                                                </th>
                                                <td class="text-truncate">
                                                    <div class="d-flex align-items-center">
                                                        <div class="d-flex flex-column">
                                                            <h6 class="mb-0">${approvalDocument.approvalTitle}</h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="text-truncate">
                                                    ${approvalDocument.mbrNm}
                                                </td>
                                                <td class="text-truncate">${approvalDocument.createdAt}</td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <a 
                                                        href="/sys/approval/approvbox/pendappr/inbox/detail?approvalDocumentId=${approvalDocument.approvalDocumentId}"
                                                        class="btn btn-icon delete-record">
                                                          <i class="icon-base bx bxs-file icon-md"></i>
                                                        </a>
                                                  </div>
                                                </td>
                                            </tr>`);
    })
}

const fetchUserCount = async (date) => {
    return await Promise.all([ajaxGetPromise(dataToQueryString('/api/sys/dashBoard/users/count', {date}))]);
}

const renderUserCountChart = async (date) => {
    const result = await fetchUserCount(date);
    const categories = [];
    const data = [];
    const name = '회원 수';
    const chartColors = {
        donut: {
            series1: config.colors.success,
            series2: 'color-mix(in sRGB, ' + config.colors.success + ' 80%, ' + config.colors.cardColor + ')',
            series3: 'color-mix(in sRGB, ' + config.colors.success + ' 60%, ' + config.colors.cardColor + ')',
            series4: 'color-mix(in sRGB, ' + config.colors.success + ' 40%, ' + config.colors.cardColor + ')'
        },
        line: {
            series1: config.colors.warning,
            series2: config.colors.primary,
            series3: '#7367f029'
        }
    };
    for (const i of result[0]) {
        const [, month, day] = i.date.split('-');
        categories.push(`${month}-${day}`);
        data.push(i.userCount);
    }

    const series = [{ name, data }];
    console.log(categories, series)
    const $chart = document.querySelector('#userCountChart');
    const options = {
        series: series,
        chart: {
            height: 150,
            type: 'line',
            stacked: false,
            parentHeightOffset: 0,
            toolbar: { show: false },
            zoom: { enabled: false }
        },
        stroke: {
            curve: 'smooth',
            width: 3,
            lineCap: 'round'
        },
        legend: {
            show: true,
            position: 'bottom',
            markers: {
                size: 4,
                offsetX: -3,
                strokeWidth: 0
            },
            height: 40,
            itemMargin: {
                horizontal: 10,
                vertical: 0
            },
            fontSize: '15px',
            fontFamily: fontFamily,
            fontWeight: 400,
            labels: {
                colors: headingColor,
                useSeriesColors: false
            },
            offsetY: 0
        },
        grid: {
            strokeDashArray: 8,
            borderColor
        },
        colors: [chartColors.line.series1],
        fill: {
            opacity: [1, 1]
        },
        plotOptions: {
            bar: {
                columnWidth: '30%',
                startingShape: 'rounded',
                endingShape: 'rounded',
                borderRadius: 4
            }
        },
        dataLabels: { enabled: false },
        xaxis: {
            tickAmount: 5,
            categories: categories,
        },
        yaxis: {
            tickAmount: 5,
            labels: {
                style: {
                    colors: labelColor,
                    fontSize: '13px',
                    fontFamily: fontFamily,
                    fontWeight: 400
                },
                formatter: function (val) {
                    return Math.round(val) + '명'
                }
            },
            forceNiceScale: true,
            decimalsInFloat: 0,
        },
        responsive: [
            {
                breakpoint: 1400,
                options: {
                    chart: {
                        height: 320
                    },
                    xaxis: {
                        labels: {
                            style: {
                                fontSize: '10px'
                            }
                        }
                    },
                    legend: {
                        itemMargin: {
                            vertical: 0,
                            horizontal: 10
                        },
                        fontSize: '13px',
                        offsetY: 12
                    }
                }
            },
            {
                breakpoint: 1025,
                options: {
                    chart: { height: 415 },
                    plotOptions: { bar: { columnWidth: '50%' } }
                }
            },
            {
                breakpoint: 982,
                options: { plotOptions: { bar: { columnWidth: '30%' } } }
            },
            {
                breakpoint: 480,
                options: {
                    chart: { height: 250 },
                    legend: { offsetY: 7 }
                }
            }
        ]
    }
    const chart = new ApexCharts($chart, options);
    chart.render();
}


$(() => {
    const date = formatDate(new Date());
    renderCpuChart();
    renderApprovalDocumentsInput();
    renderWeeklyVisitorChart(date);
    renderUserRanking(date);
    renderBoardStatics(date);
    renderUserCountChart(date);
})