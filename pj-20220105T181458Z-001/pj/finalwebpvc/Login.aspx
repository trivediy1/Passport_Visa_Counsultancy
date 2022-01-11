<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    
    <title>PVC Login</title>
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="loginform1k" runat="server">

        <div class="content">
            <div class="container center" style="">


                <div class="col-md-4 col-sm-4 col-xs-12 wow fadeInLeft" style="margin-left: 33.33%; margin-right: 33.33%">
                    <!--callback form div start-->
                    <div class="callback">
                        <h3>Login</h3>
                        <div class="callback_inner">
                            <input name="cu" type="hidden" value="passportconsultant.com" />
                            <input name="cap" type="hidden" value="26b99f526798845d051782d5e1eabb77" />
                            <div class="form-group">
                                <asp:TextBox ID="User_Name" runat="server" class="form-control" placeholder="User Name/Email_Id" required></asp:TextBox>
                                <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter User Name" ControlToValidate="User_Name"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control" placeholder="Password" required></asp:TextBox>
                                <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="Password"></asp:RequiredFieldValidator>

                            </div>
                            <asp:Label ID="Label1" runat="server" Text="" class="control-label"></asp:Label>
                            <div class="form-group">
                                
                                <asp:Button ID="Submit_Button" runat="server" class="btn btn-primary wow none   " Text="Login" required OnClick="Submit_Button_Click"></asp:Button>
                                <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                            </div>

                        </div>
                    </div>
                    <!--callback form div end-->
                </div>
            </div>
        </div>
    </form>

</asp:Content>