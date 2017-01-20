/**
 * 
 */

 function changePage() {
  	  parent.startBlock();
  }
   
  function ChangeCate(path, cateID, obj, pageNo) {
    var oldCate = $('#curActiveCate').val();
    var newCate = 'c' + cateID;
    if(oldCate == newCate)
    {        
        return;
    }    
       
    if (oldCate == "c1")
    	$('#' + oldCate).attr("class", "FirstBtnActiveNo");
    else if (oldCate == "c3")
    	$('#' + oldCate).attr("class", "LastBtnActiveNo");
    else  
    	$('#' + oldCate).attr("class", "MiddleBtnActiveNo");
    	
    $('#curActiveCate').attr("value",'c' + cateID);
   
    if (newCate == "c1") {
    	$('#' + obj).attr("class", "FirstBtnActive");
    	window.location.href = path + "/myclass";
    	return;
    }
    else if (newCate == "c3") {
        $('#' + obj).attr("class", "LastBtnActive");
        window.location.href = path + "/user_center/joinedclass.jsp";
    	return;
    }
    else if (newCate == "c2") {
        $('#' + obj).attr("class", "MiddleBtnActive");
        window.location.href = path + "/user_center/myclass_addedit.jsp";
        return;
    }    	
    else
    	$('#' + obj).attr("class", "MiddleBtnActive");
    	
    	
  	$.ajax({
  		type:"post",
  		url:"getMyDocJsonAction",
  		data:{ 
  		        pageNo:pageNo,
  			    cateID:cateID
  		},
  		dataType:"json",
  		success:function(data){
  			//alert(data);
  			$('#Content').html(data);
  		},
  		error:function() {
  		    alert('系统异常，请稍后再试!');
  		}
  	});
 }
  
 $(window).load(function(){    
      parent.closeBlock(); 
 }); 