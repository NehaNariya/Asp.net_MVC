<!--session-->
##username,password,label,login levu

#form.aspx

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebForm1.aspx.cs" Inherits="WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Username :</td>
                    <td>
                        <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td>
                        <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbldisplay" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>


------------

#form1.asp.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class WebForm1 : System.Web.UI.Page
{
    string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Admin\source\repos\Sem-2(Asp.Net)\WebApplicationSESSIONPB5\WebApplicationSESSIONPB5\App_Data\Database1.mdf;Integrated Security=True";
    SqlConnection con;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("WebForm1.aspx");
        }
        else
        {
            lbldisplay.Text = "Welcome :" + Session["user"];
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("select count(*) from EMP where Email='" + txtusername.Text + "' and Password='" + txtpassword.Text + "' ", con);
        cmd.ExecuteScalar();
        int i = Convert.ToInt16(cmd.ExecuteScalar());

        if (i > 0)
        {
            Session["user"] = txtusername.Text;
            Response.Redirect("WebForm2.aspx");
        }
        else
        {
            Response.Write("Email or Password are incorrect !!!!");
        }
    }
}

--------------------------------
--------------------------

<!--session--username,password-->

#form1.aspx

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplicationLoginFormPB2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label></td>
                </tr>
                <tr>
                    <td>UserName :</td>
                    <td>
                        <asp:TextBox ID="txtusername" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td>
                        <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnsubmit" runat="server" Text="Login" OnClick="btnsubmit_Click" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

-----------------------

#form1.aspx.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationLoginFormPB2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            Session["lblusername"] = txtusername.Text;
            Session["lblpassword"] = txtpassword.Text;
            if(txtusername.Text=="neha" && txtpassword.Text=="123")
            {
                Response.Redirect("WebForm2.aspx");
            }
            else
            {
                Response.Write("Username or password are not correct");
            }
          
        }
    }
}

-----------------------
#webform2.aspx

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplicationLoginFormPB2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblusername" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblpassword" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="LogOut" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>


----------------

#webform2.aspx.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationLoginFormPB2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblusername.Text = Session["lblusername"].ToString();
            lblpassword.Text = Session["lblpassword"].ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("WebForm1.aspx");
        }
    }
}

------------------------
-------------------------------------------



--------------------------

-------------

<!-session-->

# form1.aspx

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplicationFormDemoPB1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>First Name :</td>
                    <td>
                        <asp:TextBox ID="txtfirstname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Last Name :</td>
                    <td>
                        <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Email :</td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Gender :</td>
                    <td>
                        <asp:RadioButtonList ID="radiobtngender" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>City :</td>
                    <td>
                        <asp:DropDownList ID="droplistcity" runat="server" AutoPostBack="True">
                            <asp:ListItem>--Select City--</asp:ListItem>
                            <asp:ListItem>Rajkot</asp:ListItem>
                            <asp:ListItem>Mumbai</asp:ListItem>
                            <asp:ListItem>Surat</asp:ListItem>
                            <asp:ListItem>Vadodara</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Hobby :</td>
                    <td>
                        <asp:CheckBoxList ID="checkboxhobby" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                            <asp:ListItem>Dancing</asp:ListItem>
                            <asp:ListItem>Reading</asp:ListItem>
                            <asp:ListItem>Singing</asp:ListItem>
                        </asp:CheckBoxList></td>
                </tr>
                <tr>
                    <td>Address :</td>
                    <td>
                        <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Mobile :</td>
                    <td>
                        <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                   <td></td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

--------------------------

#form1.aspx.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationFormDemoPB1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["txtfirstname"] = txtfirstname.Text;
            Session["txtlastname"] = txtlastname.Text;
            Session["txtemail"] = txtemail.Text;
            Session["lblgender"] = radiobtngender.SelectedValue;
            Session["lblcity"] = droplistcity.SelectedValue;
            Session["lblhobby"] = checkboxhobby.SelectedValue;
            Session["lbladdress"] = txtaddress.Text;
            Session["lblmobile"] = txtmobile.Text;

            Response.Redirect("WebForm3.aspx");
        }
    }
}



-------------------------------------------



<!--session--ma label display karva mate-->

#form1.aspx

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplicationFormDemoPB1.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblfirstname" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbllastname" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblemail" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblgender" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblcity" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblhobby" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbladdress" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblmobile" runat="server"></asp:Label></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>


----------------------------

#form1.aspx.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationFormDemoPB1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblfirstname.Text = Session["txtfirstname"].ToString();
            lbllastname.Text = Session["txtlastname"].ToString();
            lblemail.Text = Session["txtemail"].ToString();
            lblgender.Text = Session["lblgender"].ToString();
            lblcity.Text = Session["lblcity"].ToString();
            lblhobby.Text = Session["lblhobby"].ToString();
            lbladdress.Text = Session["lbladdress"].ToString();
            lblmobile.Text = Session["lblmobile"].ToString();
        }
    }
}
--------------------------

------------------




-------------------------

-----------------

<!--cookie-->

#cookie.aspx

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cookie.aspx.cs" Inherits="WebApplicationCOOKIESPB6.Cookie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <asp:Label ID="lbldisplay" runat="server" Text=""></asp:Label>
                </tr>
                <tr>
                    <td>
                        Create Cookie :
                    </td>
                    <td>
                        <asp:TextBox ID="txtcreatecookie" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Retrive Cookie :
                    </td>
                    <td>
                        <asp:TextBox ID="txtretrivecookie" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btncreatecookie" runat="server" Text="Create Cookie" OnClick="btncreatecookie_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btngetcookie" runat="server" Text="Get Cookie" OnClick="btngetcookie_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

