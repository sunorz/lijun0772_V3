<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forget.aspx.cs" Inherits="forget" Debug="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="adminsty.css" />
<title>��������</title>  </head>
<script language="JavaScript" type="text/javascript">
    var lang = navigator.language || navigator.userLanguage;
    if (lang.substr(0, 3) == "zh-") {
        document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>");
    }
</script>
<body>
<form id="form1" runat="server" autocomplete="off">
  <table width="1038" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15" colspan="9" bgcolor="#585858"></td>
  <tr>
  <td  align="left" valign="middle" bgcolor="#ff7d23" class="style1">��������</td>
   
  </tr>  <tr>
  <td height="15" colspan="9" align="center" bgcolor="#FFFFFF">
        <p><br />
        </p>
       
        <table width="90%" border="0" cellspacing="0" cellpadding="12">
          <tr>
            <td width="547" align="left"><h1>��̨����</h1>
             </td>
            <td align="right" nowrap="nowrap">&nbsp;</td>
            <td width="200" align="right">
                &nbsp;&nbsp;<asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/imgs/back.gif" Height="32" Width="32" title="����" OnClick="btnBack_click"/>&nbsp;&nbsp;</td>
          </tr>
          <tr>
            <td height="3" colspan="3" align="left">
                
                          </td>
          </tr>
          <tr>
            <td colspan="3" align="center" valign="middle" width="500">
            <!--�޸�����-->
            <div id="divforget" class="divcss" runat="server" align="center">
              <table width="100%" border="0" cellspacing="0" cellpadding="12">
                <tr>
                  <td align="right"><img src="imgs/user.gif" width="32" height="32" /></td>
                  <td align="left"><strong>�������룺</strong></td>
                </tr>
                <tr>
                  <td colspan="2"><p>&nbsp;&nbsp;�û�����
                          <asp:TextBox ID="yhm" runat="server" BackColor="Silver" class="txt3" 
                          maxlength="20" CssClass="txt3"></asp:TextBox>
                        </p><p>Ԥ�����䣺<asp:TextBox ID="ylyx" runat="server" BackColor="Silver" CssClass="txt3" 
                            MaxLength="20"></asp:TextBox>
                                              </p>
                                              <div id="aptips" class="aptips" runat="server"></div></td>
                </tr>
                <tr>
                  <td colspan="2">
                      <asp:ImageButton ID="btnpwdfg" runat="server" 
                          ImageUrl="~/imgs/okbtn.gif" onclick="btnpwdfg_Click"/>
                      &nbsp;<asp:ImageButton ID="btnReset1" runat="server" ImageUrl="~/imgs/clearbtn.gif" OnClick="btnReset1_click"/></td>
                </tr>
              </table>
            </div>
</td>
          </tr>
          <tr>
            <td colspan="3" align="center" valign="middle"><div id="divreset" class="divcss" runat="server" align="center" visible="False">
              <table width="100%" border="0" cellspacing="0" cellpadding="12">
                <tr>
                  <td align="right"><img src="imgs/user.gif" alt="" width="32" height="32" /></td>
                  <td align="left"><strong>�������룺              </tr>
                <tr>
                  <td colspan="2"><p>&nbsp;&nbsp;�����룺<asp:TextBox ID="newpwd" runat="server" 
                          BackColor="Silver" CssClass="txt3" MaxLength="20" TextMode="Password"></asp:TextBox>
                                              </p>
                    <p>����ȷ�ϣ�<asp:TextBox ID="newconf" runat="server" BackColor="Silver" CssClass="txt3" 
                            MaxLength="20" TextMode="Password"></asp:TextBox>
                                              </p>
                    <div id="aptips2" class="aptips" runat="server"></div></td>
                </tr>
                <tr>
                  <td colspan="2">
                      <asp:ImageButton ID="btnpwdr" runat="server" 
                          ImageUrl="~/imgs/okbtn.gif" onclick="btnpwdr_Click"/>            
                    &nbsp;
                    <asp:ImageButton ID="btnReset2" runat="server" ImageUrl="~/imgs/clearbtn.gif" 
                          OnClick="btnReset2_click"/></td>
                </tr>
              </table>
            </div></td>
          </tr>
          <tr>
            <td colspan="3" align="center" valign="middle" width="500">

               
            <div id="divcode" class="divcss" runat="server" align="center" visible="False">
              <table width="100%" border="0" cellspacing="0" cellpadding="12">
                <tr>
                  <td align="right"><img src="imgs/user.gif" width="32" height="32" /></td>
                  <td align="left"><strong>�������룺</strong></td>
                </tr>
                <tr>
                  <td colspan="2"><p>&nbsp;&nbsp;������֤�룺                           
                      <asp:TextBox ID="txtcode" runat="server" BackColor="Silver" class="txt3" 
                          maxlength="20" CssClass="txt3"></asp:TextBox>
                        </p>
                        <div id="aptips3" runat="server" class="aptips"></div></td>
                </tr>
                <tr>
                  <td colspan="2">
                      <asp:ImageButton ID="btnrescode" runat="server" 
                          ImageUrl="~/imgs/okbtn.gif" onclick="btnrescode_Click"/>
                      &nbsp;<asp:ImageButton ID="btnReset3" runat="server" ImageUrl="~/imgs/clearbtn.gif" 
                          OnClick="btnReset3_click"/></td>
                </tr>
              </table>
            </div>

               
            </td>
          </tr>
        </table>

          <p>
            <br />
            <br />
            

        </p>
 <br />

            
  </tr>
  
  <tr>
    <td align="center" valign="middle" bgcolor="#FFFFFF" cellpadding="0">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<p><br />
             <br />
            <br />
             <br /></p></td>
  </tr>
  <tr>
    <td height="40" bgcolor="#A1A1A1"  class="footer"><p>&nbsp;</p>
     <p> &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text=""></asp:Label></p></td></table>          
    </form>
</body>
</html>
