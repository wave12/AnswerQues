// JavaScript Document

var curIndex = 0;
var oldIndex = 1;
var bStop = 1;
var ti;

function play()
{
	ti = setInterval("controlPlay()", 4000);
}

function controlPlay()
{
	if (bStop == 1)
		return;
	 
	ChangeState();
}

function ChangeState(pos)
{
	if (pos == oldIndex)
		return;
	
	if (oldIndex > 0)
	{
		alert(oldIndex);
		var objCur = document.getElementById('C' + oldIndex);
		objCur.style.display = "none";
		var objList = document.getElementById('L' + oldIndex);
		objList.className = "NoCurCoreClass"; 
		//objList.style.backgroundColor = "#2B2B2B";
	}	
	var objNew = document.getElementById('C' + pos);
	objNew.style.display = "block";
	var objNewList = document.getElementById('L' + pos); 
	objNewList.className = "CurCoreClass";  

	
	oldIndex = pos;
}

function PauseThis(pos)
{	
	bStop = 1;
	if (pos == oldIndex)
		return;
		
	if (oldIndex > 0)
	{
		var objCur = document.getElementById('C' + oldIndex);
		objCur.style.display = "none";
		var objList = document.getElementById('L' + oldIndex);
		objList.className = "NoCurCoreClass"; 
	}	
	
	oldIndex = pos;
	
	var objNew = document.getElementById('C' + pos);
	objNew.style.display = "block";
	var objNewList = document.getElementById('L' + pos); 
	//objNewList.style.backgroundColor = "#898A8B";
	objNewList.className = "CurCoreClass";  // 没有效果

	
	
}

function ContinuePlay()
{	
	bStop = 0;
	clearInterval(ti);
	//play();
}