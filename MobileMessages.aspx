<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobileMessages.aspx.cs" Inherits="foofoof.MobileMessages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>www.foofoof.com闪伏天地</title>
       <style type="text/css">
        a:link {text-decoration:none;color:green;}	/* 未访问的链接 */
        a:visited {text-decoration:none;color:green}	/* 已访问的链接 */
        a:hover {text-decoration:underline; color:green; cursor:hand;}	/* 鼠标移动到链接上 */
        a:active {text-decoration:none;color:green}	/* 选定的链接 */
         .ButtonCss
        {
            BORDER-RIGHT: #A9BAC9 1px solid; PADDING-RIGHT: 8px; BORDER-TOP: #A9BAC9 1px solid; PADDING-LEFT: 8px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#cecfde); BORDER-LEFT: #A9BAC9 1px solid; CURSOR: hand; COLOR: #666699; font-weight:bold; PADDING-TOP: 4px; PADDING-BOTTOM: 2px;BORDER-BOTTOM: #A9BAC9 1px solid;
        }
        .text_dialog1,.text_dialog2 {height:19px; line-height:19px; border:1px solid #A9BAC9; padding:0 2px; font-size:12px;font-weight:bold; COLOR: #000066;  }
        .text_dialog2 { border:1px solid #9ECC00;COLOR: #000066; }
    </style>
</head>
<body bgcolor="#ffffff" >
     <form id="form1" runat="server">
    <div>
    <center>
<table   border ="0" cellpadding ="3" cellspacing ="1" width ="888px" bgcolor="#9999ff">
           
            <tr><td align="left"  style="background-image:url(img/menuBackGround.jpg) " ><font color="#666699"> 本机共发送手机短信<font color=blue><b><%=messageCount %></b></font>条 | 今日已发送<font color=blue><b><%=todaymessageCount.ToString()%></b></font>条 </font></td></tr>
            
            <tr>
                <td  bgcolor="#ffffff"  align="left">&nbsp;<font size=2 color=#666699><b>请输入你要查询的手机号码：</b></font>
                    <asp:TextBox ID="txtMobileNo" runat="server"   class="text_dialog1" onmouseover="this.className='text_dialog2'" onMouseOut="this.className='text_dialog1'" ></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnMessagesSelect" runat="server" 
                        Text="查询" onclick="btnMessagesSelect_Click"   CssClass="ButtonCss" />
                </td>
           </tr>
           <tr>
                <td align="left"  bgcolor="#ffffff" ><asp:Label ID="labMobileMessages" runat="server" ></asp:Label></td>
            </tr>
   </table>
   </center>
    </div>
    </form>
</body>
</html>
