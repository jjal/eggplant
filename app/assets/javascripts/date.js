function get_time_difference(earlierDate,laterDate)
{
       var nTotalDiff = laterDate.getTime() - earlierDate.getTime();
       var oDiff = new Object();
 
       oDiff.days = Math.floor(nTotalDiff/1000/60/60/24);
       nTotalDiff -= oDiff.days*1000*60*60*24;
 
       oDiff.hours = Math.floor(nTotalDiff/1000/60/60);
       nTotalDiff -= oDiff.hours*1000*60*60;
 
       oDiff.minutes = Math.floor(nTotalDiff/1000/60);
       nTotalDiff -= oDiff.minutes*1000*60;
 
       oDiff.seconds = Math.floor(nTotalDiff/1000);
 
       return oDiff;
 
}

function toDate(dStr) {
	var now = new Date();
 		now.setHours(dStr.substr(0,dStr.indexOf(":")));
 		now.setMinutes(dStr.substr(dStr.indexOf(":")+1));
 		now.setSeconds(0);
 		return now;
}