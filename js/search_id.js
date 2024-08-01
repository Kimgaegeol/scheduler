var container = document.querySelector(".container");

const searchIdPhoneRule = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
const searchIdPhone = document.getElementById("search_id_phone");
const searchIdFinishBtn = document.getElementById("search_id_finish_btn");


function searchPwBtnEvent() {
    container.classList.remove("right-panel-active");

}

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

function searchIdFinishBtnEvent() {
    if (searchIdPhoneRule.test(searchIdPhone.value)) {
        location.href = "../jsp/search_id_action.jsp?phone=" + searchIdPhone.value;
      }
      else {
        alert(" 제약조건을 확인해주세요. ");
      }
}

function signBtnEvent() {
    location.href = "../jsp/index.jsp";
}