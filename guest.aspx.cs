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
using System.IO;
using System.Drawing;
public partial class guest : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
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
            if (!IsPostBack)
            {
                this.Label1.Text = "欢迎管理员：" + Encryption.Decode(Session["issuper"]);
                footerload();
                bind();
            }
        }
     }
 

    protected void btnBaphoto_click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("adminweb.aspx");
    }
    protected void btnBack_click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("adminweb.aspx");
    }
    protected void btnLogout_click(object sender, ImageClickEventArgs e)
    {
        Session["issuper"] = null;
        Session["suadmin"] = null;
        Response.Write("<script type='text/javascript'>window.location.href='Default.aspx';</script>");
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
    //自定义更新
    protected void gvguest_RowUpd(object sender, GridViewUpdateEventArgs e)
    {
        TextBox tb=gvguest.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
        TextBox tb2=gvguest.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
        CheckBox cb = gvguest.Rows[e.RowIndex].FindControl("CheckBox1") as CheckBox;
         int locker;
        if (cb.Checked)
        {
            locker = 1;
        }
        else
        {
            locker = 0;
        }
        string name=Encryption.Encode(tb.Text.Trim());
        string mail=Encryption.Encode(tb2.Text.Trim());
        int guid=Convert.ToInt32(gvguest.DataKeys[e.RowIndex].Value);
        if(ckguest(guid,name,mail))
        {
          string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
          SqlConnection conur = new SqlConnection(connectionString);
          string delur = "update Guest set gname='" + @name + "',gmail='"+@mail+"',gflag='" + @locker + "' where guid='" + @guid + "'";
          SqlCommand cmdu = new SqlCommand(delur, conur);
          conur.Open();
          cmdu.ExecuteNonQuery();
          conur.Close();
          Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('更新成功！');</script>");
          bind();
          gvguest.EditIndex = -1;                  
          }
        bind();
    }
    //检查
    protected bool ckguest(int guid,string name, string mail)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string st = "select * from Guest where (gname='" + @name + "' or gmail='" + @mail + "') and guid<>'"+@guid+"'";
        cnn.Open();
        SqlCommand cmd = new SqlCommand(st, cnn);
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.Read())
        {         
            cnn.Close();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('信息已存在！');</script>");
            return false;
        }
        else
        {
            cnn.Close();
           return true;
        }

    }
    //绑定
    private void bind()
    {
        string bdsql = "select *,ROW_NUMBER()OVER (order by guid) AS rowsid from Guest where guid<>19 and guid<>39 and guid<>42";
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection conur = new SqlConnection(connectionString);
        SqlDataAdapter cmdu = new SqlDataAdapter(bdsql, conur);
        DataSet myds = new DataSet();
        conur.Open();
        cmdu.Fill(myds, "Guest");
        gvguest.DataSource = myds;
        gvguest.DataKeyNames = new string[] { "guid" };
        gvguest.DataBind();
        conur.Close();
    }
    protected void gvguest_RowEdt(object sender, GridViewEditEventArgs e)
    {
        gvguest.EditIndex = e.NewEditIndex;
        bind();
    }
    protected void gvguest_OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvguest.PageIndex = e.NewPageIndex;
        bind();
    }
}