function SEditor(obj, lstButton){
    this.m_obj = obj;
    if (lstButton == "" || lstButton == 'undefined') {
        this.lstButton = "source|undo|redo";
    }
    this.lstButton = lstButton;
    this.docSourceMode = false;   // for source state
}

var SE = {
   undef : _undef,
   create: _create
};

SEditor.prototype.init = function () {   
    var obj = document.getElementById(this.m_obj);
    var div = document.createElement("div");
    div.className = "c";


    var strTB = '';
    var bMode = this.docSourceMode;
    var thisObj = this; 
    strTB = "<img class='intLink' title='Clean' onclick='switchDocMode(\"" + this.m_obj + "\");' src='data:image/gif;base64,R0lGODlhFgAWAIQbAD04KTRLYzFRjlldZl9vj1dusY14WYODhpWIbbSVFY6O7IOXw5qbms+wUbCztca0ccS4kdDQjdTLtMrL1O3YitHa7OPcsd/f4PfvrvDv8Pv5xv///////////////////yH5BAEKAB8ALAAAAAAWABYAAAV84CeOZGmeaKqubMteyzK547QoBcFWTm/jgsHq4rhMLoxFIehQQSAWR+Z4IAyaJ0kEgtFoLIzLwRE4oCQWrxoTOTAIhMCZ0tVgMBQKZHAYyFEWEV14eQ8IflhnEHmFDQkAiSkQCI2PDC4QBg+OAJc0ewadNCOgo6anqKkoIQA7' /><input style='display:none' id=" + this.m_obj + "Mode value=1>";
    strTB += '<img class="intLink" title="Print" onclick="printDoc();" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABYAAAAWCAYAAADEtGw7AAAABGdBTUEAALGPC/xhBQAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9oEBxcZFmGboiwAAAAIdEVYdENvbW1lbnQA9syWvwAAAuFJREFUOMvtlUtsjFEUx//n3nn0YdpBh1abRpt4LFqtqkc3jRKkNEIsiIRIBBEhJJpKlIVo4m1RRMKKjQiRMJRUqUdKPT71qpIpiRKPaqdF55tv5vvusZjQTjOlseUkd3Xu/3dPzusC/22wtu2wRn+jG5So/OCDh8ycMJDflehMlkJkVK7KUYN+ufzA/RttH76zaVocDptRxzQtNi3mRWuPc+6cKtlXZ/sddP2uu9uXlmYXZ6Qm8v4Tz8lhF1H+zDQXt7S8oLMXtbF4e8QaFHjj3kbP2MzkktHpiTjp9VH6iHiA+whtAsX5brpwueMGdONdf/2A4M7ukDs1JW662+XkqTkeUoqjKtOjm2h53YFL15pSJ04Zc94wdtibr26fXlC2mzRvBccEbz2kiRFD414tKMlEZbVGT33+qCoHgha81SWYsew0r1uzfNylmtpx80pngQQ91LwVk2JGvGnfvZG6YcYRAT16GFtW5kKKfo1EQLtfh5Q2etT0BIWF+aitq4fDbk+ImYo1OxvGF03waFJQvBCkvDffRyEtxQiFFYgAZTHS0zwAGD7fG5TNnYNTp8/FzvGwJOfmgG7GOx0SAKKgQgDMgKBI0NJGMEImpGDk5+WACEwEd0ywblhGUZ4Hw5OdUekRBLT7DTgdEgxACsIznx8zpmWh7k4rkpJcuHDxCul6MDsmmBXDlWCH2+XozSgBnzsNCEE4euYV4pwCpsWYPW0UHDYBKSWu1NYjENDReqtKjwn2+zvtTc1vMSTB/mvev/WEYSlASsLimcOhOBJxw+N3aP/SjefNL5GePZmpu4kG7OPr1+tOfPyUu3BecWYKcwQcDFmwFKAUo90fhKDInBCAmvqnyMgqUEagQwCoHBDc1rjv9pIlD8IbVkz6qYViIBQGTJPx4k0XpIgEZoRN1Da0cij4VfR0ta3WvBXH/rjdCufv6R2zPgPH/e4pxSBCpeatqPrjNiso203/5s/zA171Mv8+w1LOAAAAAElFTkSuQmCC">';


    //var text = document.createTextNode(strTB);
    div.innerHTML = strTB;
    //div.appendChild(text);
    obj.parentNode.insertBefore(div, obj);
};

SE.basePath = _getBasePath();
SE.uploadJson = SE.basePath + 'php/upload_image.php';

