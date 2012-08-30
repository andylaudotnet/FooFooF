using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foofoof.CnInterface
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void bntInterfaceSelect_Click(object sender, EventArgs e)
        {
            string showname = hiddenInterfaceName.Value.Trim();
            switch (showname)
            {
                case "aWebservice":
                    showname = "Webservice";
                    aWebservice.InnerHtml = "<font size=2 color=\"#003399\"><b>" + showname + "</b></font>";
                    aHTTP.InnerHtml = "<font size=2>HTTP</font>";
                    aDLL.InnerHtml = "<font size=2>普通DLL</font>";
                    aADLL.InnerHtml = "<font size=2>ActiveX DLL</font>";
                    aData.InnerHtml = "<font size=2>数据库</font>";
                    break;
                case "aHTTP":
                    showname = "HTTP";
                    aHTTP.InnerHtml = "<font size=2 color=\"#003399\"><b>" + showname + "</b></font>";
                    aWebservice.InnerHtml = "<font size=2>Webservice</font>";
                    aDLL.InnerHtml = "<font size=2>普通DLL</font>";
                    aADLL.InnerHtml = "<font size=2>ActiveX DLL</font>";
                    aData.InnerHtml = "<font size=2>数据库</font>";
                    break;
                case "aDLL":
                    showname = "普通DLL";
                    aDLL.InnerHtml = "<font size=2 color=\"#003399\"><b>" + showname + "</b></font>";
                    aHTTP.InnerHtml = "<font size=2>HTTP</font>";
                    aWebservice.InnerHtml = "<font size=2>Webservice</font>";
                    aADLL.InnerHtml = "<font size=2>ActiveX DLL</font>";
                    aData.InnerHtml = "<font size=2>数据库</font>";
                    break;
                case "aADLL":
                    showname = "ActiveX DLL";
                    aADLL.InnerHtml = "<font size=2 color=\"#003399\"><b>" + showname + "</b></font>";
                    aHTTP.InnerHtml = "<font size=2>HTTP</font>";
                    aDLL.InnerHtml = "<font size=2>普通DLL</font>";
                    aWebservice.InnerHtml = "<font size=2>Webservice</font>";
                    aData.InnerHtml = "<font size=2>数据库</font>";
                    break;
                case "aData":
                    showname = "数据库";
                    aData.InnerHtml = "<font size=2 color=\"#003399\"><b>" + showname + "</b></font>";
                    aHTTP.InnerHtml = "<font size=2>HTTP</font>";
                    aDLL.InnerHtml = "<font size=2>普通DLL</font>";
                    aADLL.InnerHtml = "<font size=2>ActiveX DLL</font>";
                    aWebservice.InnerHtml = "<font size=2>Webservice</font>";
                    break;
                default:
                    showname = "Webservice";
                    aWebservice.InnerHtml = "<font size=2 color=\"#003399\"><b>" + showname + "</b></font>";
                    aHTTP.InnerHtml = "<font size=2>HTTP</font>";
                    aDLL.InnerHtml = "<font size=2>普通DLL</font>";
                    aADLL.InnerHtml = "<font size=2>ActiveX DLL</font>";
                    aData.InnerHtml = "<font size=2>数据库</font>";
                    break;
            }
            txtInterfaceName.Value = showname + "接口数据更新中...敬请期待！";
        }
    }
}
