/**
 * 코드 스니펫 관리 유틸리티
 * 여러 코드 스니펫 섹션을 관리하고 렌더링하는 기능 제공
 */
const SnippetUtil = (function() {
    'use strict';
    
    /**
     * 코드 스니펫 관리자 클래스
     */
    class CodeSnippetManager {
        /**
         * 코드 스니펫 관리자 생성
         * @param {string} sectionId - 섹션 ID (빈 문자열이면 기본 섹션)
         * @param {Object} options - 추가 옵션
         */
        constructor(sectionId, options = {}) {
            this.sectionId = sectionId || '';
            this.suffix = this.sectionId ? this.sectionId : '';
            this.options = Object.assign({
                defaultLang: 'html',
                toggleButtonSelector: `#toggleCode${this.suffix}`,
                codeBlockSelector: `#codeSampleBlock${this.suffix}`,
                collapseSelector: `#codeSample${this.suffix}`,
                langButtonsSelector: `.btn-group button[data-lang]`,
                snippetIdMap: {
                    javascript: `init-js${this.suffix}`,
                    html: `snippet-html${this.suffix}`,
                    java: `snippet-java${this.suffix}`
                }
            }, options);
            
            this.toggleBtn = $(this.options.toggleButtonSelector);
            this.codeBlock = $(this.options.codeBlockSelector);
            this.collapseEl = $(this.options.collapseSelector);
            this.langButtons = this.collapseEl.find(this.options.langButtonsSelector);
            
            this.init();
        }
        
        /**
         * 이벤트 리스너 초기화
         */
        init() {
            // 토글 버튼 이벤트
            this.toggleBtn.on('click', () => {
                const isCollapsed = this.toggleBtn.attr('aria-expanded') === 'false';
                this.toggleBtn.html(isCollapsed ? 
                    '<i class="icon-base bx bx-code me-1"></i><span>Hide Code</span>' : 
                    '<i class="icon-base bx bx-code me-1"></i><span>View Code</span>');
                
                // 토글 후 코드 렌더링 (애니메이션 완료 후)
                if(isCollapsed) {
                    setTimeout(() => {
                        const activeBtn = this.langButtons.filter('.active');
                        const lang = activeBtn.data('lang') || this.options.defaultLang;
                        this.renderSnippet(lang);
                    }, 350); // Bootstrap collapse 애니메이션 시간에 맞춤
                }
            });
            
            // 언어 버튼 이벤트
            this.langButtons.on('click', (e) => {
                const btn = $(e.currentTarget);
                const lang = btn.data('lang');
                this.langButtons.removeClass('active');
                btn.addClass('active');
                this.renderSnippet(lang);
            });
        }
        
        /**
         * 코드 스니펫 렌더링
         * @param {string} lang - 언어 (javascript, html 등)
         */
        renderSnippet(lang) {
            const snippetIdMap = this.options.snippetIdMap;
            const snippetId = snippetIdMap[lang] || (`snippet-${lang}${this.suffix}`);
            const snippetEl = document.getElementById(snippetId);
            if (!snippetEl) return;
            
            const codeEl = document.getElementById(`codeSampleBlock${this.suffix}`);
            if (!codeEl) return;
            
            const raw = snippetEl.textContent.trim();
            
            if (codeEl.dataset && codeEl.dataset.highlighted) {
                delete codeEl.dataset.highlighted;
                codeEl.classList.remove('hljs');
            }
            
            codeEl.className = 'language-' + lang;
            codeEl.textContent = raw;
            if (window.hljs) {
                hljs.highlightElement(codeEl);
            }
        }
    }
    
    /**
     * 페이지 내 모든 코드 스니펫 섹션 초기화
     * @param {Array} sectionIds - 초기화할 섹션 ID 배열
     * @param {Object} options - 추가 옵션
     */
    function initAllSnippets(sectionIds = [], options = {}) {
        // 기본 섹션 (ID 없음) 초기화
        const managers = [new CodeSnippetManager('', options)];
        
        // 추가 섹션들 초기화
        sectionIds.forEach(id => {
            managers.push(new CodeSnippetManager(id, options));
        });
        
        return managers;
    }
    
    /**
     * 초기 렌더링 실행
     * @param {Array} sectionIds - 렌더링할 섹션 ID 배열
     * @param {string} defaultLang - 기본 언어
     */
    function renderInitialSnippets(sectionIds = [], defaultLang = 'html') {
        // 기본 섹션 렌더링
        const codeEl = document.getElementById('codeSampleBlock');
        if (codeEl) {
            renderSnippet('', defaultLang);
        }
        
        // 추가 섹션들 렌더링
        sectionIds.forEach(id => {
            const codeEl = document.getElementById(`codeSampleBlock${id}`);
            if (codeEl) {
                renderSnippet(id, defaultLang);
            }
        });
    }
    
    /**
     * 특정 섹션의 코드 스니펫 렌더링 (전역 함수)
     * @param {string} sectionId - 섹션 ID
     * @param {string} lang - 언어 (javascript, html 등)
     */
    function renderSnippet(sectionId, lang) {
        const suffix = sectionId ? sectionId : '';
        const snippetIdMap = {
            javascript: `init-js${suffix}`,
            html: `snippet-html${suffix}`,
            java: `snippet-java${suffix}`
        };
        
        const snippetId = snippetIdMap[lang] || (`snippet-${lang}${suffix}`);
        const snippetEl = document.getElementById(snippetId);
        if (!snippetEl) return;
        
        const codeEl = document.getElementById(`codeSampleBlock${suffix}`);
        if (!codeEl) return;
        
        const raw = snippetEl.textContent.trim();
        
        if (codeEl.dataset && codeEl.dataset.highlighted) {
            delete codeEl.dataset.highlighted;
            codeEl.classList.remove('hljs');
        }
        
        codeEl.className = 'language-' + lang;
        codeEl.textContent = raw;
        if (window.hljs) {
            hljs.highlightElement(codeEl);
        }
    }
    
    // 공개 API
    return {
        CodeSnippetManager,
        initAllSnippets,
        renderInitialSnippets,
        renderSnippet
    };
})();
