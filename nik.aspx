// session mate no code chhe aa
// aaa peli file no code chhe
Session["name"] = txtname.Text;
Session["city"] = txtcity.Text;


string qs = "?" + "name=" + txtname.Text + "&city=" + txtcity.Text;
Response.Redirect("second.aspx" + qs);

        //aa data bija form lai java mate no code chhe
 string nm = Request.QueryString["name"];
 string ct = Request.QueryString["city"];

Response.Write(nm+"<br/>");
Response.Write(ct +"<br/>");

//aa parvez sir vadi chhe cookie ok

 protected void btnretrive_Click(object sender, EventArgs e)
        {
            if (Response.Cookies["sname"] == null)
            {
                txtretrive.Text = "Cookies not found";
            }
            else
            {
                txtretrive.Text = Request.Cookies["sname"].Value;
                //Request.Cookies["uname"].Value = txtretrive.Text.ToString(); 
            }
        }
  protected void btnadd_Click(object sender, EventArgs e)
        {
            Response.Cookies["sname"].Value = txtadd.Text.ToString();
            Response.Cookies["sname"].Expires = DateTime.Now.AddSeconds(10);
            txtadd.Text = "";
        }


//Query String mate no code
WebForm2.aspx
            Response.Redirect("WebForm3.aspx?firstname=" + txtname.Text + "&lastname=" + txtlname.Text);

WebForm3.aspx
string firstname = Request.QueryString["firstname"];
            string lastname = Request.QueryString["lastname"];
            Label1.Text = "welcome" + firstname + " " + lastname;



//aa code ajax no chhe

 <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
    <asp:UpdatePanel ID="UP1" runat="server">
        <ContentTemplate>

        //aani andar je code lakho te ajax no part thai jase ok
        //pela ScriptManager pachhi  updatepanel ani andar contenttemplete karvanu ok
                    Mahesh Watch Time : 
                    <br />
                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                    <asp:Label ID="Label1" runat="server" Text="Label">
                    </asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </ContentTemplate>
</asp:UpdatePanel>


//value match karva mate no code chhe validation code ok
 <asp:CompareValidator ID="CompareValidator1" 
                        runat="server" 
                        ErrorMessage="Not matched with Age value" 
                        Text="Not matched with Age value"
                        ControlToValidate="txtConfAge"
                        Operator="GreaterThan"
                        ControlToCompare="txtAge"
                        Type="Integer"
                        SetFocusOnError="True">
</asp:CompareValidator>

//aa email na validation no code chhe

<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Incorrect email address format"
            Text="Incorrect email address format" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ControlToValidate ="txtEmail">
</asp:RegularExpressionValidator>

// aa code field khali hoy to message deva mate no validation code che

<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator - City" 
                        Text="Enter City..." 
                        ControlToValidate="TextBox1" 
                        ForeColor="#FF0066">
</asp:RequiredFieldValidator>

//badhaj validation aama chhe

    <form id="form1" runat="server">

        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
       
        <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" 
            runat="server" 
            ControlToValidate ="txtName"
            Text="*"
            ErrorMessage="Name should not be empty" 
            ForeColor="Red">

        </asp:RequiredFieldValidator>
       
        
        <br />
         <asp:Label ID="Label2" runat="server" Text="City"></asp:Label>
        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2" 
            runat="server" 
            ControlToValidate ="txtCity"
            Text="*"
            ErrorMessage="City should not be empty" 
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        
        <br />
        <asp:Label ID="Label3" runat="server" Text="State"></asp:Label>
        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator3" 
            runat="server" 
            ControlToValidate ="txtState"
            Text="*"
            ErrorMessage="State should not be empty" 
            ForeColor="Red">

        </asp:RequiredFieldValidator>
        
        
         <br />
        <asp:Label ID="Label4" runat="server" Text="Age"></asp:Label>
        <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator4" 
            runat="server" 
            ControlToValidate ="txtAge"
            Text="*"
            ErrorMessage="Age should not be empty" 
            ForeColor="Red">

             <asp:RangeValidator ID="RangeValidator1" 
                 runat="server" 
                 ControlToValidate="txtAge"
                 ErrorMessage="Age must be between 18 to 100"
                 Text ="*"
                 Type="Integer"
                 MinimumValue="18"
                 MaximumValue="100">
             </asp:RangeValidator>
        </asp:RequiredFieldValidator>
        
        
        <br />
        <asp:Label ID="Label5" runat="server" Text="Confirm Age"></asp:Label>
        <asp:TextBox ID="txtConfAge" runat="server"></asp:TextBox>
        <asp:CompareValidator 
            ID="CompareValidator1" 
            runat="server" 
            Text="*"
            ErrorMessage="ConfAge value must be same as Age value"
            ControlToValidate="txtConfAge"
            ControlToCompare="txtAge"
            Type="Integer"
            Operator="Equal"
            SetFocusOnError="true">
        </asp:CompareValidator>
        
         <br />
        <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator 
            ID="RegularExpressionValidator1" 
            runat="server" 
            ControlToValidate="txtEmail"
            Text="*"
            ErrorMessage="Incorrect format for Email"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">

        </asp:RegularExpressionValidator>

        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:ValidationSummary 
            ID="ValidationSummary1" 
            runat="server" />
    </form>
