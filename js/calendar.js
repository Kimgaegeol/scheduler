const modalBackGround = document.getElementById("modal_background");

const modalYearText = document.getElementById("year_text")
var modalYear = parseInt(modalYearText.innerHTML);

const modalMonthText = document.getElementById("month_text")
var modalMonth = parseInt(modalMonthText.innerHTML);


function profileBtnEvent(year,month) {
    location.href = "../jsp/profile.jsp?year=" + year + "&month=" + month;
}

function preMonthBtnEvent(year,month) {
    if(month == 1) {
        year--;
        month = 12;
    }
    else {
        month--;
    }
    location.href = "../jsp/calendar.jsp?year=" + year + "&month=" + month; 
}
function nextMonthBtnEvent(year,month) {
    if(month == 12) {
        year++;
        month = 1;
    }
    else {
        month++;
    }
    location.href = "../jsp/calendar.jsp?year=" + year + "&month=" + month;
}
function dateBtnEvent(year,month,day,dateIdx,totalSchedule) {
    location.href = "../jsp/schedule.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&total_schedule=" + totalSchedule;
}

function dateAllBtnEvent(year,month,day,dateIdx,totalSchedule) {
    location.href = "../jsp/schedule_all.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&total_schedule=" + totalSchedule;
}

function todayMonthBtnEvent() {
    modalBackGround.style.display = "flex";
}

function modalAcceptBtnEvent() {
    location.href="../jsp/calendar.jsp?year=" + modalYear + "&month=" + modalMonth
}

function viewAllOffBtnEvent(year,month) {
    location.href = "../jsp/calendar_all.jsp?year=" + year + "&month=" + month;
}

function viewAllOnBtnEvent(year,month) {
    location.href = "../jsp/calendar.jsp?year=" + year + "&month=" + month;
}

function modalNextYearBtnEvent() {
    console.log(modalYear);
    modalYear++;
    modalYearText.innerHTML = modalYear;
}

function modalPrevYearBtnEvent() {
    modalYear--;
    modalYearText.innerHTML = modalYear;
}

function modalNextMonthBtnEvent() {
    if(modalMonth==12) {
        modalYear++;
        modalYearText.innerHTML = modalYear;
        modalMonth = 1;
        modalMonthText.innerHTML = modalMonth;
    }
    else {
        modalMonth++;
        modalMonthText.innerHTML = modalMonth;
    }
}

function modalPrevMonthBtnEvent() {
    if(modalMonth==1) {
        modalYear--;
        modalYearText.innerHTML = modalYear;
        modalMonth = 12;
        modalMonthText.innerHTML = modalMonth;
    }
    else {
        modalMonth--;
        modalMonthText.innerHTML = modalMonth;
    }
}