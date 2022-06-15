//App_Themes folder ni andar Theme1 hase aeni andar "SkinFile.skin" ni e skin file add karvi 

//SkinFile.skin

<%--
Default skin template. The following skins are provided as examples only.

1. Named control skin. The SkinId should be uniquely defined because
   duplicate SkinId's per control type are not allowed in the same theme.

<asp:GridView runat="server" SkinId="gridviewSkin" BackColor="White" >
   <AlternatingRowStyle BackColor="Blue" />
</asp:GridView>

2. Default skin. The SkinId is not defined. Only one default 
   control skin per control type is allowed in the same theme.

<asp:Image runat="server" ImageUrl="~/images/image1.jpg" />
--%>

    <asp:Button runat="server" SkinID="btncolor" BackColor="red"/>
      

      -------------------------------
 /app_theme ma j stylesheet.css file add karvi
 
//StyleSheet.css   

body {
    background-color:darksalmon;
}

----------------------------------------------

#AjexForm.aspx

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AjexForm.aspx.cs" Inherits="AjexForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
        </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnpartial" runat="server" Onclick="btnpartial_Click" Text="Partial PostBack" />
                <br />
                <br />
                <asp:Label ID="lblpartial" runat="server"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>

        <p></p>
        <p>Outside the Update Panel</p>
        <p>
            <asp:Button ID="btntotal" runat="server" OnClick="btntotal_Click" Text="Total PostBack" />
        </p>

        <asp:Label ID="lbltotal" runat="server"></asp:Label>
    </form>
</body>
</html>


---------------------------
          
#ajex.aspx.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AjexForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btntotal_Click(object sender, EventArgs e)
    {
        string time = DateTime.Now.ToLongTimeString();
        lblpartial.Text = "Showing time from panel" + time;
        lbltotal.Text = "Showing time from outside" + time;
    }

    protected void btnpartial_Click(object sender, EventArgs e)
    {
        string time = DateTime.Now.ToLongTimeString();
        lblpartial.Text = "Showing time from panel" + time;
        lbltotal.Text = "Showing time from outside" + time;
    }
}



-------------------------
  
  #RegisterForm.aspx

<%@ Page Language="C#" Theme="Theme1" AutoEventWireup="true" CodeFile="Register Form.aspx.cs" Inherits="Register_Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
<br />
                 
                        <h1>Register Form</h1>
                        <table class="auto-style1">
                            <tr>
                                <td>Name :</td>
                                <td>
                                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Password :</td>
                                <td>
                                    <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Confirm Password :</td>
                                <td>
                                    <asp:TextBox ID="txtconfirmpassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>City :</td>
                                <td>
                                    <asp:DropDownList ID="DropDownCityList1" runat="server">
                                        <asp:ListItem Selected="True" Text="Select City" Value="select"></asp:ListItem>
                                        <asp:ListItem Text="Bangalore" Value="Bangalore"></asp:ListItem>
                                        <asp:ListItem Text="Mysore" Value="Mysore"></asp:ListItem>
                                        <asp:ListItem Text="Hubli" Value="hubli"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Gender :</td>
                                <td>
                                    <asp:RadioButtonList ID="RadioButtonGenderList1" runat="server">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>Gmail :</td>
                                <td>
                                    <asp:TextBox ID="txtGmail" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnRegister" runat="server" CssClass="btnRegister" onClick="btnRegister_Click" SkinID="btncolor" Text="Register" />
                                </td>
                            </tr>
                        </table>
                     
                        <br />
                        <br />
                       
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />                    
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </ContentTemplate>

            </asp:UpdatePanel>
         
        </div>
    </form>
</body>
</html>

------------------------------

#RegisterForm.aspx.cs
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Label1.Text = txtname.Text;
        Label2.Text = txtpassword.Text;
        Label3.Text = txtconfirmpassword.Text;
        Label4.Text = DropDownCityList1.Text;
        Label5.Text = RadioButtonGenderList1.Text;
        Label6.Text = txtGmail.Text;
    }
}


