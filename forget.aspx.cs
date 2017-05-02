using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net.Mail;


public partial class forget: System.Web.UI.Page
{
	//载入
    protected void Page_Load(object sender, EventArgs e)
    {
        footerload();
    }
    protected void btnpwdfg_Click(object sender, ImageClickEventArgs e)//用户名确认
    {
        yhm.Text = yhm.Text.Replace(" ", "");
        string txtname = yhm.Text;
        ylyx.Text = ylyx.Text.Replace(" ", "");
        string txtmail = ylyx.Text;
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        //未输入
        if (txtname == ""||txtmail=="")
        {
            aptips.InnerText = "请输入用户名和邮箱！ ";            
        }
        //已经输入
        else
        {
            Session["fgpwd"] = Encryption.Encode(txtname);
            string cname = Encryption.Encode(txtname);
            string cmail= Encryption.Encode(txtmail);
            string st1="select adname from Admin where adname='" + @cname + "'and admail='"+@cmail+"'";
            cnn.Open();
            SqlCommand cmd1=new SqlCommand(st1,cnn);
            SqlDataReader reader1 = cmd1.ExecuteReader();
            if (reader1.Read())//数据库有用户名
            {
                cnn.Close();
                string st2 = "select id from Admin where code is null and adname='" + @cname + "'";
                cnn.Open();
                SqlCommand cmd2 = new SqlCommand(st2, cnn);
                SqlDataReader reader2 = cmd2.ExecuteReader();
                if (reader2.Read())//用户名对应的验证码为空
                {
                    cnn.Close();
                    string flag = Rdom();//生成验证码
                    string st6 = "select * from Admin where code='" + @flag + "'";
                    SqlCommand cmd6 = new SqlCommand(st6, cnn);
                    cnn.Open();
                    SqlDataReader read6 = cmd6.ExecuteReader();
                    if (read6.Read())//避免验证码重复
                    {
                        flag=Rdom();
                    }
                    else
                    {
                        cnn.Close();
                        string st3 = "update Admin set code='" + @flag + "' where adname='" + @cname + "'";
                        cnn.Open();
                        SqlCommand cmd3 = new SqlCommand(st3, cnn);
                        cmd3.ExecuteNonQuery();
                        sendmail(txtmail, flag);//发送验证邮件
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('验证码已发送至你的邮箱，请登录邮箱进行验证！');window.location.href='adminlogin.aspx';</script>");
                        cnn.Close();
                    }
                }
                else
                {
                    cnn.Close();
                    this.divforget.Visible = false;
                    this.divcode.Visible = true;
                }

            }
            else
            {
                cnn.Close();
                aptips.InnerText = "请检查你的输入信息！ "; 
            }
        }
        
    }
    //清除按钮
    protected void btnReset1_click(object sender, ImageClickEventArgs e)
    {
        yhm.Text = "";
        aptips.InnerText = "";

    }

    protected void btnReset2_click(object sender, ImageClickEventArgs e)
    {
        newpwd.Text = "";
        newconf.Text = "";
        aptips2.InnerText = "";
    }
    protected void btnReset3_click(object sender, ImageClickEventArgs e)
    {
        txtcode.Text = "";
        aptips3.InnerText = "";
    }

