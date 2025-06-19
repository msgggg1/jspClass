<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 라디오 버튼은 숨기고, 라벨을 버튼처럼 꾸미기 위한 CSS */
    .color-radio-label {
        display: inline-block;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        cursor: pointer;
        border: 2px solid #ccc;
    }
    .color-radio-input:checked + .color-radio-label {
        border-color: #000;
        box-shadow: 0 0 5px rgba(0,0,0,0.5);
    }
    .color-radio-input {
        display: none;
    }
</style>

</head>
<body>


<div class="form-group">
	<label for="schedule-end">종료시간</label>
	<input type="datetime-local">
	<label for="schedule-color">색상</label>
	<input type="color">
</div>

<div>
    <input type="radio" id="color-red" name="color_option" value="#e74c3c" class="color-radio-input">
    <label for="color-red" class="color-radio-label" style="background-color: #e74c3c;"></label>

    <input type="radio" id="color-blue" name="color_option" value="#3498db" class="color-radio-input" checked>
    <label for="color-blue" class="color-radio-label" style="background-color: #3498db;"></label>

    <input type="radio" id="color-green" name="color_option" value="#2ecc71" class="color-radio-input">
    <label for="color-green" class="color-radio-label" style="background-color: #2ecc71;"></label>
</div>

</body>
</html>