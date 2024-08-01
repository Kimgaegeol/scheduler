var container = document.querySelector(".container");

const searchPwIdRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;
const searchPwPhoneRule = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
const searchPwId = document.getElementById("search_pw_id");
const searchPwPhone = document.getElementById("search_pw_phone");
const searchPwFinishBtn = document.getElementById("search_pw_finish_btn");


function searchIdBtnEvent() {
    container.classList.add("right-panel-active");

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

function searchPwFinishBtnEvent() {
    if (searchPwIdRule.test(searchPwId.value) && searchPwPhoneRule.test(searchPwPhone.value)) {
        location.href = "../jsp/search_pw_action.jsp?id=" + searchPwId.value + "&phone=" + searchPwPhone.value;

      }
      else {
        alert(" 제약조건을 확인해주세요. ");
      }
}