    protected void btnpwdr_Click(object sender, ImageClickEventArgs e)//密码重置阶段
    {
        string newpwd = this.newpwd.Text;
        string conf = this.newconf.Text;
        if (newpwd == "")
        {
            aptips2.InnerText = "请输入新密码！";

        }
        else if (conf == "")
        {
            aptips2.InnerText = "请确认新密码！";


        }
        else if (newpwd != conf)
        {
            aptips2.InnerText = "两次输入的新密码不一致！";


        }
        else
        {
            string confs = Encryption.Auth(conf);
            string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);
            string st = "update Admin set adpwd='" + @confs + "',code=null where adname='" + Session["fgpwd"] + "'";
            cnn.Open();
            SqlCommand cmd = new SqlCommand(st, cnn);
            cmd.ExecuteNonQuery();
            cnn.Close();
            Response.Write("<script type='text/javascript'>alert('设置成功,请重新登录！');window.location.href='adminlogin.aspx';</script>");
          
        }
    }
    protected void btnrescode_Click(object sender, ImageClickEventArgs e)//验证码
    {
        this.txtcode.Text = this.txtcode.Text.Replace(" ", "");
        string txtcode = this.txtcode.Text;
        if (txtcode == "")
        {
            aptips3.InnerText = "请输入验证码！";
        }
        else
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);
            string st4 = "select id from Admin where code='" + @txtcode + "'";
            cnn.Open();
            SqlCommand cmd4 = new SqlCommand(st4, cnn);
            SqlDataReader reader4 = cmd4.ExecuteReader();
            if (reader4.Read())//如果验证码相同
            {
                cnn.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('验证成功！');</script>");
                this.divcode.Visible = false;
                this.divreset.Visible = true;

            }
            else
            {
                cnn.Close();
                aptips3.InnerText = "验证码错误，请重试！";
            }
        }

    }
   
    protected string Rdom()
    {
        Random rd = new Random();
        string str = "0123456789";
        string result = "";
        for (int i = 0; i < 6; i++)
        {
            result += str[rd.Next(str.Length)];
        }
        return result;
    }

        protected void btnBack_click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("adminlogin.aspx");
    }
        protected void footerload()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);
            string st = "select * from Class where classid=7";
            cnn.Open();
            SqlCommand cmd = new SqlCommand(st, cnn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                this.Label3.Text = Server.HtmlDecode(rdr["content"].ToString());
                cnn.Close();
            }
        }
    //发送邮件
        protected void sendmail(string tomail,string code)
        {
            MailAddress MessageFrom = new MailAddress("admin@lijun0772.com"); //发件人邮箱地址 
            string MessageTo = tomail; //收件人邮箱地址 
            string MessageSubject = "丽军数码-重置密码"; //邮件主题 
            string MessageBody = "你在尝试重置密码，请将验证码：<strong>"+code+"</strong>&nbsp;&nbsp;&nbsp;&nbsp;填入以下网址完成确认：<a href=\"http://lijun0772.com/forget.aspx \" target=\"_blank\">点此确认 </a>。"; //邮件内容 

            if (Send(MessageFrom, MessageTo, MessageSubject, MessageBody))
            {
                Response.Write("发送邮件成功");
            }
            else
            {
                Response.Write("发送邮件失败");
            }
        }
    //发送邮件函数
        public bool Send(MailAddress MessageFrom, string MessageTo, string MessageSubject, string MessageBody)
        {
            MailMessage message = new MailMessage();

            // if (FileUpload1.PostedFile.FileName != "")
            // {
            // Attachment att = new Attachment("d://test.txt");//发送附件的内容
            //    message.Attachments.Add(att);
            // }

            message.From = MessageFrom;
            message.To.Add(MessageTo); //收件人邮箱地址可以是多个以实现群发 
            message.Subject = MessageSubject;
            message.Body = MessageBody;
            //message.Attachments.Add(objMailAttachment);
            message.IsBodyHtml = true; //是否为html格式 
            message.Priority = MailPriority.High; //发送邮件的优先等级 

            SmtpClient sc = new SmtpClient();
            sc.Host = "smtp.mxhichina.com"; //指定发送邮件的服务器地址或IP 
            sc.Port = 25; //指定发送邮件端口 
            sc.Credentials = new System.Net.NetworkCredential("admin@lijun0772.com", "m10669588"); //指定登录服务器的用户名和密码(发件人的邮箱登陆密码)

            try
            {
                sc.Send(message); //发送邮件 
            }
            catch
            {
                return false;
            }
            return true;

        }
}
