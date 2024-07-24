const passwordChangeRule = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,20}$/;

const passwordChange = document.getElementById("password_change");

const passwordChangeFinishBtn = document.getElementById("password_change_finish_btn");

const logoutBtn = document.getElementById("logout_btn");
const userDeleteBtn = document.getElementById("user_delete_btn");

const modalBackGround = document.getElementById("modal_background")
const logoutAcceptBtn = document.getElementById("logout_accept_btn");



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
    alert(" 비밀번호 변경 성공! ");
}
else {
    alert(" 제약조건을 확인해주세요. ");
}
})

logoutBtn.addEventListener("click", () => {
    var modalBackGround = document.getElementById("modal_background")
    modalBackGround.style.display = "flex";
    modalBackGround.style.flexFlow = "row nowrap";
    modalBackGround.style.justifyContent = "center";
    modalBackGround.style.alignItems = "center";
})

userDeleteBtn.addEventListener("click", () => {
    document.getElementById("modal_background").style.display = "block";
})

logoutAcceptBtn.addEventListener("click", () => {
    modalBackGround.style.display = "none";
})