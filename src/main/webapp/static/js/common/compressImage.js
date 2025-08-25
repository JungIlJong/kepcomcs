function isImage(file) {
    return file.type.startsWith("image/")
}

async function compressImage(file) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();

        reader.onload = (event) => {
            const image = new Image();
            image.src = event.target.result;

            image.onload = () => {
                const canvas = document.createElement("canvas");
                const ctx = canvas.getContext("2d");

                // 이미지 최대 크기 제한
                const maxWidth = 1024;
                const maxHeight = 1024;

                let width = image.width;
                let height = image.height;

                // 이미지 크기 조정
                if (width > height) {
                    if (width > maxWidth) {
                        height *= maxWidth / width;
                        width = maxWidth;
                    }
                } else {
                    if (height > maxHeight) {
                        width *= maxHeight / height;
                        height = maxHeight;
                    }
                }

                canvas.width = Math.round(width);
                canvas.height = Math.round(height);
                ctx.drawImage(image, 0, 0, width, height);

                // 압축된 이미지 데이터 URL 생성
                canvas.toBlob(
                    (blob) => {
                        if(blob) {
                            const compressedFile = new File([blob], file.name, {
                                type: file.type,
                            });
                            resolve(compressedFile);
                        } else {
                            reject(new Error("이미지 압축에 실패했습니다."));
                        }
                    }, file.type, 0.8
                );
            }
        };

        reader.onerror = (err) => reject(err);

        reader.readAsDataURL(file);
    });
}