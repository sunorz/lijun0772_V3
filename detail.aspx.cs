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

public partial class detail: System.Web.UI.Page
{
protected void Page_Load(object sender, EventArgs e)

{
reply.Visible = false;
if (!IsPostBack)
{
getnews();
string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
SqlConnection cnn = new SqlConnection(connectionString);
string newid = Request.QueryString["id"];
string st = "select * from Article where artid='" + @newid+ "'";
cnn.Open();
SqlCommand cmd = new SqlCommand(st, cnn);
SqlDataReader rdr = cmd.ExecuteReader();
if (!rdr.Read())//���idδ������ߴ���
{
commpo.Visible = false;
share.Visible = false;
Label1.Visible = true;
btngood.Visible = false;
cnn.Close();
Label5.Visible = false;
banner.Visible = false;
}
else
{
bind2();
bind1();
authcom();
showgood();
cnn.Close();
txtcomment.Attributes.Add("Value", "�벻Ҫ�������������˽���˺�����ȣ������ݣ�лл��");
txtcomment.Attributes.Add("OnFocus", "if(this.value=='�벻Ҫ�������������˽���˺�����ȣ������ݣ�лл��'){this.value=''}");
txtcomment.Attributes.Add("OnBlur", "if(this.value==''){this.value='�벻Ҫ�������������˽���˺�����ȣ������ݣ�лл��'}");
}
showfoot();

}
}
//�޵�ʵ�ַ���
protected void btngood_Click(object sender, ImageClickEventArgs e)
{
    string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
    SqlConnection cnn = new SqlConnection(connectionString);
    string newid = Request.QueryString["id"];
    string st = "update Article set good=good+1 where artid='" + @newid + "'";
    cnn.Open();
    SqlCommand cmd = new SqlCommand(st, cnn);
    cmd.ExecuteNonQuery();
    cnn.Close();
    Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('лл֧�֣�');</script>");
    showgood();
}

protected void btnPost_Click(object sender, EventArgs e)
{

string comment = txtcomment.Text.ToString().Trim();
string cmail = txtmail.Text.ToString().Trim();
string coname = txtname.Text.ToString().Trim();

coname = Encryption.Encode(coname);
cmail = Encryption.Encode(cmail);
comment = Encryption.Encode(comment);

ckuser(coname, cmail);
string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
SqlConnection cnn = new SqlConnection(connectionString);
string newid = Request.QueryString["id"];
DateTime dt = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "China Standard Time");//ת������               
string st2 = "select * from Guest where gname='" + @coname + "' and gmail='" + @cmail + "' and gflag=0";
cnn.Open();
SqlCommand cmd2 = new SqlCommand(st2, cnn);
SqlDataReader rdrr = cmd2.ExecuteReader();
if (rdrr.Read())
{
int fids = getfloors();
int gid = Convert.ToInt32(rdrr["guid"]);
cnn.Close();
string st = "";
if (lbif.Visible == true)
{
st = "insert into Comment (aid,gid,comment,cposttime,fid) values('" + @newid + "','" + @gid + "','" + @comment + "','" + @dt + "','" + @fids + "')";
}
else
{
int repid = Convert.ToInt32(ddlfloors.SelectedValue);
st = "insert into Comment (aid,gid,repid,comment,cposttime,fid) values('" + @newid + "','" + @gid + "','" + @repid + "','" + @comment + "','" + @dt + "','" + @fids + "')";
}
SqlCommand cmd = new SqlCommand(st, cnn);
cnn.Open();
cmd.ExecuteNonQuery();
Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('�ظ��ɹ���');window.location.href=window.location.href; </script>");
bind1();
cnn.Close();
}
else
{
cnn.Close();
Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('�����ַ���ǳƲ�ƥ�䣡');window.location.href=window.location.href; </script>");

}



}
protected void btnReset_Click(object sender, EventArgs e)
{
txtname.Text = "";
txtmail.Text="";
txtcomment.Text="";
}

