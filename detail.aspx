<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" Debug="true"%>
<%@ Register src="gotop.ascx" tagname="gotop" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>��������-ά����̳</title>
         <style type="text/css">
            #title{
	line-height:5pt;
	font-family:"����";
	font-size:20pt;
    color:#ffffff;
    line-height:40pt;
	letter-spacing:8pt;
}
    body {
	background-image: url(imgs/class/bg5.jpg);
	background-repeat: repeat;
	background-attachment: fixed;
}

    a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
        .auto-style1 {
            background-color: #C0C0C0;
        }
            #leave
            {
                text-align: center;
            }
            .style2
            {
                font-size: small;
            }
            #reply
            { 
            border: 1px outset red;
                position:fixed; 
                z-index:999;
                 bottom:0px;
                 background-color:White;
                 right:0px;
                }
 .pager{ width:100%;  margin:10px; line-height:20px; display:block;}
.pager span { border:1px solid #F59223; margin: 0 5px; padding: 1px 6px; float:left;background-color:#F59223;color:White;}
.pager a {
    border: 1px solid #F59223;
    display: block;
    overflow:hidden;
    float: left;
    margin: 0 5px;
    padding: 1px 6px;  color:#F59223;
    background-color:White; 
}
.pager a:hover { border:1 solid #F59223; background-color:#F59223; color:White; margin: 0 5px; padding: 1px 6px; }
            .style3
            {
                text-align: left;padding:0 0 40px 40px;
                 
            }
            .style5
            {
                background-color: #FFFFEC;
            }
        </style>

        
</head>
<body>
<div id="apDiv2" class="toplnk"><uc1:gotop ID="gotop1" runat="server" /></div>
<script language="JavaScript" type="text/javascript">
var lang = navigator.language || navigator.userLanguage;
if(lang.substr(0, 3) == "zh-"){
document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>"); }
</script>
    <form id="form1" runat="server">    
<table width="1038" border="0" align="center" cellpadding="0" cellspacing="0" class="layoute">
    <tr>
    <td height="49px" valign="middle" class="foote"><img src="imgs/logo.gif" width="100px" height="49px"  border="0"/>����������Ӱ����ά������<div style="position:absolute; right:20px; bottom:16px;"><a href="showsea.aspx" title="�������"><img src="imgs/search.gif" width="40" height="48" border="0" /></a></div></td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>  
  <tr>
  <td height="20"><table align="center" cellspacing="0" width="1035px">
      <tr>
     <td align="center" valign="middle" class="topbar"><a href="Default.aspx"  class="ht">��վ��ҳ</a></td>
    <td align="center" valign="middle" class="topbar"><a href="show.aspx"  class="ht">���չʾ</a></td>
    <td align="center" valign="middle" class="topbar"><a href="error.aspx"  class="ht">��������</a></td>
    <td align="center" valign="middle" class="topbar"><a href="fix.aspx"  class="ht">��������</a></td>
    <td  align="center" valign="middle" class="ht" bgcolor="#E96800">ά����̳</td>
    <td  align="center" valign="middle" class="topbar"><a href="shop.aspx" class="ht">�������</a></td>
   <td  align="center" valign="middle" class="topbar"> <a href="staff.aspx" class="ht">�˲���Ƹ</a></td>
    <td  align="center" valign="middle" class="topbar"><a href="messages.aspx" class="ht">��������</a></td>
    <td   align="center" valign="middle" class="topbar"><a href="connect.aspx" class="ht">��ϵ����</a></td>
      </tr>
      </table>
      </td>
    
  </tr>  
  <tr>
    <td colspan="9" align="center" valign="middle" cellpadding="0">
<table width="100%" border="0" cellspacing="0" cellpadding="12">
      <tr>
        <td colspan="9" align="middle" valign="middle"><a href="bbs.aspx" title="��̳��ҳ"><img src="imgs/class/img5.gif" width="200" height="194" border="0" /></a>          <div id="title" runat="server">
            ά����̳</div></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FFFFFF" style="background-color: #FFFFEC"><asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/imgs/back.gif" Height="32" Width="32" title="����" OnClick="btnBack_click"/></td>
          </tr>
          <tr>
            <td colspan="2" align="center" valign="top" bgcolor="#FFFFEC"><div id="banner" runat="server" style="font-size: 0.9em">
                ��һƪ��<asp:HyperLink 
                    ID="hlpre" runat="server" Enabled="False">û����һƪ�ˡ�</asp:HyperLink>
                &nbsp;&nbsp;��һƪ��<asp:HyperLink ID="hlnext" runat="server" Enabled="False">û����һƪ�ˡ�</asp:HyperLink>
                </div>
                <span class="contents"><asp:Label ID="Label1" runat="server" Text="���²����ڻ��ѱ�ɾ����" Visible="False"></asp:Label><span class="contents"> <br />
                <asp:Label ID="lbif" runat="server" Text=""></asp:Label>
                <asp:FormView ID="fvtxt" runat="server" DataKeyNames="artid" 
                      Width="100%" style="text-align: left" >
                    <EditItemTemplate>                       
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        &nbsp;<p style="text-align:right"><asp:Label ID="artidLabel" runat="server" Text='<%# Eval("artid") %>' 
                            Visible="False" style="text-align: right" />
                            <asp:ImageButton ID="btnRly" ToolTip="�ظ�����" 
                                runat="server" ImageUrl="~/imgs/rebtn.gif" onclick="btnRly_Click" 
                               /></p>
                        <br />
                        <p align="center"><asp:Label ID="artitleLabel" runat="server" Text='<%# Eval("artitle") %>' 
                            Font-Bold="True" style="font-size: large" /></p>
                        <br />
                        <br />
                        <span class="bbsdel" style="color: #FF9424;font-size:small">����:</span>
                        <asp:Label ID="artmkrLabel" runat="server" Text='<%# Eval("artmkr") %>' 
                            Font-Size="Small" style="color: #FF7D23" />
                        &nbsp;&nbsp; <span class="bbsdel" style="color: #FF7D24; font-size:small">����ʱ�䣺</span>
                        <asp:Label ID="arttimeLabel" runat="server" Font-Size="Small" 
                            style="color: #FF7D23" Text='<%# Eval("arttime","{0:yyyy��M��d��}") %>'/>
                        <br />
                        <span class="bbsdel"><asp:Label ID="artcntLabel" runat="server" Text='<%#OutputByLine(Eval("artcnt"))%>' /></asp:Label></span>
                        <br />
                        <br />
                        <br />
                        &nbsp;<br />
                    </ItemTemplate>
                </asp:FormView>
                <p id="share" runat ="server"><div class="bshare-custom"><div class="bsPromo bsPromo2"></div><a title="��������΢��" class="bshare-sinaminiblog"></a><a title="������Ѷ΢��" class="bshare-qqmb"></a><a title="����i����" class="bshare-itieba" href="javascript:void(0);"></a><a title="����Facebook" class="bshare-facebook" href="javascript:void(0);"></a><a title="����Twitter" class="bshare-twitter" href="javascript:void(0);"></a><a title="����ƽ̨" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count" style="float: none;"></span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=3&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script></p>
                <asp:Label ID="labPageNumber" runat="server"  Width=100% CssClass="txt3"
                ></asp:Label>
                </td>
          </tr>
          <tr>
            <td colspan="2" align="center" class="style5">
                                      <asp:ImageButton ID="btngood" runat="server" ImageUrl="~/imgs/good.jpg" 
                            OnClick="btngood_Click" title="��һ�£�" />
                        <asp:Label ID="Label4" runat="server" ForeColor="#FF7D23" Text=""></asp:Label></td>
          </tr>
          <tr>
            <td colspan="2" align="left" class="style5"><div id="commpo" runat="server">
               <div id="reply" runat="server" visible="False" class="style3"><p style="text-align:right">
                   <asp:ImageButton ID="ibtnclose" runat="server" ImageUrl="imgs/close.gif"  
                       ToolTip="�ر�" onclick="ibtnclose_Click" />&nbsp;&nbsp;
                   </p>
                   <div>
                    �ǳƣ� <asp:TextBox ID="txtname" runat="server" BackColor="Silver" CssClass="txt3" MaxLength="20"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtname" CssClass="aptips" 
                    ErrorMessage="�ǳƲ����Ϲ涨��" 
                    ValidationExpression="^[\u4E00-\u9FA5A\a-zA-Z][\u4E00-\u9FA5A-Za-z0-9]{3,15}$" Display="Dynamic"></asp:RegularExpressionValidator>
                       <br />
                <br />
                <span class="style2">�ǳ����ǳ��벻Ҫ�����ֿ�ͷ��������������ţ��ҿ��Ƴ�����4��16���ַ���</span>
                       <br />
                
                <br />                
                   ���䣺               <asp:TextBox ID="txtmail" runat="server" BackColor="Silver" CssClass="txt3" 
                    MaxLength="20"></asp:TextBox>
                   
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtmail" CssClass="aptips" ErrorMessage="�����ʽ����ȷ��" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <br class="txt3" />
                   ����ظ���
                  <asp:Label ID="lbr1" runat="server" Text="���ڻظ�" Visible="False"></asp:Label>
                   <asp:DropDownList ID="ddlfloors" runat="server" CssClass="txt3" BackColor="Silver"
                          DataTextField="fid" DataValueField="comid"
                       DataSourceID="SqlDataSource1" Visible="False"  Width="67px">
                   </asp:DropDownList>&nbsp;<asp:Label ID="lbr2" runat="server" Text="¥������" 
                       Visible="False"></asp:Label>                      
                   </div>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:lijunConnectionString %>"
                    
                       SelectCommand="SELECT [fid],[comid] FROM [Comment] WHERE ([aid] = @aid)" 
                       ProviderName="System.Data.SqlClient">
                       <SelectParameters>
                           <asp:QueryStringParameter Name="aid" QueryStringField="id" Type="Int32" />
                       </SelectParameters>
                </asp:SqlDataSource>
                   <div>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                       ControlToValidate="txtcomment" CssClass="aptips" ErrorMessage="����������Ҫ��" 
                       ValidationExpression="^[\s\S][\d\D]{3,139}$" Display="Dynamic"></asp:RegularExpressionValidator>
                   <br />
                <br />
  <asp:TextBox ID="txtcomment" runat="server" BackColor="Silver" CssClass="txt3" 
                    Height="150px" TextMode="MultiLine" Width="603px" MaxLength="3">�벻Ҫ�������������˽���˺�����ȣ������ݣ�лл��</asp:TextBox>
                <br />
                <br />
                 
                   <asp:Button ID="btnPost" runat="server" BackColor="#FF7D23" 
                    BorderColor="#FF7D23" BorderStyle="Solid" class="txt3" Font-Bold="True" 
                    ForeColor="White" OnClick="btnPost_Click" Text="�ظ�" Width="60px" />
                   &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnRest" runat="server" BackColor="#FF7D23" 
                    BorderColor="#FF7D23" BorderStyle="Solid" class="txt3" Font-Bold="True" 
                    ForeColor="White" OnClick="btnReset_Click" Text="ȡ��" Width="60px" 
                       UseSubmitBehavior="False" />
                   </div>
                </div>  
                <asp:Label ID="Label5" runat="server" Text="�����б�"></asp:Label>
                <br />
                <br />
                <asp:DataList ID="dlcom" runat="server" BackColor="LightGoldenrodYellow" 
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" 
                    ForeColor="Black" Width="100%" GridLines="Both" style="font-size: medium">
                    <FooterStyle BackColor="Tan" />
                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <ItemTemplate>
                          <asp:Label ID="floor"   runat="server" Text='<%#Eval("fid","{0}¥")%>'></asp:Label>
                         &nbsp;<asp:Label 
                              ID="commentLabel" runat="server" Text='<%#Encryption.Decode(Eval("gname") )%>' 
                              style="color: #FF7D23"  />
                          <asp:Label ID="Label7" runat="server"  Text="�ظ�" 
                              Visible='<%# Eval("state") %>'></asp:Label>
                          <asp:Label ID="Label2" runat="server"  Text='<%# Eval("rfid","{0}¥") %>' ></asp:Label>
                          &nbsp;
                         <br />
                          &nbsp;<br />
                          &nbsp;&nbsp;&nbsp; <asp:Label ID="Label6" runat="server" Text='<%#Encryption.Decode(Eval("comment")) %>' ></asp:Label>
                          <br />
                        <br /><br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;ʱ��:<asp:Label ID="cposttimeLabel" runat="server" 
                            Text='<%# Eval("cposttime","{0:yyyy-M-d HH:mm:ss}") %>'  /> 
                          <p style="text-align:right">
                              <asp:Button ID="btnR" runat="server" BackColor="#FF7D23" 
                    BorderColor="#FF7D23" BorderStyle="Solid" class="txt3" Font-Bold="True" 
                    ForeColor="White" Text="�ظ�" Width="60px" onclick="btnR_Click" 
                                  CommandArgument='<%# Eval("comid") %>' Visible='<%# Eval("cflag") %>'  />
                              &nbsp;&nbsp;</p>                 
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <br />
                            </div></td>
          </tr>
          <tr>
            <td colspan="2" align="left">
              </td>
          </tr>
      </table></td>
  </tr>
  <tr>
     <td  class="footer" height="40" colspan="9" bgcolor="#A1A1A1"><p>&nbsp;</p>
         <p>&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></p>
             <p>&nbsp;&nbsp;<a href="adminlogin.aspx" class="foot">��¼��̨</a>&nbsp;&nbsp;<a href="http://jsunplace.tumblr.com/" class="foot">���߲���</a>&nbsp;&nbsp;<a href="about.html" class="foot">���ڱ�վ</a></p>
</td>
  </tr>
</table>
    </form>
</body>
</html>
