<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>이미지 파일 압축 업로드</title>
    <script src="/js/common/compressImage.js"></script>
    <script type="text/javascript">
        async function uploadImage() {
            const fileInput = document.getElementById('imageInput');
            const file = fileInput.files[0];

            if (!file) {
                alert('파일을 업로드해주세요.');
                return;
            }

            if (!isImage(file)) {
                alert('이미지 파일을 업로드해주세요.');
                return;
            }

            const compressedFile = await compressImage(file);

            const formData = new FormData();
            formData.append('file', compressedFile);

            const response = await fetch('/testUpload', {
               method: 'POST',
               body: formData
            });

            if (response.ok) {
                alert('이미지가 성공적으로 업로드되었습니다!');
            } else {
                alert('이미지 업로드 실패:' + response.statusText);
            }
        }
    </script>
</head>
<body>
    <h1>이미지 파일 압축 업로드</h1>
    <input type="file" id="imageInput" accept="image/*">
    <button onclick="uploadImage()">업로드</button>
</body>
</html>
