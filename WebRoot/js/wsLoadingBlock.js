/*
   希格玛公司
   作者：宋国   
   版本：3.0
   说明：此脚本文件建立在jquery库基础上，因此调用时需先引入jquery1.7或以上库，比如jquery-1.10.2.min.js
   更新历史：
        1.0：2016-05-22   实现遮挡页面，提示正在处理
        2.0：2016-05-26   增加遮挡指定元素功能
        3.0: 2016-06-02   实现动态改变文本、改变图标和倒计时自动关闭提示窗口的接口
        4.0: 2016-06-29   实现多组提示信息的连续提醒，中间包含间隔时间
*/

var g_countTimeFadeOut = 0;
var g_Interval = null;
var g_arrInterval = null;
var g_arrTimeOut = 0;
var g_arrBlockElement = null;
var g_arrIndex = 0;
var g_arrayBlockInfo = null;
var g_arrAutoClose = true;

// 参数：tipInfo 要现实的信息
//       blockElement  要遮挡元素的ID，如果为空，则遮挡整个页面
//       timeShow   自动停留多长时间后关闭，单位：毫秒，不赋值，则需要调用closeLoadingBlock关闭
function setLoadingBlock(tipInfo, blockElement, timeShow) {
    var allInfo = '';
    if (tipInfo == null)
        allInfo = '<table cellpadding="2" style="opacity:1.0;"><tr><td width=60>' + 
            '<img id="xgm_ProcessImage" style="valign:middle" src="loading.gif" />' +
            '</td><td align=left><span id="xgm_ProcessInfo">正在处理，请稍后...</span>&nbsp;<span id="xgm_CloseingInfo"> </span></td></tr></table>';
    else
        allInfo = '<table cellpadding="2" style="opacity:1.0;"><tr><td width=60>' +
            '<img id="xgm_ProcessImage" style="valign:middle" src="loading.gif" />' +
            '</td><td align=left><span id="xgm_ProcessInfo">' + tipInfo + '</span>&nbsp;<span id="xgm_CloseingInfo"> </span></td></tr></table>';

    var timeShowInfo = null;
    if (timeShow != null)
        timeShowInfo = timeShow;
    else
        timeShowInfo = 0;

    if (blockElement !== null && blockElement !== undefined && blockElement !== '') {        
        $('#' + blockElement).block(
                {
                    message: allInfo,
                    css: { backgroundColor: '#fff', color: '#333', opacity: '0.7' },
                    overlayCSS: { backgroundColor: '#333', opacity: '0.1' },
                    timeOut:timeShowInfo
                }
            );
    }
    else { 
        $.blockUI(
                {
                    message: allInfo,
                    css: { backgroundColor: '#fff', color: '#333', opacity: '0.7' },
                    overlayCSS: { backgroundColor: '#333', opacity: '0.1' },
                    timeOut: timeShowInfo
                }
            );
    }
}

// 改变提示框的图标
function changeLoadingBlockImage(imgPath) { 
    $("#xgm_ProcessImage").attr("src", imgPath);                
}

// 改变提示框的提示信息
function changeLoadingBlockInfo(tipInfo) {
    $('#xgm_ProcessInfo').html(tipInfo);
}

// 如果setLoadingBlock传入了blockElement参数，关闭时也必须带上同样的参数
// closeTipInfo: 倒计时信息模板：<span style='color:red'>%d</span>秒。 %d将被替换成秒数。如果传入空，将使用默认模板
// countTimeFadeOut: 倒计时毫秒数，例如8000, 5000, 3000等，不能为3500这样非整数千的值
function closeLoadingBlock(blockElement, closeTipInfo, countTimeFadeOut) {
    if (countTimeFadeOut != null) {
        g_countTimeFadeOut = countTimeFadeOut;
        g_Interval = setInterval(function () { closeLoadingBlockDelay(blockElement, closeTipInfo); }, 1000);
    }
    else {
        if (blockElement != null)
            $('#' + blockElement).unblock();
        else
            $.unblockUI();
    }
}