function _undef(val, defaultVal) {
	return val === undefined ? defaultVal : val;
}
function _getBasePath() {
	var els = document.getElementsByTagName('script'), src;
	for (var i = 0, len = els.length; i < len; i++) {
		src = els[i].src || '';
		if (/SEditor[\w\-\.]*\.js/.test(src)) {
			return src.substring(0, src.lastIndexOf('/') + 1);
		}
	}
	return '';
}

function _create(obj, lstButton) {
    var editor = new SEditor(obj, lstButton);
    editor.init();
}

function showInsertImage() {
    var sHtml = [
        '<iframe id="myFrame" name="myFrame"></iframe><div id="divImg" style="display:none">',
        '<form name ="frmImgUpload" target="myFrame" id="frmImgUpload" method="post" enctype="multipart/form-data" action="'+ SE.uploadJson + '">',
        '<table cellpadding="0" cellspacing="0" border="0" width="400">',
        '<tr>',
        '<td><input type="file" id="MainPic" name="MainPic" style="display:block" onChange="changeSelPic(this)">',
        '  <input type="text" class="a b" id="myPic"    readonly>',
        '  <input type="button" class="a c" onClick="clickSelPic()" value="选择图片">',
        '  </td>',
        '</tr>',
        '<tr>',
        '<td>',
        '<input onclick="submitUpload()" type="button" value="确定" />',
        '</td>',
        '</tr>', 
        '</table>', 
        '</form>',
        '</div>'
    ].join('');
    return sHtml;
}

function changeSelPic(obj)
{
   document.getElementById('myPic').value = obj.value;
   document.getElementById('MainPic').value = obj.value;
}
function clickSelPic()
{
   document.getElementById('MainPic').click();
}

var g_timeID;
function submitUpload(){
   document.frmImgUpload.submit();  // ie不行
   var theform = document.getElementById('frmImgUpload');
   theform.submit();
   g_timeID = setInterval(getSubmitRet,1000);//5秒后执行
}

function getSubmitRet (){   
    var doc;
    if (document.all){//IE
            doc = document.frames["myFrame"].document;
    }else{//Firefox    
            doc = document.getElementById("myFrame").contentDocument;
    }

    var con = doc.body.innerHTML;
    if (con == "")
        return;

    {
        var obj = JSON.parse(con);   
    
        clearInterval(g_timeID);
        hideDivImg();  
        
         var picUrl = "../SEditor/php/" + obj.pic;
        document.execCommand("InsertImage", false, picUrl); 
    }

}

function switchDocMode(obj) {
    var oMyDoc = document.getElementById(obj);
    var editorMode = document.getElementById(obj + 'Mode');
    var bToSource = editorMode.value;
    alert(bToSource);
    var oContent;
    if (bToSource == 1) {
        oContent = document.createTextNode(oMyDoc.innerHTML);
        oMyDoc.innerHTML = "";
        var oPre = document.createElement("pre");
        oMyDoc.contentEditable = false;
        oPre.id = "sourceText";
        oPre.contentEditable = true;
        oPre.appendChild(oContent);
        oMyDoc.appendChild(oPre);
        bToSource = 0;
    } else {
        if (document.all) {
            oMyDoc.innerHTML = oMyDoc.innerText;
        } else {
            oContent = document.createRange();
            oContent.selectNodeContents(oMyDoc.firstChild);
            oMyDoc.innerHTML = oContent.toString();
        }
        oMyDoc.contentEditable = true;
        bToSource = 1;
    }
    oMyDoc.focus();
    editorMode.value = bToSource;
    alert(editorMode.value);
}


var oDoc, sDefTxt;
var hiDiv;
function initDoc() {
    oDoc = document.getElementById("textBox");
    oDoc.onkeypress = fnKeypress;
    sDefTxt = oDoc.innerHTML;
    //bToSource = true;
    //setDocMode();
    //if (document.compForm.switchMode.checked) { setDocMode(true); }

    hiDiv = document.createElement("div");
    hiDiv.id = "hiDiv";
    document.body.appendChild(hiDiv);
}

