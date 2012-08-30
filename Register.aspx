<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="foofoof.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<title>www.foofoof.com闪伏天地</title>
    <style type="text/css">
         a:link {text-decoration:none;color:#006600;}	/* 未访问的链接 */
        a:visited {text-decoration:none;color:green}	/* 已访问的链接 */
        a:hover {text-decoration:underline; color:green; cursor:hand;}	/* 鼠标移动到链接上 */
        a:active {text-decoration:none;color:green}	/* 选定的链接 */
    </style>
    <script language ="javascript">
        function ConfirmElements() {
            if (document.getElementById("txtUsername").value == "") {
                alert("请输入您要注册的用户名！");
                document.getElementById("txtUsername").focus();
                return false;
            }
            if (document.getElementById("txtUsername").value != "") {
                if (document.getElementById("txtUsername").value.indexOf("<") > -1 || document.getElementById("txtUsername").value.indexOf("'") > -1 || document.getElementById("txtUsername").value.indexOf(">") > -1 || document.getElementById("txtUsername").value.indexOf("--") > -1) {
                    alert("用户名中不能包含<>'--等非法字符!");
                    document.getElementById("txtUsername").focus();
                    return false;
                }
            }
            if (document.getElementById("hiddenCheckOk").value == "error") {
                alert("您所输入用户名已被注册，请更改其他用户名注册！");
                document.getElementById("txtUsername").focus();
                return false;
            } 
            if (document.getElementById("txtPassword1").value == "") {
                alert("请输入密码！");
                document.getElementById("txtPassword1").focus();
                return false;
            }
            if (document.getElementById("txtPassword1").value != "") {
                if (document.getElementById("txtPassword1").value.indexOf("<") > -1 || document.getElementById("txtPassword1").value.indexOf("'") > -1 || document.getElementById("txtPassword1").value.indexOf(">") > -1 || document.getElementById("txtPassword1").value.indexOf("--") > -1) {
                    alert("密码中不能包含<>'--等非法字符!");
                    document.getElementById("txtPassword1").focus();
                    return false;
                }
            }
            if (document.getElementById("txtPassword2").value == "") {
                alert("请输入确认密码！");
                document.getElementById("txtPassword2").focus();
                return false;
            }
            if (document.getElementById("txtPassword1").value != document.getElementById("txtPassword2").value) {
                alert("密码和确认密码需一致！");
                document.getElementById("txtPassword2").focus();
                return false;
            }
            if (document.getElementById("txtRealName").value == "") {
                alert("请输入昵称！");
                document.getElementById("txtRealName").focus();
                return false;
            }
            if (document.getElementById("txtRealName").value != "") {
                if (document.getElementById("txtRealName").value.indexOf("<") > -1 || document.getElementById("txtRealName").value.indexOf("'") > -1 || document.getElementById("txtRealName").value.indexOf(">") > -1 || document.getElementById("txtRealName").value.indexOf("--") > -1) {
                    alert("昵称中不能包含<>'--等非法字符!");
                    document.getElementById("txtRealName").focus();
                    return false;
                }
            }
            if (document.getElementById("hiddenNameCheckOk").value == "error") {
                alert("您所输入昵称已被注册，请更改其他昵称注册！");
                document.getElementById("txtRealName").focus();
                return false;
            }
            if (document.getElementById("txtRemark").value == "") {
                /*alert("个性签名不能为空！");
                document.getElementById("txtRemark").focus();
                return false;*/
                document.getElementById("txtRemark").value = "这家伙很懒，什么都没留下！";
            }
            else {
                document.getElementById("txtRemark").value=document.getElementById("txtRemark").value.replace("<", "").replace(">", "").replace("'", "").replace("--", "");
            }
            /* if (document.getElementById("tdOthers").style.display == "none") {
                if (window.confirm("确认不填写更多用户信息吗？"))
                    return true;
                else
                    return false;
            }*/
            if (document.getElementById("tdOthers").style.display == "block") {
                document.getElementById("txtUserBirthday").value=document.getElementById("txtUserBirthday").value.replace("<", "").replace(">", "").replace("'", "").replace("--", "");
                document.getElementById("txtUserTel").value=document.getElementById("txtUserTel").value.replace("<", "").replace(">", "").replace("'", "").replace("--", "");
                document.getElementById("txtUserMobile").value=document.getElementById("txtUserMobile").value.replace("<", "").replace(">", "").replace("'", "").replace("--", "");
                document.getElementById("txtUserEmail").value=document.getElementById("txtUserEmail").value.replace("<", "").replace(">", "").replace("'", "").replace("--", "");
                document.getElementById("txtUserMsn").value=document.getElementById("txtUserMsn").value.replace("<", "").replace(">", "").replace("'", "").replace("--", "");
                document.getElementById("txtQQ").value=document.getElementById("txtQQ").value.replace("<", "").replace(">", "").replace("'", "").replace("--", "");
                document.getElementById("txtAddress").value=document.getElementById("txtAddress").value.replace("<", "").replace(">", "").replace("'", "").replace("--", "");
                document.getElementById("txtZip").value=document.getElementById("txtZip").value.replace("<", "").replace(">", "").replace("'", "").replace("--", "");
            }
            return true;
        }
        function ShowOrNoTD() {
            if (document.getElementById("tdOthers").style.display == "none") {
                document.getElementById("tdOthers").style.display = "block";
                document.getElementById("aResigerOthers").innerHTML = "<font size='2' color='#cc4400' >收起</font>";
            }
            else {
                document.getElementById("tdOthers").style.display = "none";
                document.getElementById("aResigerOthers").innerHTML = "<font size='2' color='#006600' >展开</font>";
            }
        }

        function createHttpRequest() {
            try {
                return new ActiveXObject('MSXML2.XMLHTTP.4.0');
            }
            catch (e) {
                try {
                    return new ActiveXObject('MSXML2.XMLHTTP.3.0');
                }
                catch (e) {
                    try {
                        return new ActiveXObject('MSXML2.XMLHTTP.5.0');
                    } catch (e) {
                        try {
                            return new ActiveXObject('MSXML2.XMLHTTP');
                        } catch (e) {
                            try {
                                return new ActiveXObject('Microsoft.XMLHTTP');
                            } catch (e) {
                                if (window.XMLHttpRequest) {
                                    return new XMLHttpRequest();
                                }
                                else {
                                    return null;
                                }
                            }
                        }
                    }
                }
            }
        }

        var xmlhttpRegister;
        function CheckUserNameIsExist() {
            try {
                if (document.getElementById("txtUsername").value == "")
                    return;
                if (document.getElementById("txtUsername").value != "") {
                    if (document.getElementById("txtUsername").value.indexOf("<") > -1 || document.getElementById("txtUsername").value.indexOf("'") > -1 || document.getElementById("txtUsername").value.indexOf(">") > -1 || document.getElementById("txtUsername").value.indexOf("--") > -1) {
                        document.getElementById("spanusernamecheck").innerHTML = "<font size=2 color=red>用户名中不能包含<>'--等非法字符!</font>";
                        return;
                    }
                }
                xmlhttpRegister = createHttpRequest();
                document.getElementById("spanusernamecheck").innerHTML = "<font size=2 color=blue>用户名检查中...</font>";
                var UrlStr = "register.aspx?ResponseUserName=" + document.getElementById("txtUsername").value;
                xmlhttpRegister.onreadystatechange = processReqChange1;
                xmlhttpRegister.open("POST", UrlStr, true);
                xmlhttpRegister.setRequestHeader('Connection', 'close');
                xmlhttpRegister.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xmlhttpRegister.send(null);
            }
            catch (e) {
                document.getElementById("spanusernamecheck").innerHTML = "<font size=2 color=red>网络忙，请稍后注册此用户名!</font>";
                document.getElementById("hiddenCheckOk").value = "error";
            }
        }

        function processReqChange1() {
            try {
                if (xmlhttpRegister.readyState == 4) {
                    if (xmlhttpRegister.status == 200) {
                        if (xmlhttpRegister.responseText == "no") {
                            document.getElementById("spanusernamecheck").innerHTML = "<font size=2 color=green>此用户名可用!</font>";
                            document.getElementById("hiddenCheckOk").value = "ok";
                        }
                        else {
                            document.getElementById("spanusernamecheck").innerHTML = "<font size=2 color=red>此用户名已被注册，请更换其他用户名!</font>";
                            document.getElementById("hiddenCheckOk").value = "error";
                        }
                    }
                }
            }
            catch (e) {
                document.getElementById("spanusernamecheck").innerHTML = "<font size=2 color=red>网络忙，请稍后注册此用户名!</font>";
                document.getElementById("hiddenCheckOk").value = "error";
            }
        }
        function CheckNameIsExist() {
            try {
                if (document.getElementById("txtRealName").value == "")
                    return;
                if (document.getElementById("txtRealName").value != "") {
                    if (document.getElementById("txtRealName").value.indexOf("<") > -1 || document.getElementById("txtRealName").value.indexOf("'") > -1 || document.getElementById("txtRealName").value.indexOf(">") > -1 || document.getElementById("txtRealName").value.indexOf("--") > -1) {
                        document.getElementById("spannamecheck").innerHTML = "<font size=2 color=red>昵称中不能包含<>'--等非法字符!</font>";
                        return;
                    }
                }
                xmlhttpRegister = createHttpRequest();
                document.getElementById("spannamecheck").innerHTML = "<font size=2 color=blue>昵称检查中...</font>";
                var UrlStr = "register.aspx?ResponseName=" +escape(document.getElementById("txtRealName").value);
                xmlhttpRegister.onreadystatechange = processReqChange2;
                xmlhttpRegister.open("POST", UrlStr, true);
                xmlhttpRegister.setRequestHeader('Connection', 'close');
                xmlhttpRegister.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                xmlhttpRegister.send(null);
            }
            catch (e) {
                document.getElementById("spannamecheck").innerHTML = "<font size=2 color=red>网络忙，请稍后注册此昵称!</font>";
                document.getElementById("hiddenNameCheckOk").value = "error";
            }
        }

        function processReqChange2() {
            try {
                if (xmlhttpRegister.readyState == 4) {
                    if (xmlhttpRegister.status == 200) {
                        if (xmlhttpRegister.responseText == "no") {
                            document.getElementById("spannamecheck").innerHTML = "<font size=2 color=green>此昵称可用!</font>";
                            document.getElementById("hiddenNameCheckOk").value = "ok";
                        }
                        else {
                            document.getElementById("spannamecheck").innerHTML = "<font size=2 color=red>此昵称已被注册，请更换其他昵称!</font>";
                            document.getElementById("hiddenNameCheckOk").value = "error";
                        }
                    }
                }
            }
            catch (e) {
                document.getElementById("spannamecheck").innerHTML = "<font size=2 color=red>网络忙，请稍后注册此昵称!</font>";
                document.getElementById("hiddenNameCheckOk").value = "error";
            }
        }
    </script>
    <style type="text/css">
        #txtRemark 
        {
            height: 50px;
            width: 317px;
        }
         .button_dialog 
        {
            BORDER-RIGHT: #A9BAC9 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #A9BAC9 1px solid; PADDING-LEFT: 8px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#cecfde); BORDER-LEFT: #A9BAC9 1px solid; CURSOR: hand; COLOR: #666699; font-weight:bold; PADDING-TOP: 3px; PADDING-BOTTOM: 2px;BORDER-BOTTOM: #A9BAC9 1px solid;
        } 
        .text_dialog1,.text_dialog2 {height:19px; line-height:19px; border:1px solid #A9BAC9; padding:0 2px; font-size:12px; COLOR: #666699;  }
        .text_dialog2 { border:1px solid #9ECC00;COLOR: #666699; }
    </style>
</head>
<body  bgcolor="#edf3f3">

    <form id="form1" runat="server"><input type ="hidden" id ="hiddenCheckOk" /><input type ="hidden" id ="hiddenNameCheckOk" />
    <div >
    <center ><a href="Index.aspx"><img title="返回主页"  border="0"  src="img/registerHeader.jpg" width="555px" height="40px" style="cursor:hand" /></a></center>
    <center >
        <table border ="0" cellpadding ="4" cellspacing ="1" width ="555px" bgcolor="#9999ff">
            <tr>
                <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>登录用户名：</font></td>
                <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtUsername" runat ="server"  size =18 onblur="CheckUserNameIsExist();" /><font color=red >*</font><span id="spanusernamecheck"><font size=2 color="#666699">字母或数字</font></span></td>
            </tr>
            <tr>
                <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>登录密码：</font></td>
                <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="password" id ="txtPassword1" runat ="server" /><font color=red >*</font><font size=2 color="#666699">数字或字母</font></td>
            </tr>
            <tr>
                <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>登录确认密码：</font></td>
                <td bgcolor="#edf3f3"  width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="password" id ="txtPassword2" runat ="server"/><font color=red >*</font><font size=2 color="#666699">数字或字母</font></td>
            </tr>
             <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>昵称：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left"><input  size="18" class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtRealName" runat ="server"  onblur="CheckNameIsExist();" /><font color=red >*</font><span id="spannamecheck"><font size=2 color="#666699">中文</font></span></td>
             </tr>
             <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>性别：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left">
                                <select id ="sltUserSex" runat ="server" >
                                     <option value="1" selected>男</option>
                                     <option value="2">女</option>
                                </select>
                            </td>
            </tr>
            <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>知晓本站渠道：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left">
                                <select id ="sltchannel" runat="server">
                                    <option value="1">广告</option>
                                    <option value="2" selected="selected">朋友介绍</option>
                                    <option value="3">其他网站链接</option>
                                    <option value="4">搜索</option>
                                    <option value="5">其他</option>
                                </select>
                            </td>
            </tr>
            <tr>
                <td bgcolor="#edf3f3"  width="40%" align="right"><font color="black" size=2>个性签名：</font></td>
                <td bgcolor="#edf3f3" width="60%" align="left"><textarea  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'"  id ="txtRemark" runat ="server" ></textarea></td>
            </tr>
            <tr><td bgcolor="#edf3f3"  align="right" ><font color=black size=2>注册更多用户信息：</font></td><td  bgcolor="#edf3f3"  align="left"><span id="aResigerOthers" style="cursor:hand;text-decoration:underline;"  onclick="ShowOrNoTD();" ><font size="2" color="#006600" >展开</font></span></td></tr>
            <tr  id="tdOthers" style="display:none">
                <td bgcolor="#edf3f3" colspan="2">
                         <table border ="0" cellpadding ="4" cellspacing ="0" width ="100%"   bgcolor="#9999ff">
                        <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>出生日期：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtUserBirthday" runat ="server"/><font size="2" color="black">(格式:1985-06-24)</font></td>
                        </tr>
                        <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>电话：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtUserTel" runat ="server" /></td>
                        </tr>
                        <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>手机：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtUserMobile" runat ="server" /></td>
                        </tr>
                         <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>Email：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtUserEmail" runat ="server" /></td>
                        </tr>
                         <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>Msn：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtUserMsn" runat ="server" /></td>
                        </tr>
                        <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>QQ：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtQQ" runat ="server" /></td>
                        </tr>
                         <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>地址：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtAddress" runat ="server" /></td>
                        </tr>
                         <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>邮编：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left"><input  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" type ="text" id ="txtZip" runat ="server" /></td>
                        </tr>
                          <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>受教育程度：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left">
                                <select id ="sltEducation" runat="server">
                                    <option value="0">请选择</option>
                                    <option value="1">高中及以下</option>
                                    <option value="2">专科(大专)</option>
                                    <option value="3">本科</option>
                                    <option value="4">硕士</option>
                                    <option value="5">博士及以上</option>
                                </select>
                            </td>
                        </tr>
                          <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>行业：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left">
                                <select id ="sltProfession" runat="server">
                                 <option value="0">请选择</option>
                                    <option value="1">销售/市场营销</option>
                                    <option value="2">技术研发/售前售后工程师</option>
                                    <option value="3">企业管理/行政/人力资源</option>
                                    <option value="4">证券/金融/投资</option>
                                    <option value="5">公关/咨询/媒体</option>
                                    <option value="6">公务员/科/教/文/卫</option>
                                     <option value="7">私营企业主/贸易</option>
                                      <option value="8">其他</option>
                                </select>
                            </td>
                        </tr>
                          <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>国家：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left">
                                <select id ="sltCountry" runat="server">
                                 <option value="">请选择</option>
                                    <option value="中国">中国</option>
                                    <option value="美国">美国</option>
                                    <option value="英国">英国</option>
                                    <option value="法国">法国</option>
                                    <option value="德国">德国</option>
                                    <option value="巴西">巴西</option>
                                    <option value="韩国">韩国</option>
                                    <option value="伊朗">伊朗</option>
                                    <option value="朝鲜">朝鲜</option>
                                     <option value="泰国">泰国</option>
                                     <option value="越南">越南</option>
                                     <option value="印度">印度</option>
                                     <option value="南非">南非</option>
                                      <option value="日本">日本</option>
                                     <option value="墨西哥">墨西哥</option>
                                     <option value="意大利">意大利</option>
                                     <option value="新加坡">新加坡</option>
                                    <option value="俄罗斯">俄罗斯</option>
                                    <option value="加拿大">加拿大</option>
                                     <option value="马来西亚">马来西亚</option>
                                    <option value="澳大利亚">澳大利亚</option>
                                    <option value="巴基斯坦">巴基斯坦</option>
                                    <option value="其他">其他</option>
                                </select>
                            </td>
                        </tr>
                          <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>省份：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left">
                                <select id ="sltProvince" runat="server">
                                <option value="">请选择</option>
                                   <option value="北京">北京</option>
                                    <option value="上海">上海</option>
                                    <option value="香港">香港</option>
                                    <option value="澳门">澳门</option>
                                    <option value="湖南">湖南</option>
                                    <option value="深圳">深圳</option>
                                    <option value="广东">广东</option>
                                    <option value="天津">天津</option>
                                    <option value="广西">广西</option>
                                    <option value="江西">江西</option>
                                    <option value="山西">山西</option>
                                    <option value="江苏">江苏</option>
                                     <option value="四川">四川</option>
                                       <option value="重庆">重庆</option>
                                      <option value="浙江">浙江</option>
                                      <option value="湖北">湖北</option>
                                      <option value="山东">山东</option>
                                      <option value="辽宁">辽宁</option>
                                      <option value="哈尔滨">哈尔滨</option>
                                      <option value="大连">大连</option>
                                       <option value="内蒙古">内蒙古</option>
                                      <option value="河南">河南</option>
                                      <option value="河北">河北</option>
                                      <option value="西藏">西藏</option>
                                      <option value="新疆">新疆</option>
                                      <option value="宁夏">宁夏</option>
                                       <option value="其他">其他</option>
                                </select>
                            </td>
                        </tr>
                          <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>城市：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left">
                                <select id ="sltCity" runat="server">
                                 <option value="">请选择</option>
                                     <option value="北京">北京</option>
                                    <option value="上海">上海</option>
                                    <option value="长沙">长沙</option>
                                     <option value="香港">香港</option>
                                    <option value="澳门">澳门</option>
                                    <option value="广州">广州</option>
                                    <option value="深圳">深圳</option>
                                    <option value="澳门">澳门</option>
                                    <option value="天津">天津</option>
                                    <option value="大连">大连</option>
                                    <option value="南昌">南昌</option>
                                     <option value="常德">常德</option>
                                      <option value="岳阳">岳阳</option>
                                       <option value="邵阳">邵阳</option>
                                        <option value="耒阳">耒阳</option>
                                         <option value="祁阳">祁阳</option>
                                          <option value="郴州">郴州</option>
                                           <option value="浏阳">浏阳</option>
                                            <option value="株洲">株洲</option>
                                             <option value="衡山">衡山</option>
                                    <option value="衡阳">衡阳</option>
                                    <option value="武汉">武汉</option>
                                    <option value="安徽">安徽</option>
                                    <option value="浙江">浙江</option>
                                    <option value="成都">成都</option>
                                     <option value="昆明">昆明</option>
                                      <option value="扬州">扬州</option>
                                       <option value="其他">其他</option>
                                </select>
                            </td>
                        </tr>
                          <tr>
                            <td bgcolor="#edf3f3" width="40%" align="right"><font color=black size=2>上网地点：</font></td>
                            <td bgcolor="#edf3f3" width="60%" align="left">
                                <select id ="sltNetAddress" runat="server">
                                 <option value="0">请选择</option>
                                    <option value="1">办公室</option>
                                    <option value="2">住所</option>
                                    <option value="3">网吧</option>
                                    <option value="4">户外</option>
                                    <option value="5">其他</option>
                                </select>
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#edf3f3" colspan="2"  align="center" height="24px"><asp:Button 
                        ID="btnregister1" runat="server" onclick="btnregister1_Click" Text="注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册" Width="100px"  CssClass="button_dialog"/>
                </td>
            </tr>
        </table></center>
    </div>
    <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="555px">
                <tr height="91px"><td>&nbsp;</td>
                </tr>
            </table>
          <center>
            <font size=2 color=gray><a href ="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.foofoof.com');">设为首页</a>  - <a href ="#">广告服务</a> - <a href ="#">客服中心</a> - <a href ="#">联系方式</a> - <a href="#"><font size=2>版权声明</font></a>  - About 闪伏天地 - 公司介绍
            <br />Copyright © 2010 foofoof.com Inc. All Rights Reserved. 闪伏天地 版权所有 <br>
            本站所有内容闪伏天地拥有最终解释权。<br />
            <a href="http://www.miibeian.gov.cn/" target='_blank' >京ICP备09069776号</a>
            &nbsp;&nbsp; 站长联系方式：<a href="http://wpa.qq.com/msgrd?V=1Uin=459313018&Site=ioshenmue&Menu=yes" target="_blank">QQ</a>&nbsp;&nbsp;
            <a href="msnim:chat?contact=liwei5000000@163.com">MSN</a>&nbsp;&nbsp;
            <a href='http://www.alisoft.com/portal/promotion/alitalk/tbfuchu/go123.html?id=9927375' target='_blank'>TEL</a><br></font>
           </center>
    </form>
</body>
</html>