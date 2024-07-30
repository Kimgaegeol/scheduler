const scheduleRule = /^.{1,200}$/;

const addScheduleTimeBtn = document.getElementById("add_schedule_time_btn");
const addScheduleMinuteBtn = document.getElementById("add_schedule_minute_btn");

const amBtn = document.getElementById("am_btn");
const pmBtn = document.getElementById("pm_btn");

const modalBackGround = document.getElementById("modal_background");
const timeModal = document.getElementById("time_modal");
const minuteModal = document.getElementById("minute_modal");


addScheduleTimeBtn.addEventListener("click", () => {
    modalBackGround.style.display = "flex";
    timeModal.style.display = "flex";
})

amBtn.addEventListener("click", () => {
    amBtn.style.color = "white";
    pmBtn.style.color = "rgba(255,255,255,0.4)";
    for (step=1; step <= 12; step++) {
        var timeBtn = document.getElementById('time_btn' + step);
        timeBtn.innerHTML = step-1;
    }
})

pmBtn.addEventListener("click", () => {
    pmBtn.style.color = "white";
    amBtn.style.color = "rgba(255,255,255,0.4)";
    for (step=1; step <= 12; step++) {
        var timeBtn = document.getElementById('time_btn' + step);
        timeBtn.innerHTML = step+11;
    }
})

function timeBtnEvent(e) {
    modalBackGround.style.display = "none";
    timeModal.style.display = "none";
    addScheduleTimeBtn.innerHTML = e.target.innerHTML;
}

addScheduleMinuteBtn.addEventListener("click", () => {
    modalBackGround.style.display = "flex";
    minuteModal.style.display = "flex";
})

function minuteBtnEvent(e) {
    modalBackGround.style.display = "none";
    minuteModal.style.display = "none";
    addScheduleMinuteBtn.innerHTML = e.target.innerHTML;
}

function addScheduleBtnEvent(year,month,day,dateIdx) {
    var content = document.getElementById("add_schedule_input");
    if (scheduleRule.test(content.value)) {
        location.href = "../jsp/schedule_add_action.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&time=" + addScheduleTimeBtn.innerHTML + "&minute=" + addScheduleMinuteBtn.innerHTML + "&content=" + content.value;
    }
    else {
        alert(" 할 일을 입력해주세요! ")
    }
}