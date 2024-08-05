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

function backAllBtnEvent(year,month) {
    location.href = "../jsp/calendar_all.jsp?year=" + year + "&month=" + month;
}

function timeModalBtnEvent(e) {
    var timeBtn = e.target;
    var firstBox = document.getElementById("first_time_box");
    var secondBox = document.getElementById("second_time_box");
    firstBox.replaceChildren();
    secondBox.replaceChildren();
    for(var step = 0; step<=11; step++) {
        var modalTimeBtn = document.createElement("button");
        modalTimeBtn.id = "modal_time_btn" + (step);
        modalTimeBtn.classList.add("modal_time_btn");
        modalTimeBtn.innerHTML = step;
        modalTimeBtn.addEventListener("click", (e) => {
            setTimeLogic(e.target.innerHTML,timeBtn);
        })
        if(step <= 5) {
            firstBox.appendChild(modalTimeBtn);
        }
        else {
            secondBox.appendChild(modalTimeBtn);
        }
    }
    amBtnEvent();
    modalBackGround.style.display = "flex";
    timeModal.style.display = "flex";
}

function amBtnEvent() {
    amBtn.style.color = "white";
    pmBtn.style.color = "rgba(255,255,255,0.4)";
    for (step=0; step <= 11; step++) {
        var modalTimeBtn = document.getElementById('modal_time_btn' + step);
        modalTimeBtn.innerHTML = step;
    }
}

function pmBtnEvent() {
    pmBtn.style.color = "white";
    amBtn.style.color = "rgba(255,255,255,0.4)";
    for (step=0; step <= 11; step++) {
        var modalTimeBtn = document.getElementById('modal_time_btn' + step);
        modalTimeBtn.innerHTML = step+12;
    }  
}

function setTimeLogic(num,timeBtn) {
    modalBackGround.style.display = "none";
    timeModal.style.display = "none";
    timeBtn.innerHTML = num;
}

function minuteModalBtnEvent(e) {
    var minuteBtn = e.target;
    var firstBox = document.getElementById("first_minute_box");
    var secondBox = document.getElementById("second_minute_box");
    firstBox.replaceChildren();
    secondBox.replaceChildren();
    for(var step = 0; step<=5; step++) {
        var modalMinuteBtn = document.createElement("button");
        modalMinuteBtn.id = "modal_minute_btn" + (step);
        modalMinuteBtn.classList.add("modal_minute_btn");
        modalMinuteBtn.innerHTML = step*10;
        modalMinuteBtn.addEventListener("click", (e) => {
            setMinuteLogic(e.target.innerHTML,minuteBtn);
        })
        if(step <= 2) {
            firstBox.appendChild(modalMinuteBtn);
        }
        else {
            secondBox.appendChild(modalMinuteBtn);
        }
    }
    modalBackGround.style.display = "flex";
    minuteModal.style.display = "flex";
}

function setMinuteLogic(num,minuteBtn) {
    modalBackGround.style.display = "none";
    minuteModal.style.display = "none";
    minuteBtn.innerHTML = num;
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

function scheduleModifyBtnEvent(e,year,month,day,dateIdx,totalSchedule,scheduleIdx) {
    var modifyModalBackGround = document.getElementById("modify_modal_background");
    // modifyModalBackGround.style.zIndex = 1;
    modifyModalBackGround.style.display = "flex";
    e.target.parentElement.style.zIndex = 1;

    var timeBtn = e.target.parentElement.children[0]
    timeBtn.classList.replace('check_schedule_btn','add_schedule_btn');
    timeBtn.classList.replace('check_schedule','add_schedule');
    timeBtn.addEventListener("click", (e) => {
        modalBackGround.style.zIndex = 1;
        timeModal.style.zIndex = 1;
        timeModalBtnEvent(e);
    })

    var minuteBtn = e.target.parentElement.children[1]
    minuteBtn.classList.replace('check_schedule_btn','add_schedule_btn');
    minuteBtn.classList.replace('check_schedule','add_schedule');
    minuteBtn.addEventListener("click", (e) => {
        modalBackGround.style.zIndex = 1;
        minuteModal.style.zIndex = 1;
        minuteModalBtnEvent(e);
    })

    var content = e.target.parentElement.children[2]
    content.classList.replace('check_schedule','add_schedule');
    content.readOnly = false;

    var acceptBtn = e.target.parentElement.children[3]
    acceptBtn.innerHTML = "확인"
    acceptBtn.classList.replace('check_schedule','add_schedule');
    acceptBtn.removeAttribute("onclick");
    acceptBtn.addEventListener("click", () => {
        modifyScheduleLogic(year,month,day,dateIdx,totalSchedule,scheduleIdx,timeBtn.innerHTML,minuteBtn.innerHTML,content.value);
    })

    var cancelBtn = e.target.parentElement.children[4]
    cancelBtn.innerHTML = "취소"
    cancelBtn.classList.replace('check_schedule','add_schedule');
    cancelBtn.removeAttribute("onclick");
    cancelBtn.addEventListener("click",() => {
        location.reload(true);
    })
}

function modifyScheduleLogic(year,month,day,dateIdx,totalSchedule,scheduleIdx,time,minute,content) {
    if (scheduleRule.test(content)) {
        location.href = "../jsp/schedule_modify_action.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&total_schedule=" + totalSchedule + "&schedule_idx=" + scheduleIdx  + "&time=" + time + "&minute=" + minute + "&content=" + content ;
    }
    else {
        alert(" 할 일을 입력해주세요! ")
    }
}

function scheduleDeleteBtnEvent(year,month,day,dateIdx,totalSchedule,scheduleIdx) {
    location.href = "../jsp/schedule_delete_action.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&total_schedule=" + totalSchedule + "&schedule_idx=" + scheduleIdx;
}

function viewAllOffBtnEvent(year,month,day,dateIdx,totalSchedule) {
    location.href = "../jsp/schedule_all.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&total_schedule=" + totalSchedule;
}

function viewAllOnBtnEvent(year,month,day,dateIdx,totalSchedule) {
    location.href = "../jsp/schedule.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&total_schedule=" + totalSchedule;

}