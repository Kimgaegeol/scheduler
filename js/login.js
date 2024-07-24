const signInIdRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;
const signInPwRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;
const signUpIdRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;
const signUpPwRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;
const signUpNameRule = /^[가-힣a-zA-Z].{1,20}$/;
const signUpPhoneRule = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;

const signInBtn = document.getElementById("signIn");
const signUpBtn = document.getElementById("signUp");

const fistForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");

const signInId = document.getElementById("sign_in_id");
const signInPw = document.getElementById("sign_in_pw");

const signUpId = document.getElementById("sign_up_id");
const signUpPw = document.getElementById("sign_up_pw");
const signUpName = document.getElementById("sign_up_name");
const signUpPhone = document.getElementById("sign_up_phone");

const signInFinishBtn = document.getElementById("sign_in_finish_btn");
const signUpFinishBtn = document.getElementById("sign_up_finish_btn");



signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

signInId.addEventListener("focus", () => {
  if(!signInIdRule.test(signInId.value)) {
    document.getElementById("sign_in_id_check_text").style.display = "block";
    signInId.style.outlineColor = "red";
  }
  else if(signInIdRule.test(signInId.value)) {
    document.getElementById("sign_in_id_check_text").style.display = "none";
    signInId.style.outlineColor = "black";
  }
})
signInId.addEventListener("blur", () => {
  if(signInId.value.length == 0) {
    document.getElementById("sign_in_id_check_text").style.display = "none";
    signInId.style.outlineColor = "black";
  }
})
signInId.onkeyup = function() {
  if(!signInIdRule.test(signInId.value)) {
    document.getElementById("sign_in_id_check_text").style.display = "block";
    signInId.style.outlineColor = "red";
  }
  else if(signInIdRule.test(signInId.value)) {
    document.getElementById("sign_in_id_check_text").style.display = "none";
    signInId.style.outlineColor = "black";  
  }
}

signInPw.addEventListener("focus", () => {
  if(!signInPwRule.test(signInPw.value)) {
    document.getElementById("sign_in_pw_check_text").style.display = "block";
    signInPw.style.outlineColor = "red";
  }
  else if(signInPwRule.test(signInPw.value)) {
    document.getElementById("sign_in_pw_check_text").style.display = "none";
    signInPw.style.outlineColor = "black";    
  }
})
signInPw.addEventListener("blur", () => {
  if(signInPw.value.length == 0) {
    document.getElementById("sign_in_pw_check_text").style.display = "none";
    signInPw.style.outlineColor = "black";
  }
})
signInPw.onkeyup = function() {
  if(!signInPwRule.test(signInPw.value)) {
    document.getElementById("sign_in_pw_check_text").style.display = "block";
    signInPw.style.outlineColor = "red";
  }
  else if(signInPwRule.test(signInPw.value)) {
    document.getElementById("sign_in_pw_check_text").style.display = "none";
    signInPw.style.outlineColor = "black";
  }
}

// 중복코드 함수 처리해서 코드 리팩토링 하자.......
// else if 말고 else로 처리해줘야 코드 깔끔하고 처리해야함
signUpId.addEventListener("focus", () => {
  if(!signUpIdRule.test(signUpId.value)) {
    document.getElementById("sign_up_id_check_text").style.display = "block";
    signUpId.style.outlineColor = "red";
  }
  else if(signUpIdRule.test(signUpId.value)) {
    document.getElementById("sign_up_id_check_text").style.display = "none";
    signUpId.style.outlineColor = "black";
  }
})
signUpId.addEventListener("blur", () => {
  if(signUpId.value.length == 0) {
    document.getElementById("sign_up_id_check_text").style.display = "none";
    signUpId.style.outlineColor = "black";
  }
})
signUpId.onkeyup = function() {
  if(!signUpIdRule.test(signUpId.value)) {
    document.getElementById("sign_up_id_check_text").style.display = "block";
    signUpId.style.outlineColor = "red";
  }
  else if(signUpIdRule.test(signUpId.value)) {
    document.getElementById("sign_up_id_check_text").style.display = "none";
    signUpId.style.outlineColor = "black";
  }
}