function insertImg() {
    //显示遮盖的层
    var objDeck = document.getElementById("deck");
    if (!objDeck) {
        objDeck = document.createElement("div");
        objDeck.id = "deck";
        document.body.appendChild(objDeck);
    }
    objDeck.className = "ShowDeck";
    objDeck.style.filter = "alpha(opacity=50)";
    objDeck.style.opacity = 40 / 100;
    objDeck.style.MozOpacity = 40 / 100;
    if (window.innerWidth) {
        objDeck.style.width = document.body.scrollWidth + "px";
        objDeck.style.height = document.body.scrollHeight + "px";
        //alert(objDeck.style.height);
    }
    else {
        var dde = document.documentElement;
        objDeck.style.width = dde.offsetWidth + "px";
        objDeck.style.height = dde.offsetHeight + "px";
    }
    objDeck.style.display = "block";
    //alert(objDeck.style.width);
    //显示遮盖的层end

    hiDiv.innerHTML = showInsertImage();



    var objDivImg = document.getElementById("divImg");
    objDivImg.style.display = "block";
    

    //显示插入图片对话框
    var obox = document.getElementById('divImg');
    obox.className = 'ShowDlg';

    //调整位置至居中
    if (obox != null && obox.style.display != "none") {
        var w = parseInt(obox.style.width);
        var h = parseInt(obox.style.height);
        var oLeft, oTop;

        if (window.innerWidth) {
            oLeft = window.pageXOffset + (window.innerWidth - w) / 2 + "px";
            oTop = window.pageYOffset + (window.innerHeight - h) / 2 + "px";
        }
        else {
            var dde = document.documentElement;
            oLeft = dde.scrollLeft + (dde.offsetWidth - w) / 2 + "px";
            oTop = dde.scrollTop + (dde.offsetHeight - h) / 2 + "px";
        }

        obox.style.left = oLeft;
        obox.style.top = oTop;
    }

}

function hideDivImg() {
    var objDeck = document.getElementById("deck");
    objDeck.style.display = "none";
    var objDivImg = document.getElementById("divImg");
    objDivImg.style.display = "none";
    oDoc.focus();
    //document.execCommand("InsertImage", false, "https://www.baidu.com/img/baidu_jgylogo3.gif?v=41950862.gif"); 
}

function fnKeypress() {
    //注意：如果焦点不在编辑器内该函数就不起作用了；
    var ev = window.event;
    if (ev.keyCode == 13) {
        //alert('12');
         
        //document.execCommand('InsertHtml', false, "<br />")
        insertHTML("<br />");  //不知道是我浏览器问题还是其他问题，只插入<br>标签光标不换行，必须附加点其他标签，可以最后一起删除之
        //moveEnd();
        /*
        var docFragment = document.createDocumentFragment();

        //add a new line
        var newEle = document.createTextNode('\n');
        docFragment.appendChild(newEle);

        //add the br, or p, or something else
        newEle = document.createElement('br');
        docFragment.appendChild(newEle);

        //make the br replace selection
        var range = window.getSelection().getRangeAt(0);
        range.deleteContents();
        range.insertNode(docFragment);

        //create a new range
        range = document.createRange();
        range.setStartAfter(newEle);
        range.collapse(true);

        //make the cursor there
        var sel = window.getSelection();
        sel.removeAllRanges();
        sel.addRange(range);
        */

        return false; //这样回车就是等于失效了，不会加上讨厌的<p>标签
    }
}

function insertURLImage(urlImage) {
    var sHTML = '<img src="' + urlImage + '">';
    var sel, range;
    if (window.getSelection) {
        // IE9 and non-IE
        sel = window.getSelection();
        if (sel.getRangeAt && sel.rangeCount) {
            range = sel.getRangeAt(0);
            range.deleteContents();
        }
        // Range.createContextualFragment() would be useful here but is
        // non-standard and not supported in all browsers (IE9, for one)
        var el = document.createElement("div");
        el.innerHTML = sHTML;
        var frag = document.createDocumentFragment(), node, lastNode;
        while ((node = el.firstChild)) {
            lastNode = frag.appendChild(node);
        }      
        range.insertNode(frag);

        // Preserve the selection
        if (lastNode) {
            range = range.cloneRange();
            range.setStartAfter(lastNode);
            range.collapse(true);

            sel.removeAllRanges();
            sel.addRange(range);
        }

        oDoc.focus(); //先focus     


    } else if (document.selection && document.selection.type != "Control") {
        // IE < 9
        var r = document.selection.createRange();
        r.pasteHTML(sHTML);
        r.collapse(true);
        r.select();
    }
}

