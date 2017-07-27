
function setSubLabel(currLabel)
{
	subLabel = new Array();
	subLabel[0]=new Array("同行","北京|天津|上海|重庆|河北|山西|辽宁|吉林|黑龙江|江苏|浙江|安徽|福建|江西|山东|河南|湖北|湖南|广东|海南|四川|贵州|云南|陕西|甘肃|青海|台湾|内蒙古|广西|西藏|宁夏|新疆|香港|澳门|国外");
	subLabel[1]=new Array("购物","女装|男装|鞋靴|美妆|书籍|美食|数码|杂货");
	subLabel[2]=new Array("二手","女装|男装|鞋靴|美妆|书籍|美食|数码|杂货");
	subLabel[3]=new Array("组队","比赛|其他");
	subLabel[4]=new Array("0","--选择副标签--")	
    //当前所选择的标签
    var currLabel = currLabel;  
    var i,j,k;  
    //清空副标签下拉选单  
    document.all.selectSubLabel.length = 0 ;  
    for (i = 0 ;i <subLabel.length;i++)  
    {  
        //得到当前标签在副标签数组中的位置  
        if(subLabel[i][0]==currLabel)  
        {  
            //得到当前标签下的副标签 
            var tmpSubLabel = subLabel[i][1].split("|")  
            for(j=0;j<tmpSubLabel.length;j++)  
            {  
                //填充副标签下拉选单  
                document.all.selectSubLabel.options[document.all.selectSubLabel.length] = new Option(tmpSubLabel[j],tmpSubLabel[j]);  
            }  
        }  
    }  

}


function checktitle(){
	var div = document.getElementById("postremind1");
	div.innerHTML = "";
	var title1 = document.form1.title.value;
	if(title1 == "") {
		div.innerHTML = "请输入标题";
		document.form1.title.focus();
		return false;
	}
	if(title1.length < 4 || title1.length > 40) {
		div.innerHTML = "标题长度4-40字";
		document.form1.title.select();
		return false;
	}
	return true;
}



function checkcontent(){
	var div = document.getElementById("postremind2");
	div.innerHTML = "";
	var content1 = document.form1.content.value;
	if(content1 == "") {
		div.innerHTML = "请输入正文";
		document.form1.content.focus();
		return false;
	}
	if(content1.length < 15 || content1.length > 1000) {
		div.innerHTML = "正文长度15-1000字";
		document.form1.content.select();
		return false;
	}
	return true;
}

function checkcontactway(){
	var div = document.getElementById("postremind3");
	div.innerHTML = "";
	var contactway1 = document.form1.contactway.value;
	if(contactway1 == "") {
		div.innerHTML = "请输入联系方式";
		document.form1.contactway.focus();
		return false;
	}
	return true;
}


//检查
function postcheck() {
	if(checktitle() && checkcontent() && checkcontactway()) {
		return true;
	} else {
		return false;
	}
}
