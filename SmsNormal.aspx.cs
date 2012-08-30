﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace foofoof
{
    public partial class SmsNormal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtSmsmob.Text = "";
                txtSms.Text = "";
                txtsenduser.Text = "";
                labresult.Text = "<font color=#666699 size=2>已记录IP，请勿发送违法违规违德信息。</font>";
                if (Session["username"] != null && Session["username"].ToString().Trim() != "")
                {
                    hiddenUsername.Value = Session["username"].ToString();
                }
            }
        }

        /// <summary>
        /// 验证手机
        /// </summary>
        /// <param name="source"></param>
        /// <returns></returns>
        private bool IsMobile(string source)
        {
           return Regex.IsMatch(source, @"^1[358]\d{9}$", RegexOptions.IgnoreCase);
       }
        /// <summary>
        /// 验证是否中文
        /// </summary>
        /// <param name="source"></param>
        /// <returns></returns>
        private bool IsChinese(string source)
       {
           return Regex.IsMatch(source, @"^[\u4e00-\u9fa5]+$", RegexOptions.IgnoreCase);
       }

        protected void bntSendNote_Click(object sender, EventArgs e)
        {
            try
            {
                if (GetTodayMessageCountTotal() > (Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["AllEverdayMaxMobileNum"]) - 1))
                {
                    labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>今日短信发送用户已饱和!</b></font><br><font size=2  color=#666699>(请明日再来发送短信)</font>";
                    return;
                }
                if (GetTodayMessageCount() > (Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["PCEverdayMaxMobileNum"]) - 1))
                {
                    labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>一台电脑每日最多可发送" + System.Configuration.ConfigurationManager.AppSettings["PCEverdayMaxMobileNum"].ToString() + "条短信。</b></font><br><font size=2  color=#666699>(不区分用户)</font>";
                    return;
                }
                if (txtSmsmob.Text.Trim() == "")
                {
                    labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>手机号码不能为空！</b></font>";
                    txtSmsmob.Focus();
                    return;
                }
                if (!IsMobile(txtSmsmob.Text.Trim()))
                {
                    labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>输入手机号码格式有误！</b></font>";
                    txtSmsmob.Focus();
                    return;
                }
                if (txtSms.Text.Trim() == "")
                {
                    labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>短信内容不能为空！</b></font>";
                    txtSms.Focus();
                    return;
                }
                if ( txtSms.Text.Trim().Length > 60)
                {
                    labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>短信内容须60字以内(含标点符号)！</b></font>";
                    txtSms.Focus();
                    return;
                }
                if (txtsenduser.Text.Trim() == "")
                {
                    labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>发送者姓名不能为空！</b></font>";
                    txtsenduser.Focus();
                    return;
                }
                if (!IsChinese(txtsenduser.Text.Trim()))
                {
                    labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>发送者姓名须是中文格式！</b></font>";
                    txtsenduser.Focus();
                    return;
                }
                
                string userid = "monkeytree";
                string password = "800108winic";
                string username = txtsenduser.Text.Trim();
                SmsService.Service1 ws = new SmsService.Service1();
                string result = ws.SendMessages(userid, password, txtSmsmob.Text.Trim(), txtSms.Text.Trim() + "--" + txtsenduser.Text.Trim() + "", "");
                if (result.IndexOf("-") > -1)
                {
                    labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>发送失败！</b><br><font color=#666699  size=2>失败原因：" + GetErrorInfo(result);
                }
                else
                {
                    string conStr = System.Configuration.ConfigurationManager.AppSettings["ConnectionStr"].ToString();
                    string sql = "update wetuo_Users set MessageCount=MessageCount+1,MessgaeDate=getdate() where username='" + username + "'";
                    sql = sql + "  insert into wetuo_UserMobileMessages" +
                                    " (UserName,ToMobileNo,MobileMessage,FromName,SendDateTime,UserIP)" +
                                    " values" +
                                    " ('" + username + "','" + txtSmsmob.Text.Trim() + "','" + txtSms.Text.Trim() + "','" + txtsenduser.Text.Trim() + "',getdate(),'" + Request.ServerVariables.Get("Remote_Addr").ToString().Trim() + "')";
                    int value = 0;
                    using (SqlConnection conn = new SqlConnection(conStr))
                    {
                        conn.Open();
                        SqlCommand cmd = conn.CreateCommand();
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = sql;
                        value = cmd.ExecuteNonQuery();
                    }
                    if (value > 0)
                    {
                        labresult.Text = "<font color=#666699 size=2>提示：</font><font color=green size=2><b>发送成功！</b></font>";
                        txtSmsmob.Text = "";
                    }
                    else
                    {
                        labresult.Text = "<font color=#666699 size=2>提示：</font><font color=green size=2><b>发送成功！</b></font><font color=#666699  size=2>(未记录)</font>";
                        txtSmsmob.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                labresult.Text = "<font color=#666699 size=2>提示：</font><font color=red size=2><b>短信发送异常！</b><br><font color=#666699  size=2>可尝试减短短信长度重新发送。</font>";
            }
        }


        private int GetTodayMessageCountTotal()
        {
            string conStr = System.Configuration.ConfigurationManager.AppSettings["ConnectionStr"].ToString();
            string sql = "select count(id) from wetuo_UserMobileMessages where CONVERT(varchar(12) , SendDateTime, 112 )='" + DateTime.Now.ToString("yyyyMMdd") + "'";
            int messagecount = 0;
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                messagecount = (int)cmd.ExecuteScalar();
            }
            return messagecount;
        }

        private int GetTodayMessageCount()
        {
            string conStr = System.Configuration.ConfigurationManager.AppSettings["ConnectionStr"].ToString();
            string sql = "select count(id) from wetuo_UserMobileMessages where CONVERT(varchar(12) , SendDateTime, 112 )='" + DateTime.Now.ToString("yyyyMMdd") + "' and  UserIP='" + Request.ServerVariables.Get("Remote_Addr").ToString().Trim() + "'";
            int messagecount = 0;
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sql;
                messagecount = (int)cmd.ExecuteScalar();
            }
            return messagecount;
        }


        private string GetErrorInfo(string code)
        {
            string errorinfo = "";
            switch (code)
            {
                case "-01":
                    errorinfo = "当前账号余额不足";
                    break;
                case "-02":
                    errorinfo = "当前用户ID错误！";
                    break;
                case "-03":
                    errorinfo = "当前密码错误！";
                    break;
                case "-04":
                    errorinfo = "参数内容类型错误！";
                    break;
                case "-05":
                    errorinfo = "手机号码格式不对！";
                    break;
                case "-06":
                    errorinfo = "短信内容编码不对！";
                    break;
                case "-07":
                    errorinfo = "短信含有敏感字符!";
                    break;
                case "-08":
                    errorinfo = "无接收数据！";
                    break;
                case "-09":
                    errorinfo = "系统维护中！";
                    break;
                case "-10":
                    errorinfo = "手机号码数量超长！";
                    break;
                case "-11":
                    errorinfo = "短信内容超长！";
                    break;
                case "-12":
                    errorinfo = "其它错误！";
                    break;
                default:
                    errorinfo = code;
                    break;
            }
            return errorinfo;
        }
    }
}
