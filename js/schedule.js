const scheduleRule = /^.{1,200}$/;

const addScheduleTimeBtn = document.getElementById("add_schedule_time_btn");
const addScheduleMinuteBtn = document.getElementById("add_schedule_minute_btn");

const amBtn = document.getElementById("am_btn");
const pmBtn = document.getElementById("pm_btn");

const modalBackGround = document.getElementById("modal_background");
const timeModal = document.getElementById("time_modal");
const minuteModal = document.getElementById("minute_modal");


function backBtnEvent(year,month) {
    location.href = "../jsp/calendar.jsp?year=" + year + "&month=" + month;
}

function addScheduleTimeBtnEvent() {
    modalBackGround.style.display = "flex";
    timeModal.style.display = "flex";
}

function amBtnEvent() {
    amBtn.style.color = "white";
    pmBtn.style.color = "rgba(255,255,255,0.4)";
    for (step=1; step <= 12; step++) {
        var timeBtn = document.getElementById('time_btn' + step);
        timeBtn.innerHTML = step-1;
    }
}

function pmBtnEvent() {
    pmBtn.style.color = "white";
    amBtn.style.color = "rgba(255,255,255,0.4)";
    for (step=1; step <= 12; step++) {
        var timeBtn = document.getElementById('time_btn' + step);
        timeBtn.innerHTML = step+11;
    }  
}

function timeBtnEvent(e) {
    modalBackGround.style.display = "none";
    timeModal.style.display = "none";
    addScheduleTimeBtn.innerHTML = e.target.innerHTML;
}

function addScheduleMinuteBtnEvent() {
    modalBackGround.style.display = "flex";
    minuteModal.style.display = "flex";
}

function minuteBtnEvent(e) {
    modalBackGround.style.display = "none";
    minuteModal.style.display = "none";
    addScheduleMinuteBtn.innerHTML = e.target.innerHTML;
}

function addScheduleFinishBtnEvent(year,month,day,dateIdx,totalSchedule) {
    var content = document.getElementById("add_schedule_input");
    if (scheduleRule.test(content.value)) {
        location.href = "../jsp/schedule_add_action.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&time=" + addScheduleTimeBtn.innerHTML + "&minute=" + addScheduleMinuteBtn.innerHTML + "&content=" + content.value + "&total_schedule=" + totalSchedule;
    }
    else {
        alert(" 할 일을 입력해주세요! ")
    }
}

function scheduleModifyBtnEvent() {
    console.log("수정버튼입니다.")
}

function scheduleDeleteBtnEvent(year,month,day,dateIdx,totalSchedule,scheduleIdx) {
    location.href = "../jsp/schedule_delete_action.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&total_schedule=" + totalSchedule + "&schedule_idx=" + scheduleIdx;
}