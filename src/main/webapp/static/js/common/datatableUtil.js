// Datatable utility for Sneat themed pages
// ------------------------------------------------------------
// This file provides a single helper – DataTableUtil.create – that wraps the
// very common initialisation & styling code we were duplicating in individual
// *list.js files (e.g. sys/ntt/list.js).  Any page that needs a DataTable can
// now simply do:
//   DataTableUtil.create('.datatables-users', {
//     ajax: {...}, columns: [...], columnDefs: [...]
//   })
// Only the options that differ per table need to be supplied; sane defaults
// (serverSide, Korean i18n, export buttons, Sneat layout classes, …) are
// pre-configured here.
// ------------------------------------------------------------

(function (global) {
  'use strict';

  if (!global.DataTable) {
    console.error('DataTables library is required before datatableUtil.js');
    return;
  }

  // Deep-merge helper (shallow merge isn’t enough for nested option objects)
  function deepMerge(target, source) {
    for (const key in source) {
      if (source.hasOwnProperty(key)) {
        if (
          source[key] &&
          typeof source[key] === 'object' &&
          !Array.isArray(source[key])
        ) {
          if (!target[key]) target[key] = {};
          deepMerge(target[key], source[key]);
        } else {
          target[key] = source[key];
        }
      }
    }
    return target;
  }

  // Apply Sneat specific DOM tweaks after DT has rendered.
  function applySneatStyling() {
    // Remove btn-secondary class that DataTables adds to export buttons
    $('.dt-buttons > .btn-group > button').removeClass('btn-secondary');

    // Standard tweaks copied from sys/ntt/list.js
    const elementsToModify = [
      { selector: '.dt-buttons .btn', classToRemove: 'btn-secondary' },
      { selector: '.dt-search .form-control', classToRemove: 'form-control-sm' },
      {
        selector: '.dt-length .form-select',
        classToRemove: 'form-select-sm',
        classToAdd: 'ms-0',
      },
      { selector: '.dt-length', classToAdd: 'mb-md-6 mb-0' },
      { selector: '.dt-search', classToAdd: 'mb-md-6 mb-2' },
      {
        selector: '.dt-layout-end',
        classToRemove: 'justify-content-between',
        classToAdd:
          'd-flex gap-md-4 justify-content-md-between justify-content-center gap-4 flex-wrap mt-0',
      },
      { selector: '.dt-layout-start', classToAdd: 'mt-0' },
      { selector: '.dt-buttons', classToAdd: 'd-flex gap-4 mb-md-0 mb-6' },
      { selector: '.dt-layout-table', classToRemove: 'row mt-2' },
      {
        selector: '.dt-layout-full',
        classToRemove: 'col-md col-12',
        classToAdd: 'table-responsive',
      },
    ];

    elementsToModify.forEach(({ selector, classToRemove, classToAdd }) => {
      document.querySelectorAll(selector).forEach((element) => {
        if (classToRemove) {
          classToRemove
            .split(' ')
            .forEach((cls) => element.classList.remove(cls));
        }
        if (classToAdd) {
          classToAdd.split(' ').forEach((cls) => element.classList.add(cls));
        }
      });
    });
  }

  // Public API
  const DataTableUtil = {
    /**
     * Create & return a DataTable instance with Vasanta/Sneat defaults.
     *
     * @param {string|HTMLElement} tableSelector  A selector or the table element itself.
     * @param {object} userOptions                DataTables options that are specific to the page.
     *                                            At minimum you normally provide `ajax`, `columns` and
     *                                            `columnDefs`.
     * @returns {DataTable}
     */
    create: function (tableSelector, userOptions = {}) {
      const tableEl =
        typeof tableSelector === 'string'
          ? document.querySelector(tableSelector)
          : tableSelector;
      if (!tableEl) {
        console.warn('DataTableUtil.create – table element not found:', tableSelector);
        return null;
      }

      // Pull out optional header titles so they don't end up inside DataTables options
      const headers = userOptions.headers || userOptions.headerTitles;
      delete userOptions.headers;
      delete userOptions.headerTitles;
      
      // Pull out buttons configuration
      const customButtons = userOptions.customButtons || [];
      delete userOptions.customButtons;

      // If caller provided header titles and the table doesn't yet have a thead, create it.
      if (headers && Array.isArray(headers) && !tableEl.querySelector('thead')) {
        const thead = document.createElement('thead');
        const tr = document.createElement('tr');
        headers.forEach((h) => {
          const th = document.createElement('th');
          th.textContent = h;
          tr.appendChild(th);
        });
        thead.appendChild(tr);
        tableEl.prepend(thead);
      }

      const externalFilters = userOptions.externalFilters || {}; // { param: selector }
      delete userOptions.externalFilters;

      // Define default export button options
      const defaultExportOptions = {
        format: {
          body: function (inner, coldex, rowdex) {
            if (inner.length <= 0) return inner;
            const el = new DOMParser().parseFromString(inner, 'text/html').body.childNodes;
            let result = '';
            el.forEach(item => {
              if (item.classList && item.classList.contains('user-name')) {
                result += item.lastChild.firstChild.textContent;
              } else {
                result += item.textContent || item.innerText || '';
              }
            });
            return result;
          }
        }
      };

      // Define default export columns (can be overridden)
      const exportColumns = userOptions.exportColumns || [0, 1, 2, 3];
      delete userOptions.exportColumns;

      // Prepare buttons configuration
      let buttonsConfig = [];
      
      // Add export button group if specified
      const showExportButtons = userOptions.showExportButtons || false; // Default to false unless explicitly set to true
      delete userOptions.showExportButtons;
      
      if (showExportButtons) {
        const exportButtonsConfig = {
          extend: 'collection',
          className: 'btn btn-label-secondary dropdown-toggle',
          text: '<span class="d-flex align-items-center gap-2"><i class="icon-base bx bx-export icon-sm"></i> <span class="d-none d-sm-inline-block">내보내기</span></span>',
          buttons: [
            {
              extend: 'print',
              text: `<span class="d-flex align-items-center"><i class="icon-base bx bx-printer me-2"></i>인쇄</span>`,
              className: 'dropdown-item',
              exportOptions: { columns: exportColumns, ...defaultExportOptions },
              customize: function (win) {
                win.document.body.style.color = config.colors.headingColor;
                win.document.body.style.borderColor = config.colors.borderColor;
                win.document.body.style.backgroundColor = config.colors.bodyBg;
                const table = win.document.body.querySelector('table');
                table.classList.add('compact');
                table.style.color = 'inherit';
                table.style.borderColor = 'inherit';
                table.style.backgroundColor = 'inherit';
              }
            },
            {
              extend: 'csv',
              text: `<span class="d-flex align-items-center"><i class="icon-base bx bx-file me-2"></i>Csv</span>`,
              className: 'dropdown-item',
              exportOptions: { columns: exportColumns, ...defaultExportOptions }
            },
            {
              extend: 'excel',
              text: `<span class="d-flex align-items-center"><i class="icon-base bx bxs-file-export me-2"></i>Excel</span>`,
              className: 'dropdown-item',
              exportOptions: { columns: exportColumns, ...defaultExportOptions }
            },
            {
              extend: 'pdf',
              text: `<span class="d-flex align-items-center"><i class="icon-base bx bxs-file-pdf me-2"></i>Pdf</span>`,
              className: 'dropdown-item',
              exportOptions: { columns: exportColumns, ...defaultExportOptions }
            },
            {
              extend: 'copy',
              text: `<i class="icon-base bx bx-copy me-1"></i>복사`,
              className: 'dropdown-item',
              exportOptions: { columns: exportColumns, ...defaultExportOptions }
            }
          ]
        };
        buttonsConfig.push(exportButtonsConfig);
      }
      
      // Add "Add New" button if specified
      const showAddButton = userOptions.showAddButton !== false; // Default to true unless explicitly set to false
      delete userOptions.showAddButton;
      const addButtonUrl = userOptions.addButtonUrl || 'save'; // Default to 'save' if not specified
      delete userOptions.addButtonUrl;
      
      if (showAddButton) {
        const addButtonConfig = {
          text: '<i class="icon-base bx bx-plus icon-sm me-0 me-sm-2"></i><span class="d-none d-sm-inline-block">등록</span>',
          className: 'add-new btn btn-primary',
          attr: {
            'onclick': `location.href='${addButtonUrl}'`
          }
        };
        buttonsConfig.push(addButtonConfig);

      }
      
      // Add any custom buttons provided by the user
      if (customButtons && customButtons.length > 0) {
        buttonsConfig = buttonsConfig.concat(customButtons);
      }

      const defaultOptions = {
        serverSide: true,
        select: false,
        order: [[0, 'desc']],
        language: typeof lang_kor !== 'undefined' ? lang_kor : {},
        ajax: {
          dataSrc: function (json) {
            if (json && json.paginationInfo) {
              const total = json.paginationInfo.totalRecordCount;
              // Inject DataTables required fields so it won't complain
              json.recordsTotal = total;
              json.recordsFiltered = total;
            }
            // Assume row list lives in json.data
            return json.data || [];
          },
          data: (function(externalFilters) {
            return function (data) {
              if (data.search && data.search.value) {
                data.searchKeyword = data.search.value;
                delete data.search;
              }
              
              // DataTables 페이징 파라미터(start/length) -> 백엔드 규격(pageIndex/pageUnit) 매핑
              if (typeof data.start !== 'undefined' && typeof data.length !== 'undefined') {
                data.pageIndex = Math.floor(data.start / data.length) + 1; // 1-base page number
                data.pageUnit = data.length;                                // 유지 보수를 위해 pageUnit도 전송
                data.recordCountPerPage = data.length;                      // ComSearchVO용 필드
                delete data.start;
                delete data.length;
              }
              
              // 외부 필터 값 추가
              Object.keys(externalFilters).forEach(paramName => {
                const selector = externalFilters[paramName];
                const element = document.querySelector(selector);
                if (element && element.value) {
                  data[paramName] = element.value;
                }
              });
              
              return data;
            };
          })(externalFilters),
        },
        layout: {
          topStart: {
            rowClass: 'row mx-3 my-0 justify-content-between',
            features: [
              {
                pageLength: { menu: [10, 25, 50, 100], text: '_MENU_' },
              },
            ],
          },
          topEnd: {
            features: [
              {
                search: { placeholder: '검색어를 입력하세요', text: '_INPUT_' },
              },
              {
                buttons: buttonsConfig
              }
            ],
          },
          bottomStart: {
            rowClass: 'row mx-3 justify-content-between',
            features: ['info'],
          },
          bottomEnd: {
            paging: { firstLast: false },
          },
        },
        responsive: {
          details: {
            display: DataTable.Responsive.display.modal({
              header: function (row) {
                return 'Details';
              },
            }),
            type: 'column',
            renderer: function (api, rowIdx, columns) {
              const data = columns
                .map((col) => {
                  return col.title !== ''
                    ? `<tr data-dt-row="${col.rowIndex}" data-dt-column="${col.columnIndex}"><td>${col.title}:</td><td>${col.data}</td></tr>`
                    : '';
                })
                .join('');
              if (data) {
                const div = document.createElement('div');
                div.classList.add('table-responsive');
                const table = document.createElement('table');
                div.appendChild(table);
                table.classList.add('table');
                const tbody = document.createElement('tbody');
                tbody.innerHTML = data;
                table.appendChild(tbody);
                return div;
              }
              return false;
            },
          },
        },
      };
      
      const finalOptions = deepMerge(defaultOptions, userOptions);
      console.log(finalOptions);
      const dt = new DataTable(tableEl, finalOptions);

      // Reload table when external filters change
      for (const sel of Object.values(externalFilters)) {
        $(document).on('change keyup', sel, () => dt.ajax.reload());
      }

      // Apply theme tweaks once DT has initialised
      dt.on('init', function () {
        applySneatStyling();
      });

      return dt;
    },
  };

  // Expose globally so that pages can simply include the script and call DataTableUtil.create
  global.DataTableUtil = DataTableUtil;
})(window);
