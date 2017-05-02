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


public partial class cntmgr : System.Web.UI.Page
{
    //载入
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["issuper"] == null || Session["ispwd"] == null)
            {
                Response.Write("<script type='text/javascript'>alert('登录超时！');window.location.href='Default.aspx';</script>");
            }
            else if (WebHelp.Auth(Session["issuper"].ToString(), Session["ispwd"].ToString()) == false)
            {
                Response.Write("<script type='text/javascript'>alert('登录超时！');window.location.href='Default.aspx';</script>");
            }

            else
            {
                this.Label1.Text = "欢迎管理员：" + Encryption.Decode(Session["issuper"]);
                footerload();
                bind();
            }
        }

    }
    protected void btnLogout_click(object sender, ImageClickEventArgs e)
    {
        Session["issuper"] = null;
        Session["suadmin"] = null;
        Response.Write("<script type='text/javascript'>window.location.href='Default.aspx';</script>");

    }
    protected void btnBack_click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("adminweb.aspx");
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
     //缩短
     public string SubStr(object caption, int nLeng)
     {
         string sString = caption.ToString().Trim();
         if (sString.Length <= nLeng)
         {
             return sString;
         }
         else
         {
             string sNewStr = sString.Substring(0, nLeng);
             sNewStr = sNewStr + "..."; return sNewStr;
         }
     }
   //绑定总开关
     private void bind()
     {
         string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
         SqlConnection cnn = new SqlConnection(connectionString);
         string st = "select top 1 * from Auth";
         cnn.Open();
         SqlCommand cmd = new SqlCommand(st, cnn);
         SqlDataReader rdr = cmd.ExecuteReader();
         if (rdr.Read())
         {
             if (rdr["comment"].ToString() == "True" && rdr["mess"].ToString() == "True")
             {
                 ibtnc.ImageUrl = "~/imgs/off.gif";
                 ibtnc.ToolTip = "点击打开";
                 ibtnm.ImageUrl = "~/imgs/off.gif";
                 ibtnm.ToolTip = "点击打开";
             }
             else if (rdr["comment"].ToString() == "False" && rdr["mess"].ToString() == "False")
             {
                 ibtnc.ImageUrl = "~/imgs/on.gif";
                 ibtnc.ToolTip = "点击关闭";
                 ibtnm.ImageUrl = "~/imgs/on.gif";
                 ibtnm.ToolTip = "点击关闭";
             }
             else if (rdr["comment"].ToString() == "False" && rdr["mess"].ToString() == "True")
             {
                 ibtnc.ImageUrl = "~/imgs/on.gif";
                 ibtnc.ToolTip = "点击关闭";
                 ibtnm.ImageUrl = "~/imgs/off.gif";
                 ibtnm.ToolTip = "点击打开";
             }
             else if (rdr["comment"].ToString() == "True" && rdr["mess"].ToString() == "False")
             {
                 ibtnc.ImageUrl = "~/imgs/off.gif";
                 ibtnc.ToolTip = "点击打开";
                 ibtnm.ImageUrl = "~/imgs/on.gif";
                 ibtnm.ToolTip = "点击关闭";
             }
             cnn.Close();
         }
     }
     protected void ibtnc_Click(object sender, ImageClickEventArgs e)
     {
         string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
         SqlConnection cnn = new SqlConnection(connectionString);
         cnn.Open();
         int i;
         if (ibtnc.ToolTip == "点击关闭")
         {
              i = 1;
         }
         else
         {
             i = 0;
         }        
         string st = "update Auth set comment='"+@i+"' ";
         SqlCommand cmd = new SqlCommand(st, cnn);
         SqlDataReader rdr = cmd.ExecuteReader();
         cnn.Close();
         bind();
     }
     protected void ibtnm_Click(object sender, ImageClickEventArgs e)
     {
         string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
         SqlConnection cnn = new SqlConnection(connectionString);
         cnn.Open();
         int i;
         if (ibtnm.ToolTip == "点击关闭")
         {
             i = 1;
         }
         else
         {
             i = 0;
         }
         string st = "update Auth set mess='" + @i + "' ";
         SqlCommand cmd = new SqlCommand(st, cnn);
         SqlDataReader rdr = cmd.ExecuteReader();
         cnn.Close();
         bind();
     }
}
