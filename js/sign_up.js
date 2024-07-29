const signUpIdRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;
const signUpPwRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;
const signUpNameRule = /^[가-힣a-zA-Z].{1,20}$/;
const signUpPhoneRule = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;

const signInBtn = document.getElementById("signIn");


const containerSignUp = document.querySelector(".container");

const signUpId = document.getElementById("sign_up_id");
const signUpPw = document.getElementById("sign_up_pw");
const signUpName = document.getElementById("sign_up_name");
const signUpPhone = document.getElementById("sign_up_phone");
const signUpTeam = document.getElementById("sign_up_team");
const signUpGrade = document.getElementById("sign_up_grade");

const signUpFinishBtn = document.getElementById("sign_up_finish_btn");


signInBtn.addEventListener("click", () => {
    containerSignUp.classList.remove("right-panel-active");
  });

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

signUpFinishBtn.addEventListener("click", () => {
    if (signUpIdRule.test(signUpId.value) && signUpPwRule.test(signUpPw.value) && signUpNameRule.test(signUpName.value) && signUpPhoneRule.test(signUpPhone.value)) {
        location.href = "../jsp/sign_up_action.jsp?id=" + signUpId.value + "&pw=" + signUpPw.value + "&name=" + signUpName.value + "&phone=" + signUpPhone.value + "&teamIdx=" + signUpTeam.options[signUpTeam.selectedIndex].value + "&gradeIdx=" + signUpGrade.options[signUpGrade.selectedIndex].value;
    }
    else {
      alert(" 제약조건을 확인해주세요. ");
    }
})