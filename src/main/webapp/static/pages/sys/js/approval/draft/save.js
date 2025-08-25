let approvalLines = [];

$(function () {

    const btnSubmit = document.getElementById("btnSubmit");
    btnSubmit.addEventListener("click", function () {
        const approvalTitle = document.getElementById('approvalTitle').value;
        const approvalContent = document.getElementById('approvalContent').value;
        $('.form-repeater .select2').each(function () {
            var approverUuid = $(this).val();
            var approvalOrder = $(this).data('order');

            if (approverUuid) {
                approvalLines.push({
                    approverUuid: approverUuid,
                    approvalOrder: approvalOrder
                });
            }
        });


        if (approvalLines.length < 1) {
            alert("결재자를 선택해주세요.");
            return;
        }

        if (isEmpty(approvalTitle)) {
            alert('제목을 입력해주세요.');
            return;
        }

        if (approvalTitle.length > 20) {
            alert('제목은 최대 20자입니다.');
            return;
        }

        if (isEmpty(approvalContent)) {
            alert('내용을 입력해주세요.');
            return;
        }

        if (approvalContent.length > 100) {
            alert('내용은 최대 100자입니다.');
            return;
        }

        if(!confirm('저장하시겠습니까?')) {
            return;
        }
        console.log(approvalLines);
        console.log(approvalTitle);
        console.log(approvalContent);
        Ajax.post('/api/sys/approval_documents', successSave, fail, {data: JSON.stringify({approvalLines,
                approvalTitle,
                approvalContent})});
    });


});

const init = (result) => {
    result.forEach((value) => {
        $('#form-repeater-1-1').append(`<option value="${value.uuid}">${value.mbrNm}(${value.id})</option>`);
    })

    var select2 = $('.select2');
    if (select2.length) {
        select2.each(function () {
            var $this = $(this);
            $this.wrap('<div class="position-relative"></div>').select2({
                dropdownParent: $this.parent(),
                placeholder: $this.data('placeholder') // for dynamic placeholder
            });
        });
    }

    var formRepeater = $('.form-repeater');
    if (formRepeater.length) {
        var row = 2;
        var col = 1;
        formRepeater.on('submit', function (e) {
            e.preventDefault();
        });
        formRepeater.repeater({
            show: function () {
                var fromControl = $(this).find('.form-control, .form-select');
                var formLabel = $(this).find('.form-label');

                fromControl.each(function (i) {
                    var id = 'form-repeater-' + row + '-' + col;
                    $(fromControl[i]).attr('id', id);
                    $(fromControl[i]).attr('name', 'approvalLine');
                    $(fromControl[i]).data('order', row);
                    $(formLabel[i]).attr('for', id);
                    col++;
                });

                if(row >= 5) {
                    alert('결제자는 최대 4명까지 추가할 수 있습니다.');
                    return;
                }

                row++;

                $(this).slideDown();
                $('.select2-container').remove();
                $('.select2.form-select').select2({
                    placeholder: 'Placeholder text'
                });
                $('.select2-container').css('width', '100%');
                $('.form-repeater:first .form-select').select2({
                    dropdownParent: $(this).parent(),
                    placeholder: 'Placeholder text'
                });
                $('.position-relative .select2').each(function () {
                    $(this).select2({
                        dropdownParent: $(this).closest('.position-relative')
                    });
                });

                if(row === 5) {
                    $('#addBtn').addClass('d-none');
                }
            }
        });
    }
}

(function () {
    Ajax.get('/api/sys/mbr/push/all', init, fail);
})();