function insertHTML(html) {
var sel, range;
if (window.getSelection) {
    // IE9 and non-IE
    sel = window.getSelection();
    if (sel.getRangeAt && sel.rangeCount) {
        range = sel.getRangeAt(0);
        range.deleteContents();
    } 
        // Range.createContextualFragment() would be useful here but is
        // non-standard and not supported in all browsers (IE9, for one)
        var el = document.createElement("div");
        el.innerHTML = html;
        var frag = document.createDocumentFragment(), node, lastNode;
        while ( (node = el.firstChild) ) {
            lastNode = frag.appendChild(node);
        }
        //var newElement = document.createElement('br');
        //frag.appendChild(newElement);
        range.insertNode(frag);

        // Preserve the selection
        if (lastNode) {
            range = range.cloneRange();
            range.setStartAfter(lastNode);
            range.collapse(true);
            
            sel.removeAllRanges();
            sel.addRange(range);
            //alert('3.5');
        }
        //alert('4');

        oDoc.focus(); //先focus  
        //oDoc.innerHTML += "&nbsp;";
        //var range = oDoc.document.createRange();
        //var len = oDoc.childNodes.length;
        //range.setStart(oDoc, len);
        //range.setEnd(oDoc, len);
        //getSelection().addRange(range);    
        
    
} else if (document.selection && document.selection.type != "Control") {
// IE < 9
    var r = document.selection.createRange();
    r.pasteHTML(html);
    r.collapse(true);
    r.select();
}
}
  

function formatDoc(sCmd, sValue) {
  if (validateMode()) { document.execCommand(sCmd, false, sValue); oDoc.focus(); }
}

function validateMode() {
  //if (!document.compForm.switchMode.checked) { return true ; }
  if (bToSource) return true;
  alert("Uncheck \"Show HTML\".");
  oDoc.focus();
  return false;
}

var bToSource = true;
function setDocMode() {
  var oContent;
  if (bToSource) {
    oContent = document.createTextNode(oDoc.innerHTML);
    oDoc.innerHTML = "";
    var oPre = document.createElement("pre");
    oDoc.contentEditable = false;
    oPre.id = "sourceText";
    oPre.contentEditable = true;
    oPre.appendChild(oContent);
    oDoc.appendChild(oPre);
  } else {
    if (document.all) {
      oDoc.innerHTML = oDoc.innerText;
    } else {
      oContent = document.createRange();
      oContent.selectNodeContents(oDoc.firstChild);
      oDoc.innerHTML = oContent.toString();
    }
    oDoc.contentEditable = true;
  }
  oDoc.focus();
  bToSource = !bToSource;
}

function getSelectText(framewindow){
   var selection  = framewindow.document.selection;
   if(selection) {     //ie  
	if(selection.type == "Text"){     
	return selection.createRange().text;  
	}
    }
    else{  //其他浏览器  
	selection = framewindow.getSelection();  
	return selection.toString();
    }

}



var con;
var sel;
var range;
function changeSize(value) { 
  var objList = document.getElementById('FontSizeList');
   objList.style.display="none";
   var span = document.createElement("span");
   span.style.fontSize = value;

   range.surroundContents(span);
   range.select();   
}

function changeBackColor(value) {
   var objList = document.getElementById('BackColorList');
   objList.style.display="none";  
   formatDoc('backcolor', value);
   range.select();   
}
 
function changeTextParagraph(lever) {
   oDoc.focus();  
 
   if (window.getSelection) {    
       // IE9 and non-IE 
       range.deleteContents();     
   } 
   
   var str = "<" + lever + ">" + con + "</" + lever + ">"; 
   var objList = document.getElementById('TextParagraphList');
   objList.style.display="none";

   if (validateMode()) {insertHTML(str); oDoc.focus(); } 
}

function changeForeColor(value) {    
   var objList = document.getElementById('ForeColorList');
   objList.style.display="none";  
   formatDoc('forecolor', value);
   range.select();
}
 
function showBackColor() {
    var obj = document.getElementById('BackColor');
   var pos = getOffset(obj);
   var objList = document.getElementById('BackColorList');   
   objList.style.left=pos.left + 'px';
   objList.style.top=(pos.top + 20) + 'px';
   objList.style.display="block";

   con = getSelectText(oDoc); 

   sel = window.getSelection();
   if (sel.getRangeAt && sel.rangeCount) {
        range = sel.getRangeAt(0);
   }
}

function showObj(objName) {
   var obj = document.getElementById(objName);
   var pos = getOffset(obj);
   var objList = document.getElementById(objName + 'List');   
   objList.style.left=pos.left + 'px';
   objList.style.top=(pos.top + 20) + 'px';
   objList.style.display="block";

   con = getSelectText(oDoc); 

   sel = window.getSelection();
   if (sel.getRangeAt && sel.rangeCount) {
        range = sel.getRangeAt(0);
   }	
}

function getOffset(obj){
 var offset = {left:0,top:0}; 
while(obj){
 offset.left += obj.offsetLeft; 
offset.top += obj.offsetTop; 
obj = obj.offsetParent;
 };
 return offset;
} 
    