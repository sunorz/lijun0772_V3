<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="show"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>丽军数码-配件展示</title></head>
    <style type="text/css">
		#title{
	line-height:5pt;
	font-family:"楷书";
	font-size:20pt;
    color:#ffffff;
    line-height:40pt;
	letter-spacing:8pt;
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
    body {
	background-image: url(imgs/class/bg2.jpg);
	background-repeat: repeat;
	background-attachment: fixed;
}
.pager
 {
     width:100%;  margin:10px; line-height:20px; display:block;color:#F59223;
    
 }
.pager a, .pager span
 {

    border: 1px solid #F59223; 
    line-height: 30px;
    margin-right: 5px;
    padding: 2px 6px;
    background-color:White;color:#F59223;
 }
.pager a:hover
 {border:1 solid #F59223; background-color:#F59223; color:White;  padding: 2px 6px;}
.pager .current
{
     border: 1px solid #F59223; 
    line-height: 20px;
    margin: 0 5px;
    padding: 2px 6px;
    background-color:#F59223;color:White;
}
    </style>
<body>
<script language="JavaScript" type="text/javascript">
    var lang = navigator.language || navigator.userLanguage;
    if (lang.substr(0, 3) == "zh-") {
        document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>");
    }
</script>
    <form id="form1" runat="server">
<table width="1038" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
     <td height="49px" valign="middle" class="foote"><img src="imgs/logo.gif" width="100px" height="49px"  border="0"/>丽军数码摄影器材维修中心<div style="position:absolute; right:20px; bottom:16px;"><a href="showsea.aspx" title="点此搜索"><img src="imgs/search.gif" width="40" height="48" border="0" /></a></div></td>
  </tr>
  <tr>
    <td height="20" colspan="9"></td>
  </tr>  
  <tr>
  <td colspan="9" height="20"><table align="center" cellspacing="0" width="1035px">
      <tr>
     <td  align="center" valign="middle" class="topbar"><a href="Default.aspx" class="ht">
         网站首页</a></td>
    <td   align="center" valign="middle"  class="ht" bgcolor="#E96800">配件展示</td>
    <td  align="center" valign="middle" class="topbar"><a href="error.aspx" class="ht">
        常见故障</a></td>
    <td   align="center" valign="middle" class="topbar"><a href="fix.aspx" class="ht">
        报修流程</a></td>
    <td  align="center" valign="middle" class="topbar"><a href="bbs.aspx" class="ht">
        维修论坛</a></td>
    <td  align="center" valign="middle" class="topbar"><a href="shop.aspx" class="ht">
        网店介绍</a></td>
   <td  align="center" valign="middle" class="topbar"> <a href="staff.aspx" class="ht">
       人才招聘</a></td>
    <td  align="center" valign="middle" class="topbar"><a href="messages.aspx" class="ht">
        网上留言</a></td>
    <td   align="center" valign="middle" class="topbar"><a href="connect.aspx" class="ht">
        联系我们</a></td></tr>
      </table>
      </td>    
  </tr> 
     <tr>
    <td colspan="9" align="center" valign="middle">
<table width="100%" border="0" cellspacing="0" cellpadding="12">
<tr>
<td colspan="9" align="middle" valign="middle">
        <img src="imgs/class/img2.gif" width="200" height="194"  /><div id="title" runat="server">
            配件展示</div></td>
        </tr>
  <tr>
    <td colspan="9" align="center" bgcolor="#333333">
        <table width="100%" border="0" cellspacing="0" cellpadding="12">
          <tr>
            <td align="center" bgcolor="#333333">
              <asp:FormView ID="fvphoto" runat="server" AllowPaging="True" PageSize="1"
                    DataSourceID="SqlDataSource1" DataKeyNames="poid" CellPadding="3" 
                    BackColor="#333333" 
                    BorderColor="#333333" BorderStyle="None" BorderWidth="1px" 
                    HorizontalAlign="Center" EnableTheming="True" CellSpacing="5" 
                    Font-Names="Arial" >
                    <PagerSettings  Position="Top"  Mode="NextPrevious" PageButtonCount="5" NextPageText="下一页" PreviousPageText="上一页" />
                    <FooterStyle BackColor="#333333"/>
                    <RowStyle BackColor="#333333" ForeColor="White" />
                    <EditItemTemplate>                       
                    </EditItemTemplate>
                    <InsertItemTemplate>                     
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
                        <span class="contents"><asp:Label ID="Label4" runat="server" 
                            Text='<%# Eval("poname") %>' Font-Names="arial,宋体,sans-serif;" 
                            ForeColor="White" style="font-size: large"></asp:Label></span>
                        <br />                                                
                         <br />
                        <asp:Image ID="Image1" Width="100%" Height="76%" runat="server" 
                            ImageUrl='<%# Eval("pourl") %>' BorderStyle="Solid" BorderWidth="3px" BorderColor="White" />
                            <br />
                        <br />
                        Page&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# SubStr(Eval("rowsid"),60) %>' 
                            style="text-align: right; font-weight: 700; font-family: 微软雅黑; font-size: x-large; color: #999999;"></asp:Label>
                        /<asp:Label ID="lbtotal" runat="server" Text="0"></asp:Label>
                       <br />                    
                        
                    </ItemTemplate>
                    <PagerStyle BackColor="#333333"   HorizontalAlign="Left" 
                        Font-Bold="True" Font-Size="Medium" 
                        Font-Underline="True" CssClass="pager" />
                    <EmptyDataTemplate>
                        <asp:Image ID="Image2" Width="100%" Height="76%" runat="server" 
                            ImageUrl="~/imgs/nopic.jpg" BorderStyle="Solid" BorderWidth="3px" BorderColor="White"  ToolTip="没有图片" />
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                </asp:FormView>   
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:lijunConnectionString %>"
                    SelectCommand="SELECT *,ROW_NUMBER()OVER (order by poid) AS rowsid FROM [Photo] WHERE [alid] =3">
                </asp:SqlDataSource>
                <br /><br /><br /><br />
              <div class="bshare-custom"><div class="bsPromo bsPromo2"></div><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到i贴吧" class="bshare-itieba" href="javascript:void(0);"></a><a title="分享到Facebook" class="bshare-facebook" href="javascript:void(0);"></a><a title="分享到Twitter" class="bshare-twitter" href="javascript:void(0);"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count" style="float: none;">
                  </span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=3&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script></td>
          </tr>
          </table> </table>   
        <br />
        <br />
      
      </td>
  </tr>
  <tr>
    <td height="40" colspan="9" class="footer">
           <p>&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></p>
      <p>&nbsp;&nbsp;<a href="adminlogin.aspx" class="foot">登录后台</a>&nbsp;&nbsp;<a href="http://jsunplace.tumblr.com/" class="foot">作者博客</a>&nbsp;&nbsp;<a href="about.html" class="foot">关于本站</a></p>
  </td>
  </tr>
</table>
    </form>
</body>
</html>
