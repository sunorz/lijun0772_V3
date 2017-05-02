<%@ Page Language="C#" AutoEventWireup="true" CodeFile="image.aspx.cs" Inherits="image"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>查看图片</title>
    


        <style type="text/css">
            .style2
            {
                text-align: right;
            }
            .style3
            {
                text-align: left;
            }
            </style>
<body>
<script language="JavaScript" type="text/javascript">
    var lang = navigator.language || navigator.userLanguage;
    if (lang.substr(0, 3) == "zh-") {
        document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>");
    }
</script>
<form id="form1" runat="server" autocomplete="off">
  <table width="1038" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15" colspan="9" bgcolor="#585858"></td>
  <tr>
  <td  align="left" valign="middle" bgcolor="#ff7d23" class="style1">丽军数码</td>
   
  </tr>  <tr>
  <td height="15" colspan="9" align="center" bgcolor="#FFFFFF">
        <p><br />
        </p>
       
        <table width="90%" border="0" cellspacing="0" cellpadding="12">
          <tr>
            <td align="left" class="style2"><h1 class="style3">后台管理</h1>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                &nbsp;<asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/imgs/back.gif" Height="32" Width="32" title="返回" OnClick="btnBack_click"/>
                &nbsp;&nbsp;<asp:ImageButton ID="btnLogout" runat="server" ImageUrl="~/imgs/logout.gif" Height="32" Width="32" title="登出" OnClick="btnLogout_click"/></td>
          </tr>
          <tr>
            <td align="center" valign="middle">
<div style="margin:auto; text-align:center; width:100%;" align="center">
               
                <asp:FormView ID="fvimage" runat="server" DataKeyNames="poid" 
                    HorizontalAlign="Center" >
                    <EditItemTemplate>                        
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="poidLabel" runat="server" Text='<%# Eval("poid") %>' 
                            Visible="False" /><asp:Label runat="server" Text='<%# Eval("poname") %>'></asp:Label>
                        <br /><br />
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("pourl") %>' 
                            Height="100%" Width="100%" />
                        &nbsp;<br />
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        此图片不存在或者已经被删除！
                    </EmptyDataTemplate>
                </asp:FormView>   </div>           
            </td>
          </tr>
        </table>

  </tr>
  
  <tr>
    <td align="center" valign="middle" bgcolor="#FFFFFF" cellpadding="0">
        </td>
  </tr>
  <tr>
    <td height="40" bgcolor="#A1A1A1"  class="footer"><p>&nbsp;</p>
                  <p> &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text=""></asp:Label></p></td></table>    
    </form>
</body>
</html>