protected void btnBack_click(object sender, ImageClickEventArgs e)
{
Response.Redirect("bbs.aspx");
}
protected void showfoot()
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
}
cnn.Close();
}
protected void showgood()//��ȡ�޵�����
{
string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
SqlConnection cnn = new SqlConnection(connectionString);
string newid = Request.QueryString["id"];
string st = "select * from Article where artid='" + @newid + "'";
cnn.Open();
SqlCommand cmd = new SqlCommand(st, cnn);
SqlDataReader rdr = cmd.ExecuteReader();
if (rdr.Read())
{
this.Label4.Text = rdr["good"].ToString();
}
cnn.Close();
}
protected void bind1()
{
string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
SqlConnection cnn = new SqlConnection(connectionString);
string newid = Request.QueryString["id"];
//��������ѯ����в�ѯ
string st = "Select  a.fid,a.gname,rfid,rname,comment,cposttime,a.comid,cflag from (Select * from Comment,Guest where Comment.gid=Guest.guid and aid='" + @newid + "' ) as a left join (Select comid,fid as rfid,gname as rname,repid from Comment,Guest where Comment.gid=Guest.guid and comid in (Select repid from Comment)) as b on a.repid=b.comid order by a.comid";
cnn.Open();
SqlDataAdapter da = new SqlDataAdapter(st, cnn);
DataSet ds = new DataSet();
da.Fill(ds);
DataColumn col=ds.Tables[0].Columns.Add("state",typeof(bool));//�Զ�����state���ж�reply�Ƿ�Ϊ�գ���Datalist�еġ��ظ�����
for (int k = 0; k < ds.Tables[0].Rows.Count; k++)//����DataTable�����Զ����state�и�ֵ
{
for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
{
if (ds.Tables[0].Rows[k]["rfid"].ToString().Trim() == "")
{
ds.Tables[0].Rows[k]["state"] = false;//���
}
else
{
ds.Tables[0].Rows[k]["state"] =true;
}
}
}

ds.AcceptChanges();//�������
dlcom.DataSource = ds;
dlcom.DataBind();
if (dlcom.Items.Count == 0)
{
Label5.Visible = false;
}
ds.Clear();
cnn.Close();      
}
protected void bind2()
{
string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
SqlConnection cnn = new SqlConnection(connectionString);
string newid = Request.QueryString["id"];
string st = "select * from Article where artid='" + @newid + "'";
SqlDataAdapter da = new SqlDataAdapter(st, cnn);
DataSet ds = new DataSet();
da.Fill(ds);        
fvtxt.DataSource = ds;
fvtxt.DataBind();
if (ds.Tables[0].Rows[0]["comon"].ToString() == "True")
{
ImageButton ibtn = fvtxt.FindControl("btnRly") as ImageButton;
ibtn.Visible = false;
dlcom.Enabled = false;
}
ds.Clear();
cnn.Close();
}

//����
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
protected void getnews()//������ʾ��һƪ����һƪ����
{
int newsid = Convert.ToInt32(Request.QueryString["id"]);
string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
SqlConnection cnn = new SqlConnection(connectionString);
string st = "select top 1 * from Article where artid<" + @newsid + " order by artid desc";
string st2 = "select top 1 *  from  Article  where artid>" + @newsid + " order by artid"; 
cnn.Open();
SqlCommand cmd = new SqlCommand(st, cnn);
SqlCommand cmd2 = new SqlCommand(st2, cnn);
SqlDataReader rdr = cmd.ExecuteReader();
if (rdr.Read())
{
hlpre.Text = rdr["artitle"].ToString();
hlpre.Enabled = true;
hlpre.NavigateUrl = "detail.aspx?id=" + rdr["artid"].ToString();
cnn.Close();
}
else
{
hlpre.Font.Underline = false;
cnn.Close();
}
cnn.Open();
SqlDataReader rdr2 = cmd2.ExecuteReader();
if (rdr2.Read())
{
hlnext.Text = rdr2["artitle"].ToString();
hlnext.Enabled = true;
hlnext.NavigateUrl = "detail.aspx?id=" + rdr2["artid"].ToString();
cnn.Close();
}
else
{
hlnext.Font.Underline = false;
cnn.Close();
}

}
//����û�
protected void ckuser(string name, string mail)
{
string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
SqlConnection cnn = new SqlConnection(connectionString);
string st = "select * from Guest where gname='" + @name + "' or gmail='" + @mail + "'";
cnn.Open();
SqlCommand cmd = new SqlCommand(st, cnn);
SqlDataReader rdr = cmd.ExecuteReader();
if (rdr.Read())
{
if (rdr["gflag"].ToString() == "True")
{
cnn.Close();
Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('���ѱ�����Ա���ԣ�');window.location.href=window.location.href; </script>");
}
else
{
cnn.Close();
}
}
else
{
cnn.Close();
cnn.Open();
string st2 = "insert into Guest(gname,gmail) values('" + @name + "','" + @mail + "')";
SqlCommand cmd2 = new SqlCommand(st2, cnn);
cmd2.ExecuteNonQuery();
cnn.Close();
}

}
//���»ظ�
protected void btnRly_Click(object sender, ImageClickEventArgs e)
{
reply.Visible = true;
lbif.Visible = true;
lbr1.Visible = false;
lbr2.Visible = false;
ddlfloors.Visible = false;
}
//¥��ظ�
protected void btnR_Click(object sender, EventArgs e)
{
reply.Visible = true;
lbif.Visible = false;
lbr1.Visible = true;
lbr2.Visible = true;
ddlfloors.Visible = true;
Button btn = sender as Button;
ddlfloors.Text = btn.CommandArgument.ToString();
int newsid = Convert.ToInt32(Request.QueryString["id"]);
}   


