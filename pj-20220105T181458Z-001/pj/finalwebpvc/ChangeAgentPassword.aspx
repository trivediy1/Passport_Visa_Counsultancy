<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="ChangeAgentPassword.aspx.cs" Inherits="finalwebpvc_ChangeAgentPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="changepassword" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="content">
            <div class="container center" style="">
                <div class="col-md-4 col-sm-4 col-xs-12 wow fadeIn fadeInUpBig" style="margin-left: 33.33%; margin-right: 33.33%">
                    <!--callback form div start-->
                    <div class="callback">
                        <h3>Change Password</h3>
                        <div class="callback_inner">
                            <input name="cu" type="hidden" value="passportconsultant.com" />
                            <input name="cap" type="hidden" value="26b99f526798845d051782d5e1eabb77" />
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                <div class="form-group">
                                    Enter Current Password
                                <asp:TextBox ID="current_password" runat="server" TextMode="Password" class=" wow form-control" placeholder="" required></asp:TextBox>
                                    <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="current_password"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    Enter New Password
                                <asp:TextBox ID="new_password" runat="server" TextMode="Password" class="form-control wow" placeholder="" required></asp:TextBox>
                                    <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="new_password"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    Confirm New Password
                                <asp:TextBox ID="confirm_new_Password" runat="server" TextMode="Password" class="form-control wow" placeholder="" required></asp:TextBox>
                                    <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="confirm_new_password"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not Matched" ControlToCompare="new_password" ControlToValidate="confirm_new_Password"></asp:CompareValidator>
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="cpi" runat="server" Text=""></asp:Label>
                                    <asp:Button ID="Submit_Button" runat="server" class=" btn btn-primary wow none" Text="Submit" required OnClick="Submit_Button_Click"></asp:Button>
                                    <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->


                                </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <!--callback form div end-->
                </div>
            </div>
        </div>
    </form>
</asp:Content>

