/**
 * 
 */

//倒计时函数
function timeBackCount(id, seconds){
	
		setInterval(myFunction, 1000)
		function myFunction(){
			var str = "";
			var h   = 0;
			var m   = 0;
			var s   = seconds;
			if(s>=0){
				if(s > 60){
					m = parseInt(s/60);
					s = s%60;
					if(m > 60) {
						h   =  parseInt(m/60);
						m   =  m%60;
						str += h + "时";
					}
					str += timeType(m) + "分";
				}
				str += timeType(s) + "秒";
				document.getElementById(id).innerHTML = str;
				seconds--;
			}
		}
	}	
//分秒不足2位 前面补0
function timeType(t){
	if(t<10)
			t = "0" + "" + t
		return t;
	}