<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>

<input type="file" id="fileInput" name="file" onchange="previewFile()" />
<div id="imageContainer"></div>

<script>
    function previewFile() {
        var fileInput = document.getElementById('fileInput');
        var file = fileInput.files[0];

        if (file) {
            var reader = new FileReader();

            reader.onload = function (e) {
                var imageContainer = document.getElementById('imageContainer');
                imageContainer.innerHTML = '<img src="' + e.target.result + '" alt="Uploaded Image" />';
            };

            reader.readAsDataURL(file);
        } else {
            alert('파일을 선택해주세요');
        }
    }
</script>

</body>
</html>