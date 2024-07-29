const signInIdRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;
const signInPwRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;


const signUpBtn = document.getElementById("signUp");

const containerSignIn = document.querySelector(".container");

const signInId = document.getElementById("sign_in_id");
const signInPw = document.getElementById("sign_in_pw");

const signInFinishBtn = document.getElementById("sign_in_finish_btn");


signUpBtn.addEventListener("click", () => {
  containerSignIn.classList.add("right-panel-active");
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

signInFinishBtn.addEventListener("click", () => {
  if (signInIdRule.test(signInId.value) && signInPwRule.test(signInPw.value)) {
    alert(" 로그인 성공! ");
  }
  else {
    alert(" 제약조건을 확인해주세요. ");
  }
})

