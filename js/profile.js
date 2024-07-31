const passwordChangeRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;

const passwordChange = document.getElementById("password_change");

const modalBackGround = document.getElementById("modal_background")
const passwordChangeModal = document.getElementById("password_change_modal_box");
const logoutModal = document.getElementById("logout_modal_box");
const userDeleteModal = document.getElementById("user_delete_modal_box");



function backBtnEvent(year,month) {
    location.href = "../jsp/calendar.jsp?year=" + year + "&month=" + month;
}

passwordChange.addEventListener("focus", () => {
    if(!passwordChangeRule.test(passwordChange.value)) {
        document.getElementById("password_change_check_text").style.display = "block";
        passwordChange.style.outlineColor = "red";
    }
    else if(passwordChangeRule.test(passwordChange.value)) {
        document.getElementById("password_change_check_text").style.display = "none";
        passwordChange.style.outlineColor = "black";
    }
})
passwordChange.addEventListener("blur", () => {
    if(passwordChange.value.length == 0) {
        document.getElementById("password_change_check_text").style.display = "none";
        passwordChange.style.outlineColor = "black";
    }
})
passwordChange.onkeyup = function() {
    if(!passwordChangeRule.test(passwordChange.value)) {
        document.getElementById("password_change_check_text").style.display = "block";
        passwordChange.style.outlineColor = "red";
    }
    else if(passwordChangeRule.test(passwordChange.value)) {
        document.getElementById("password_change_check_text").style.display = "none";
        passwordChange.style.outlineColor = "black";
    }
}

function passwordChangeFinishBtnEvent() {
    if (passwordChangeRule.test(passwordChange.value)) {
        modalBackGround.style.display = "flex";
        passwordChangeModal.style.display = "flex";
    }
    else {
        alert(" 제약조건을 확인해주세요. ");
    }
}

function passwordChangeAcceptBtnEvent(year,month) {
    location.href = "../jsp/password_change_action.jsp?year=" + year + "&month=" + month + "&password_change_text=" + passwordChange.value;
}

function passwordChangeCancelBtnEvent() {
    modalBackGround.style.display = "none";
    passwordChangeModal.style.display = "none";
}

function logoutBtnEvent() {
    modalBackGround.style.display = "flex";
    logoutModal.style.display = "flex";
}

function logoutAcceptBtnEvent() {
    modalBackGround.style.display = "none";
    logoutModal.style.display = "none";
}

function logoutCancelBtnEvent() {
    modalBackGround.style.display = "none";
    logoutModal.style.display = "none";
}

function userDeleteBtnEvent() {
    modalBackGround.style.display = "flex";
    userDeleteModal.style.display = "flex";
}

function userDeleteAcceptBtnEvent() {
    modalBackGround.style.display = "none";
    userDeleteModal.style.display = "none";
}

function userDeleteCancelBtnEvent() {
    modalBackGround.style.display = "none";
    userDeleteModal.style.display = "none";
}