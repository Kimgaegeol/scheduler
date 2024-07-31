const modalBackGround = document.getElementById("modal_background");

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
        year++
        month = 1
    }
    else {
        month++
    }
    location.href = "../jsp/calendar.jsp?year=" + year + "&month=" + month; 
}
function dateBtnEvent(year,month,day,dateIdx,totalSchedule) {
    location.href = "../jsp/schedule.jsp?year=" + year + "&month=" + month + "&day=" + day + "&date_idx=" + dateIdx + "&total_schedule=" + totalSchedule;
}
function todayMonthBtnEvent() {
    modalBackGround.style.display = "flex";
}
function acceptBtnEvent() {
    modalBackGround.style.display = "none";
}