-------------------------

#cookie.aspx.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationCOOKIESPB6
{
    public partial class Cookie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btncreatecookie_Click(object sender, EventArgs e)
        {
            Response.Cookies["cookie1"].Value = txtcreatecookie.Text;
            txtcreatecookie.Text = "";
            Response.Cookies["cookie1"].Expires = DateTime.Now.AddSeconds(10);
        }

        protected void btngetcookie_Click(object sender, EventArgs e)
        {
           if(Request.Cookies["Cookie1"] == null)
            {
                txtcreatecookie.Text = "cookie not found";
            }
            else
            {
                txtretrivecookie.Text = Request.Cookies["Cookie1"].Value;
            }
        }
    }
}



--------------------------
------------------------------------------------

<!--Validation Controller-->

#Webform1.aspx

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplicationValidationDemoPB3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 177px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td class="auto-style1">Firstname :</td>
                    <td>
                        <asp:TextBox ID="txtfirstname" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtfirstname" ForeColor="Red" runat="server" ErrorMessage="Please Enter First Name... "></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="auto-style1">Lastname :</td>
                    <td>
                        <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtlastname" ForeColor="Red" runat="server" ErrorMessage="Please Enter Last Name.."></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="auto-style1">Gender :</td>
                    <td>
                        <asp:RadioButtonList ID="radiobtngender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1">Email :</td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtemail" ForeColor="red" runat="server" ErrorMessage="Please Enter  valied  Email..." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td class="auto-style1">Password :</td>
                    <td>
                        <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtpassword" ValueToCompare="txtconformpassword" ForeColor="red" runat="server" ErrorMessage="Enter Password.."></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td class="auto-style1">Conform Password :</td>
                    <td>
                        <asp:TextBox ID="txtconformpassword" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtconformpassword" ValueToCompare="txtpassword" ForeColor="red" runat="server" ErrorMessage="Password Not Matched.."></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td class="auto-style1">Address :</td>
                    <td>
                        <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtaddress" ForeColor="Red" runat="server" ErrorMessage="Please Enter Address.."></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="auto-style1">Mobile :</td>
                    <td>
                        <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RangeValidator ID="RangeValidator1" ControlToValidate="txtmobile" Forecolor="red" runat="server" ErrorMessage="Only 10 Digits"></asp:RangeValidator></td>
                </tr>
                <tr>
                    <td class="auto-style1">Image :</td>
                    <td>
                        <asp:Image ID="image" runat="server" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                    </td>
                </tr>
  
            </table>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="firstname" HeaderText="firstname" SortExpression="firstname" />
                <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
                <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="mobile" HeaderText="mobile" SortExpression="mobile" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='Edit'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" Text='Delete' CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
    </form>
</body>
</html>


---------------------------------------

#webform1.aspx.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplicationValidationDemoPB3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        int id;

        String s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            //Fillgrid();
            getcon();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if(btnsubmit.Text!="Update")
            {
                con = new SqlConnection(s);
                con.Open();
                cmd = new SqlCommand("insert into Student(firstname,lastname,gender,email,password,address,mobile,image)Values('" + txtfirstname + "','" + txtlastname + "','" + radiobtngender + "','" + txtemail + "','" + txtpassword + "','" + txtaddress + "','" + txtmobile + "','" + image + "')");
                cmd.ExecuteNonQuery();
                Fillgrid();
            }
        }
        public void Fillgrid()
        {
            con = new SqlConnection(s);
            con.Open();
            da = new SqlDataAdapter("select * from Student", con);
            ds = new DataSet();
            da.Fill(ds);
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        public DataSet select(int id)
        {
            getcon();
            da = new SqlDataAdapter("select * from Student where Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public void Filltext()
        {
            getcon();
            ds = new DataSet();
            ds = select(Convert.ToInt16(ViewState["id"]));
            //paring

            txtfirstname.Text = ds.Tables[0].Rows[0][1].ToString();
            txtlastname.Text = ds.Tables[0].Rows[0][2].ToString();
            radiobtngender.Text = ds.Tables[0].Rows[0][3].ToString();
            txtemail.Text = ds.Tables[0].Rows[0][4].ToString();
            txtpassword.Text = ds.Tables[0].Rows[0][5].ToString();
            txtaddress.Text = ds.Tables[0].Rows[0][6].ToString();
            txtmobile.Text = ds.Tables[0].Rows[0][7].ToString();

            //Gender
            if (ds.Tables[0].Rows[0][2].ToString() == "Male")
            {
                radiobtngender.Items[1].Selected = false;
                radiobtngender.Items[0].Selected = true;
            }
            else
            {
                radiobtngender.Items[0].Selected = false;
                radiobtngender.Items[1].Selected = true;
            }

            //Email
            txtemail.Text = ds.Tables[0].Rows[0][3].ToString();

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "cmd_edt")
            {
                id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                btnsubmit.Text = "Update";
                Filltext();
            }
        }

       
    }
}

-------------------------------------------------

-------------------------------------------

<!--Theme-->

Project upar right click karva nu-> Add Asp.net folder -> select theme -> created two theme named Client1 and Client2 - >

theme - > right click -> new folder -> skin file 





