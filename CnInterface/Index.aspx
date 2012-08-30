<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="foofoof.CnInterface.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>www.cnInterface.com接口在线</title>
     <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta name="keywords" content="接口,接口在线,价值接口,程序接口,网络接口,webservice接口,http接口,ActiveX dll接口,普通dll接口,数据库接口" />
    <style type="text/css">
         a:link {text-decoration:none;color:#666699;}	/* 未访问的链接 */
         a:visited {text-decoration:none;color:#666699}	/* 已访问的链接 */
         a:hover {text-decoration:underline; color:#666699; }	/* 鼠标移动到链接上 */
         a:active {text-decoration:underline;color:#666699}	/* 选定的链接 */
         .text_dialog1,.text_dialog2 {height:20px; line-height:19px; border:1px solid #A9BAC9; padding:0 2px; font-size:12px;COLOR:black;  }
         .text_dialog2 { border:1px solid #9ECC00;COLOR: #666699; }
        .ButtonCss
            {
                BORDER-RIGHT: #A9BAC9 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #A9BAC9 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#cecfde); BORDER-LEFT: #A9BAC9 1px solid; CURSOR: hand; COLOR:#666699; PADDING-TOP: 3px; PADDING-BOTTOM: 1px;BORDER-BOTTOM: #A9BAC9 1px solid;
            }
    </style>
     <script language="javascript" src="js/index.js" type ="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
     <div style ="position:absolute; top:0px; left :0px; width:1px;height:1px;background-color:White; display:none;" id="DivInterfaceDiff">
          <table border="0" cellpadding ="4" cellspacing ="1"  bgcolor="#9999ff" width="375px" >
                    <tr height="55px">
                        <td bgcolor="#ffffff"><font size=2 color=#666699>各种接口区别：<br>
                                一、WebService接口   通用性强、可以跨平台。<br />
                                二、ActiveX dll       调用简单、方便的COM控件，需要注册控件。<br />
                                三、HTTP接口     通用性强、接入灵活、通信快速、可以跨平台。<br />
                                四、普通DLL接口      适合各种C/S软件方便引用。<br />
                                五、数据库接口        适合数据库开发用户选择。</font>
                        </td>
                     </tr>
          </table>
      </div>
    <div>
       <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="678px">
                <tr height="29px"><td>&nbsp;</td></tr>
      </table>
     <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="678px" >
                <tr><td align="center"><img border="0"  src="img/logo_cninterface.gif" width="208px" height="68px" style="cursor:hand" title="旨在提供接口共享平台，体现接口服务价值"/></td></tr>
     </table>
      <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="678px">
                <tr height="51px"><td>&nbsp;</td></tr>
      </table>
      <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="678px">
                <tr>
                      <td align="right"><a href="#" id="aWebservice" runat="server" style="text-decoration:none" onclick="setSelectList(this.id);"><font size=2 color="#003399"><b>WebService</b></font></a> <font color="#660066"><b>|</b></font> <a href="#" id="aHTTP"  runat="server"  onclick="setSelectList(this.id);"><font size=2>HTTP</font></a>  <font color="#660066"><b>|</b></font> <a href="#" id="aDLL"  runat="server"  onclick="setSelectList(this.id);"><font size=2 >普通DLL</font></a> <font color="#660066"><b>|</b></font> <a href="#"  id="aADLL"  runat="server"  onclick="setSelectList(this.id);"><font size=2>ActiveX DLL</font></a> <font color="#660066"><b>|</b></font> <a href="#" id="aData"  runat="server"  onclick="setSelectList(this.id);"><font size=2>数据库</font></a>&nbsp;&nbsp;<input style="background-color:#ffffff;width:1px;border:0px solid #ffffff;"   type ="text" size="1"  id="txtDivInterfaceDiff" /><span onmouseover="showInterfaceDiff();"  onmouseout="noShowInterfaceDiff();" style="cursor:hand"><font size=2 color="#003399">区别</font></span></td>
                      <td colspan="2"><input type="hidden" id="hiddenInterfaceName"  runat="server"/></td></tr>
                 <tr>
                      <td  width="71%" align="right"><input type="text"  style="width:333px"  id="txtInterfaceName"  runat="server"    class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" /></td>
                      <td  width="2%">&nbsp;</td>
                      <td  width="27%"><asp:Button  CssClass="ButtonCss"  ID="bntInterfaceSelect"  
                              runat="server" Text="接口搜索" onclick="bntInterfaceSelect_Click" /></td>
                </tr>
      </table>
      <table  border="0" cellpadding ="0" cellspacing ="0"  align="center" width="678px">
                <tr height="80px"><td>&nbsp;</td></tr>
      </table>
      <center>
            <font size=2 color=gray><a href ="#" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.cnInterface.com接口在线');">设为首页</a>  - <a href ="#" onclick="window.external.AddFavorite(location.href, document.title);">收藏本站</a> - <a href ="#" title="网站创意诞生于2010年3月15日,旨在提供接口共享平台，体现接口服务价值">关于我们</a> - <a href ="#"  title="李's :13810282409">联系我们</a> - <a href="../"  title="旨在提供手机短信在线交互平台"><font size=2>闪伏天地</font></a>  - About 接口在线 - 公司介绍
            <br />Copyright © 2010 cnInterface.com Inc. All Rights Reserved. 接口在线公司 版权所有 <br>
            <a href="http://www.miibeian.gov.cn/" target='_blank' >京ICP备09069776号</a>
            &nbsp;&nbsp; 联系方式：<a href="http://wpa.qq.com/msgrd?V=1Uin=459313018&Site=ioshenmue&Menu=yes" target="_blank">QQ</a>&nbsp;&nbsp;
            <a href="msnim:chat?contact=liwei5000000@163.com">MSN</a>&nbsp;&nbsp;
            <a href='http://www.alisoft.com/portal/promotion/alitalk/tbfuchu/go123.html?id=9927375' target='_blank'>TEL</a><br>
            本站所有内容接口在线公司拥有最终解释权。<br /></font>
     </center> 
    </div>
    </form>
</body>
</html>
