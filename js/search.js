const searchIdPhoneRule = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
const searchPwIdRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;
const searchPwPhoneRule = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;


const searchPwBtn = document.getElementById("search_pw");
const searchIdBtn = document.getElementById("search_id");

const fistForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");

const searchIdPhone = document.getElementById("search_id_phone");
const searchPwId = document.getElementById("search_pw_id");
const searchPwPhone = document.getElementById("search_pw_phone");

const searchIdFinishBtn = document.getElementById("search_id_finish_btn");
const searchPwFinishBtn = document.getElementById("search_pw_finish_btn");



searchPwBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});

searchIdBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

searchIdPhone.addEventListener("focus", () => {
  if(!searchIdPhoneRule.test(searchIdPhone.value)) {
    document.getElementById("search_id_phone_check_text").style.display = "block";
    searchIdPhone.style.outlineColor = "red";
  }
  else if(searchIdPhoneRule.test(searchIdPhone.value)) {
    document.getElementById("search_id_phone_check_text").style.display = "none";
    searchIdPhone.style.outlineColor = "black";
  }
})
searchIdPhone.addEventListener("blur", () => {
  if(searchIdPhone.value.length == 0) {
    document.getElementById("search_id_phone_check_text").style.display = "none";
    searchIdPhone.style.outlineColor = "black";
  }
})
searchIdPhone.onkeyup = function() {
  if(!searchIdPhoneRule.test(searchIdPhone.value)) {
    document.getElementById("search_id_phone_check_text").style.display = "block";
    searchIdPhone.style.outlineColor = "red";
  }
  else if(searchIdPhoneRule.test(searchIdPhone.value)) {
    document.getElementById("search_id_phone_check_text").style.display = "none";
    searchIdPhone.style.outlineColor = "black";
  }
}

searchPwId.addEventListener("focus", () => {
  if(!searchPwIdRule.test(searchPwId.value)) {
    document.getElementById("search_pw_id_check_text").style.display = "block";
    searchPwId.style.outlineColor = "red";
  }
  else if(searchPwIdRule.test(searchPwId.value)) {
    document.getElementById("search_pw_id_check_text").style.display = "none";
    searchPwId.style.outlineColor = "black";
  }
})
searchPwId.addEventListener("blur", () => {
  if(searchPwId.value.length == 0) {
    document.getElementById("search_pw_id_check_text").style.display = "none";
    searchPwId.style.outlineColor = "black";
  }
})
searchPwId.onkeyup = function() {
  if(!searchPwIdRule.test(searchPwId.value)) {
    document.getElementById("search_pw_id_check_text").style.display = "block";
    searchPwId.style.outlineColor = "red";
  }
  else if(searchPwIdRule.test(searchPwId.value)) {
    document.getElementById("search_pw_id_check_text").style.display = "none";
    searchPwId.style.outlineColor = "black";
  }
}

searchPwPhone.addEventListener("focus", () => {
  if(!searchPwPhoneRule.test(searchPwPhone.value)) {
    document.getElementById("search_pw_phone_check_text").style.display = "block";
    searchPwPhone.style.outlineColor = "red";
  }
  else if(searchPwPhoneRule.test(searchPwPhone.value)) {
    document.getElementById("search_pw_phone_check_text").style.display = "none";
    searchPwPhone.style.outlineColor = "black";
  }
})
searchPwPhone.addEventListener("blur", () => {
  if(searchPwPhone.value.length == 0) {
    document.getElementById("search_pw_phone_check_text").style.display = "none";
    searchPwPhone.style.outlineColor = "black";
  }
})
searchPwPhone.onkeyup = function() {
  if(!searchPwPhoneRule.test(searchPwPhone.value)) {
    document.getElementById("search_pw_phone_check_text").style.display = "block";
    searchPwPhone.style.outlineColor = "red";
  }
  else if(searchPwPhoneRule.test(searchPwPhone.value)) {
    document.getElementById("search_pw_phone_check_text").style.display = "none";
    searchPwPhone.style.outlineColor = "black";
  }
}

searchIdFinishBtn.addEventListener("click", () => {
  if (searchIdPhoneRule.test(searchIdPhone.value)) {
    alert(" 아이디 찾기 성공! ");
  }
  else {
    alert(" 제약조건을 확인해주세요. ");
  }
})

searchPwFinishBtn.addEventListener("click", () => {
  if (searchPwIdRule.test(searchPwId.value) && searchPwPhoneRule.test(searchPwPhone.value)) {
    alert(" 비밀번호 찾기 성공! ");
  }
  else {
    alert(" 제약조건을 확인해주세요. ");
  }
})