//��ȡ¥��
protected int getfloors()
{
int newsid = Convert.ToInt32(Request.QueryString["id"]);
string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
SqlConnection cnn = new SqlConnection(connectionString);
string st = "SELECT COUNT(comid) AS floors FROM Comment WHERE aid='"+@newsid+"'";
cnn.Open();
SqlCommand cmd = new SqlCommand(st, cnn);
SqlDataReader rdr = cmd.ExecuteReader();
if (rdr.Read())
{
int fids = Convert.ToInt32(rdr["floors"]);
cnn.Close();
return fids+1;
}
else
{
cnn.Close();
return 0;
}
}
//�رջظ����
protected void ibtnclose_Click(object sender, ImageClickEventArgs e)
{
Page_Load(sender, e);
}
protected void authcom()
{
string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
SqlConnection cnn = new SqlConnection(connectionString);
string st = "SELECT * from Auth";
cnn.Open();
SqlCommand cmd = new SqlCommand(st, cnn);
SqlDataReader rdr = cmd.ExecuteReader();
if (rdr.Read())
{
if (rdr["comment"].ToString() == "True")
{
ImageButton ibtn = fvtxt.FindControl("btnRly") as ImageButton;
ibtn.Visible = false;
dlcom.Enabled = false;
}
cnn.Close();
}
else
{
cnn.Close();
}
}
public string OutputByLine(object caption)//ͨ���趨��������ҳ 
{
string strContent = caption.ToString().Trim();
int pageSize = int.Parse(ConfigurationManager.AppSettings["pageSize"]);//ÿҳ��ʾ������CONFIG�ļ���ȡ�� 
string lineBreak = ConfigurationManager.AppSettings["lineBreak"];//���з���CONFIG�ļ���ȡ�� 
strContent = strContent.Replace("\r\n", "");
string[] strLined = strContent.Split(new string[] { lineBreak }, StringSplitOptions.RemoveEmptyEntries);//��DIVΪ���з� 
int pageCount = strLined.Length / pageSize;
int pageCountPlus = strLined.Length % pageSize == 0 ? 0 : 1;//����ҳ 
pageCount = pageCount + pageCountPlus;//��ҳ�� 
int currentPage = 1;//��ǰҳ�� 
string displayText = null;
string epage = Request.QueryString["page"];
if (epage != null) //��ȡ��ҳҳ�� 
{
if (epage.Trim() == "")        //������
{
currentPage = 1;
}
else
{
currentPage = Convert.ToInt32(epage);
if (currentPage < 1 || currentPage > pageCount)
{
currentPage = 1;
}
}
}
else
{
currentPage = 1;
}
string pageInfo = "";//ҳ����Ϣ 
for (int i = 1; i < pageCount + 1; i++)
{
if (i == currentPage)
{
pageInfo += "<span>" + i + "</span>";
pageInfo = "<div class='pager'>" + pageInfo + "<div>";
}
else
{
string newsid = Request.QueryString["id"];
pageInfo += "<a href=detail.aspx?" +"id="+newsid+"&page=" + i + ">" + i + "</a>";
pageInfo = "<div class='pager'>" + pageInfo + "<div>";
}
}
if (pageCount == 1)
{
labPageNumber.Visible = false;
}
labPageNumber.Text = pageInfo;
for (int i = (currentPage - 1) * pageSize; i < currentPage * pageSize && i < strLined.Length; i++)
{
displayText += "<div>" + strLined[i] + "</div>";
}
return displayText;
}

}