function closeLoadingBlockDelay(blockElement, closeTipInfo) {
    if (g_countTimeFadeOut == 0) {
        clearInterval(g_Interval);
        closeLoadingBlock(blockElement);
    }
    else {
        var newCloseInfo = '';
        if (closeTipInfo !== null && closeTipInfo !== undefined && closeTipInfo !== '') {
            var pos = closeTipInfo.indexOf("%d");
            newCloseInfo = closeTipInfo.substr(0, pos) + g_countTimeFadeOut / 1000 + closeTipInfo.substr(pos + 2);
        }
        else {
            newCloseInfo = "<span style='color:red'>" + g_countTimeFadeOut / 1000 + " </span>秒";
        }
        $('#xgm_CloseingInfo').html(newCloseInfo);
        g_countTimeFadeOut -= 1000;
    }
}

// 设定多组提示信息
// arrBlockInfo：二维数组形式 
//             var arrBlockInfo = new Array();
//             arrBlockInfo[0] = new Array("loading.gif", "正在获取数据", 5000);
// blockElement:阻挡元素
// 最后是否自动关闭,true/false.true为自动关闭
function setArrayLoadingBlock(arrBlockInfo, blockElement, autoClose) {
     
    g_arrayBlockInfo = arrBlockInfo;
    g_arrBlockElement = blockElement;

    g_arrIndex = 0;
    startExecuteArrayLoadingBlock();
    g_arrInterval = setInterval(function () { startExecuteArrayLoadingBlock(); }, 1000);  
}

function startExecuteArrayLoadingBlock() {
    g_arrTimeOut -= 1000;
    if (g_arrTimeOut <= 0) {
        if (g_arrIndex < g_arrayBlockInfo.length) {
            setOneLoadingBlock();

            g_arrTimeOut = g_arrayBlockInfo[g_arrIndex][2];
            g_arrIndex++;
        }
        else {
            if (g_arrAutoClose) // 自动关闭
            {
                if (g_arrBlockElement !== null && g_arrBlockElement !== undefined && g_arrBlockElement !== '')
                    $('#' + g_arrBlockElement).unblock();
                else
                    $.unblockUI();
            }
            clearInterval(g_arrInterval);
            g_arrIndex = 0;
        }
    } 
}

function setOneLoadingBlock() {

    if (g_arrIndex == 0) 
    {
        var allInfo = '<table cellpadding="2" style="opacity:1.0;"><tr><td width=60>' +
            '<img id="xgm_ProcessImage" style="valign:middle" src="' + g_arrayBlockInfo[g_arrIndex][0] + '" />' +
            '</td><td align=left><span id="xgm_ProcessInfo">' + g_arrayBlockInfo[g_arrIndex][1] + '</span>&nbsp;<span id="xgm_CloseingInfo"> </span></td></tr></table>';

        var timeShowInfo = g_arrayBlockInfo[g_arrIndex][2];

        if (g_arrBlockElement !== null && g_arrBlockElement !== undefined && g_arrBlockElement !== '') {
            $('#' + blockElement).block(
                {
                    message: allInfo,
                    css: { backgroundColor: '#fff', color: '#333', opacity: '0.7' },
                    overlayCSS: { backgroundColor: '#333', opacity: '0.1' },
                    timeOut: timeShowInfo
                }
            );
        }
        else {
            $.blockUI(
                {
                    message: allInfo,
                    css: { backgroundColor: '#fff', color: '#333', opacity: '0.7' },
                    overlayCSS: { backgroundColor: '#333', opacity: '0.1' },
                    timeOut: timeShowInfo
                }
            );
        }
    }
    else {
        changeLoadingBlockImage(g_arrayBlockInfo[g_arrIndex][0]);
        changeLoadingBlockInfo(g_arrayBlockInfo[g_arrIndex][1]);
    }
}