signUpPw.addEventListener("focus", () => {
  if(!signUpPwRule.test(signUpPw.value)) {
    document.getElementById("sign_up_pw_check_text").style.display = "block";
    signUpPw.style.outlineColor = "red";
  }
  else if(signUpPwRule.test(signUpPw.value)) {
    document.getElementById("sign_up_pw_check_text").style.display = "none";
    signUpPw.style.outlineColor = "black";
  }
})
signUpPw.addEventListener("blur", () => {
  if(signUpPw.value.length == 0) {
    document.getElementById("sign_up_pw_check_text").style.display = "none";
    signUpPw.style.outlineColor = "black";
  }
})
signUpPw.onkeyup = function() {
  if(!signUpPwRule.test(signUpPw.value)) {
    document.getElementById("sign_up_pw_check_text").style.display = "block";
    signUpPw.style.outlineColor = "red";
  }
  else if(signUpPwRule.test(signUpPw.value)) {
    document.getElementById("sign_up_pw_check_text").style.display = "none";
    signUpPw.style.outlineColor = "black";
  }
}

signUpName.addEventListener("focus", () => {
  if(!signUpNameRule.test(signUpName.value)) {
    document.getElementById("sign_up_name_check_text").style.display = "block";
    signUpName.style.outlineColor = "red";
  }
  else if(signUpNameRule.test(signUpName.value)) {
    document.getElementById("sign_up_name_check_text").style.display = "none";
    signUpName.style.outlineColor = "black";
  }
})
signUpName.addEventListener("blur", () => {
  if(signUpName.value.length == 0) {
    document.getElementById("sign_up_name_check_text").style.display = "none";
    signUpName.style.outlineColor = "black";
  }
})
signUpName.onkeyup = function() {
  if(!signUpNameRule.test(signUpName.value)) {
    document.getElementById("sign_up_name_check_text").style.display = "block";
    signUpName.style.outlineColor = "red";
  }
  else if(signUpNameRule.test(signUpName.value)) {
    document.getElementById("sign_up_name_check_text").style.display = "none";
    signUpName.style.outlineColor = "black";
  }
}

signUpPhone.addEventListener("focus", () => {
  if(!signUpPhoneRule.test(signUpPhone.value)) {
    document.getElementById("sign_up_phone_check_text").style.display = "block";
    signUpPhone.style.outlineColor = "red";
  }
  else if(signUpPhoneRule.test(signUpPhone.value)) {
    document.getElementById("sign_up_phone_check_text").style.display = "none";
    signUpPhone.style.outlineColor = "black";
  }
})
signUpPhone.addEventListener("blur", () => {
  if(signUpPhone.value.length == 0) {
    document.getElementById("sign_up_phone_check_text").style.display = "none";
    signUpPhone.style.outlineColor = "black";
  }
})
signUpPhone.onkeyup = function() {
  if(!signUpPhoneRule.test(signUpPhone.value)) {
    document.getElementById("sign_up_phone_check_text").style.display = "block";
    signUpPhone.style.outlineColor = "red";
  }
  else if(signUpPhoneRule.test(signUpPhone.value)) {
    document.getElementById("sign_up_phone_check_text").style.display = "none";
    signUpPhone.style.outlineColor = "black";
  }
}

signInFinishBtn.addEventListener("click", () => {
  if (signInIdRule.test(signInId.value) && signInPwRule.test(signInPw.value)) {
    alert(" 로그인 성공! ");
  }
  else {
    alert(" 제약조건을 확인해주세요. ");
  }
})

signUpFinishBtn.addEventListener("click", () => {
  if (signUpIdRule.test(signUpId.value) && signUpPwRule.test(signUpPw.value) && signUpNameRule.test(signUpName.value) && signUpPhoneRule.test(signUpPhone.value)) {
    alert(" 회원가입 성공! ");
  }
  else {
    alert(" 제약조건을 확인해주세요. ");
  }
})