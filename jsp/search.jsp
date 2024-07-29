<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="../css/search.css">
</head>
<body>
  <div class="container right-panel-active">
      <!-- Search Id -->
      <div class="container__form container--signup">
        <form action="#" class="form" id="form1">
          <h2 class="form__title">Search Id</h2>
          <input id="search_id_phone" type="tel" placeholder="PhoneNumber" class="input" />
          <div id="search_id_phone_check_text" class="red">"&ensp;'-'포함&ensp;"</div>
          <a href="#" class="link">Go to Login?</a>
          <button id="search_id_finish_btn" class="btn">Search Id</button>
          <!-- <div>찾으신 아이디는<br>" stageus1234 "<br>입니다! "</div> -->
        </form>
      </div>
    
      <!-- Search Pw -->
      <div class="container__form container--signin">
        <form action="#" class="form" id="form2">
          <h2 class="form__title">Search Pw</h2>
          <input id="search_pw_id" type="text" placeholder="Id" class="input" />
          <div id="search_pw_id_check_text" class="red">" 영문,숫자 모두 포함 4~20글자 "</div>
          <input id="search_pw_phone" type="tel" placeholder="PhoneNumber" class="input" />
          <div id="search_pw_phone_check_text" class="red">"&ensp;'-'포함&ensp;"</div>
          <a href="#" class="link">Go to Login?</a>
          <button id="search_pw_finish_btn" class="btn">Search Pw</button>
          <!-- <div>찾으신 비밀번호는<br>" stageus1234 "<br>입니다! "</div> -->
        </form>
      </div>
    
      <!-- Overlay -->
      <div class="container__overlay">
        <div class="overlay">
          <div class="overlay__panel overlay--left">
            <button class="btn" id="search_pw">Search Pw</button>
          </div>
          <div class="overlay__panel overlay--right">
            <button class="btn" id="search_id">Search Id</button>
          </div>
        </div>
      </div>
    </div>
    <script src="../js/search.js"></script>
</body>
</html>