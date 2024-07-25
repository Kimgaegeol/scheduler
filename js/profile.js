const passwordChangeRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;

const passwordChange = document.getElementById("password_change");

const passwordChangeFinishBtn = document.getElementById("password_change_finish_btn");

const logoutBtn = document.getElementById("logout_btn");
const userDeleteBtn = document.getElementById("user_delete_btn");

const modalBackGround = document.getElementById("modal_background")

const passwordChangeModal = document.getElementById("password_change_modal_box");
const passwordChangeAcceptBtn = document.getElementById("password_change_accept_btn");
const passwordChangeCancelBtn = document.getElementById("password_change_cancel_btn");

const logoutModal = document.getElementById("logout_modal_box");
const logoutAcceptBtn = document.getElementById("logout_accept_btn");
const logoutCancelBtn = document.getElementById("logout_cancel_btn");

const userDeleteModal = document.getElementById("user_delete_modal_box");
const userDeleteAcceptBtn = document.getElementById("user_delete_accept_btn");
const userDeleteCancelBtn = document.getElementById("user_delete_cancel_btn");



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

passwordChangeFinishBtn.addEventListener("click", () => {
    if (passwordChangeRule.test(passwordChange.value)) {
        modalBackGround.style.display = "flex";
        passwordChangeModal.style.display = "flex";
    }
    else {
        alert(" 제약조건을 확인해주세요. ");
    }
})
passwordChangeAcceptBtn.addEventListener("click", () => {
    modalBackGround.style.display = "none";
    passwordChangeModal.style.display = "none";
})
passwordChangeCancelBtn.addEventListener("click", () => {
    modalBackGround.style.display = "none";
    passwordChangeModal.style.display = "none";
})

logoutBtn.addEventListener("click", () => {
    modalBackGround.style.display = "flex";
    logoutModal.style.display = "flex";
})
logoutAcceptBtn.addEventListener("click", () => {
    modalBackGround.style.display = "none";
    logoutModal.style.display = "none";
})
logoutCancelBtn.addEventListener("click", () => {
    modalBackGround.style.display = "none";
    logoutModal.style.display = "none";
})

userDeleteBtn.addEventListener("click", () => {
    modalBackGround.style.display = "flex";
    userDeleteModal.style.display = "flex";
})
userDeleteAcceptBtn.addEventListener("click", () => {
    modalBackGround.style.display = "none";
    userDeleteModal.style.display = "none";
})
userDeleteCancelBtn.addEventListener("click", () => {
    modalBackGround.style.display = "none";
    userDeleteModal.style.display = "none";
})