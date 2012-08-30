<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="foofoof._Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>www.foofoof.com闪伏天地</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta name="keywords" content="短信,短信发送,短信在线发送,手机短信,手机短信发送,手机短信在线发送" />
     <style type="text/css">
             .ButtonCss
            {
                BORDER-RIGHT: #A9BAC9 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #A9BAC9 1px solid; PADDING-LEFT: 8px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#cecfde); BORDER-LEFT: #A9BAC9 1px solid; CURSOR: hand; COLOR: #666699; font-weight:bold; PADDING-TOP: 4px; PADDING-BOTTOM: 2px;BORDER-BOTTOM: #A9BAC9 1px solid;
            }
            .text_dialog1,.text_dialog2 {height:19px; line-height:19px; border:1px solid #A9BAC9; padding:0 2px; font-size:12px;font-weight:bold; COLOR: #666699;  }
            .text_dialog2 { border:1px solid #9ECC00;COLOR: #666699; }
            a:link {text-decoration:none;color:#006600;}	/* 未访问的链接 */
            a:visited {text-decoration:none;color:#006600}	/* 已访问的链接 */
            a:hover {text-decoration:underline; color:#006600; }	/* 鼠标移动到链接上 */
            a:active {text-decoration:none;color:#006600}	/* 选定的链接 */
            #loader_container {
	    Z-INDEX: 10; LEFT: 0px; WIDTH: 100%; POSITION: absolute; TOP: 35%; TEXT-ALIGN: center
    } 
        #loader {
	    BORDER-RIGHT: #5a667b 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #5a667b 1px solid; DISPLAY: block; PADDING-LEFT: 5px; FONT-SIZE: 11px; Z-INDEX: 2; PADDING-BOTTOM: 5px; MARGIN: 0px auto; BORDER-LEFT: #5a667b 1px solid; WIDTH: 333px; COLOR: #000000; PADDING-TOP: 5px; BORDER-BOTTOM: #5a667b 1px solid; FONT-FAMILY: Tahoma, Helvetica, sans; BACKGROUND-COLOR:#ffffff; TEXT-ALIGN: left
    }   
    </style>
    <script language="javascript" src="js/index.js" type ="text/javascript"></script>
</head>
<body bgcolor="#ffffff">
     <!--顶层内容start-->
    <DIV id="loader_container" style="DISPLAY: none; WIDTH: 100%; HEIGHT: 6px">
				<DIV id="loader">
				         <table  border="0" cellpadding ="4" cellspacing ="1"  bgcolor="#9999ff" align="center"  width="333px" >
				                        <td align="left"  style="background-image:url(img/menuBackGround.jpg) "colspan="2"><font size=2  color="#666699"><b>用户登录:</b></font></td>
                                        <tr>
                                            <td align="center" bgcolor="#ffffff" width="15%"><input type="hidden" id="hidden1" runat="server" /><font color=black size=2>用&nbsp;&nbsp;户&nbsp;&nbsp;名：</font></td>
                                            <td bgcolor="#ffffff" width="85%"> <input type="text"  id="txtusername"   onkeydown="LoginOnkeydownEvent();"  style="width:145px"  class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'"/><font color=#666699 size=2>*</font></td>
                                        </tr>
                                          <tr>
                                            <td align="center" bgcolor="#ffffff"><font color=black size=2>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</font></td>
                                            <td bgcolor="#ffffff"> <input type="password"  id="txtpassword"  onkeydown="LoginOnkeydownEvent();"   style="width:145px"    class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'"/><font color=#666699 size=2>*</font></td>
                                        </tr>
                                         <tr>
                                            <td align="center" bgcolor="#ffffff" colspan="2"><input type="checkbox" id="ckbLoginStatus" /><font color="black" size="2">记住我的登录状态。</font>&nbsp;<font color="#666699" size="2">(公用电脑请勿选择此项)</font></td>
                                         </tr>
                                          <tr>
                                            <td bgcolor="#ffffff" colspan="2">
                                                <table  border="0" cellpadding ="0" cellspacing ="0"  width="100%">
                                                    <tr>
                                                        <td width="73%" align="right"><input  type="button"  id="btnLogin"  value="登录" onclick="CheckLoginNamePwd();"  class="ButtonCss" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  id="btncancel"  value="取消"  class="ButtonCss" onclick="loginCancel();" /></td>
                                                        <td width="27%">&nbsp;&nbsp;<a href="Register.aspx"><font size=2>新用户注册</font></a></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                         </table>
				</DIV>
	</DIV>
    <!--顶层内容end-->
    <DIV id="backimg" style="DISPLAY: none; Z-INDEX: 1; BACKGROUND: url(img/backgroudimage.png); FILTER: alpha(opacity=78); LEFT: 0px; WIDTH: 0px; POSITION: absolute; TOP: 0px; HEIGHT:0px"><FONT face="宋体"></FONT></DIV>
   
   <!--底层内容start-->
    <p  align="right"><span id="spanusername" runat="server"><a href="#" onclick="loginFuction();"><font size=2>登录</font></a></span></p>
    <form id="form1" runat="server">
    <div>
             
            <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="555px" >
                <tr><td ><input type="hidden" id="hiddenUsername"  runat="server"/><input type="hidden" id="hiddenSsqResult"/><img border="0"  src="img/indexHeader.jpg" width="555px" height="40px"/></td></tr>
            </table>
            <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="555px" >
              <tr>
                                            <td align="left" bgcolor="#ffffff"  width="60%">
                                             <input id="rdlSmsType_1" type="radio" name="rdlSmsType" value="1" checked="checked"  onclick="SelectSmsType(1);" style="cursor:hand"/><font color="#666699" size=2   onclick="SelectSmsType(1);"  style="cursor:hand">移动商务应用</font>
                                             <input id="rdlSmsType_2" type="radio" name="rdlSmsType" value="2"   onclick="SelectSmsType(2);" style="cursor:hand"/><font color=#666699 size=2  onclick="SelectSmsType(2);"  style="cursor:hand">飞信</font>
                                             &nbsp;&nbsp;
                                             </td>
                                             <td align="right" width="40%">
                                                <a href='stock.htm' target="_blank"  title="股票信息"><font color=#006600  size=2>股票实时行情</font></a>&nbsp;
                                             </td>
                </tr>
             </table>
             <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="555px">
               <tr><td id="tdSmsIframe" runat="server"><iframe src='SmsNormal.aspx' width='555px' height="200px" scrolling="no" frameborder="0" marginwidth="0" marginheight="0"></iframe></td></tr>
            </table>
           <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="555px">
                 <tr height="10px"><td>&nbsp;</td></tr>
            </table>
             <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="555px"  id="tabchoujiang" style="display:none" >
                 <tr><td align="center"><img border="0"  src="img/yun123.gif" width="55px" height="55px"/></td></tr>
                  <tr><td  align="center"><font color=#666699 size=2><b>正在抽奖中...</b></font></td></tr>
            </table>
          <table  border="0" cellpadding ="4" cellspacing ="1"  bgcolor="#9999ff" align="center" width="545px"  id="tabkaijiang" style="display:none" >
                <tr ><td id="tdchoujiangResult"  bgcolor="#ffffff">&nbsp;</td></tr>
                <tr><td bgcolor="#ffffff"><iframe src='http://www.zhcw.com/kaijiang/index_kj.html' width='545px' height="120px" scrolling="no" frameborder="0" marginwidth="0" marginheight="0"></iframe></td></tr>
            </table>
           <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="555px">
                <tr height="78px"><td>&nbsp;</td></tr>
            </table>
          <center>
            <font size=2 color=gray><a href='#'  id="akaijiang" onclick="kaijiang();" title="点击进行双色球抽奖"><font color=#006600  size=2>试试手气</font></a> - <a href ="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.foofoof.com');">设为首页</a>  - <a href ="#" onclick="window.external.AddFavorite(location.href, document.title);">收藏本站</a>- <a href ="#" title="旨在提供短信在线交互平台">关于我们</a> - <a href ="CnInterface/"  title="网站创意诞生于2010年3月15日,旨在提供接口共享平台，体现接口服务价值">接口在线</a>  - About 闪伏天地 - 公司介绍
            <br />Copyright © 2010 foofoof.com Inc. All Rights Reserved. 闪伏天地 版权所有 <br>
            ©2010 foofoof&nbsp;&nbsp;<a href="http://www.miibeian.gov.cn/" target='_blank' >京ICP备09069776号</a>
            &nbsp;&nbsp; 联系方式：<a href="http://wpa.qq.com/msgrd?V=1Uin=459313018&Site=ioshenmue&Menu=yes" target="_blank">QQ</a>&nbsp;&nbsp;
            <a href="msnim:chat?contact=liwei5000000@163.com">MSN</a>&nbsp;&nbsp;
            <a href='http://www.alisoft.com/portal/promotion/alitalk/tbfuchu/go123.html?id=9927375' target='_blank'>TEL</a><br></font>
           </center> 
             <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="555px">
                <tr height="60px"><td>&nbsp;</td></tr>
            </table>
    </div>
    </form>
</body>
</html>
