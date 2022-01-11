<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="applyvisapart1.aspx.cs" Inherits="finalwebpvc_applyvisapart1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="acp1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server">
        </asp:ScriptManager>

        <div class="content center">
            <div class="container">
                <div id="step-1" class="col-md-5 col-sm-5 col-xs-14 wow fadeInUp col-md-offset-3 row setup-content">
                    <div class="callback">
                        <h3>Customer Personal Details</h3>
                        <div class="callback_inner">
                            <div class="form-group">

                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <label class="control-label">Adhar Card No</label>
                                        <asp:TextBox ID="Adhar_Card_No" runat="server" class="form-control" AutoPostBack="true" placeholder="Adhar Card No" required="*" OnTextChanged="Adhar_Card_No_TextChanged"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Must be a 12 digit number" ControlToValidate="Adhar_Card_No" ValidationExpression="\d{12}"></asp:RegularExpressionValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="form-group">

                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">First Name</label>
                                            <asp:TextBox ID="First_Name" runat="server" class="form-control" placeholder="First Name" required="*"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="form-group">

                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">Middle_Name</label>
                                            <asp:TextBox ID="Middle_Name" runat="server" class="form-control" placeholder="Middle Name" required="*"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="form-group">

                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">Last_Name</label>
                                            <asp:TextBox ID="Last_Name" runat="server" class="form-control" placeholder="Last Name" required="*"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="form-group">

                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">Gender</label>
                                            <asp:DropDownList ID="gender" runat="server" CssClass="form-control">
                                                <asp:ListItem Selected="True">Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <br />
                                </div>
                                <div class="form-group">

                                    <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">Address</label>
                                            <asp:TextBox ID="Address" runat="server" required="*" TextMode="MultiLine" class="form-control" Columns="20" Rows="5" placeholder="Address"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>


                                <div class="form-group">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">Pincode</label>
                                            <asp:TextBox ID="Pincode" runat="server" class="form-control" AutoPostBack="true" placeholder="Pincode" required="*" OnTextChanged="Pincode_TextChanged"></asp:TextBox>

                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid" ControlToValidate="Pincode" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="form-group">
                                    <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">City</label>
                                            <asp:TextBox ID="City" runat="server" class="form-control" AutoPostBack="true" placeholder="City" required="*"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="form-group">
                                    <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">District</label>
                                            <asp:TextBox ID="District" runat="server" class="form-control" AutoPostBack="true" placeholder="District" required="*"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="form-group">
                                    <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">State</label>
                                            <asp:TextBox ID="State" runat="server" class="form-control" AutoPostBack="true" placeholder="State" required="*"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>




                                <div class="form-group">

                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">Contact No</label>
                                            <asp:TextBox ID="Contact_No" runat="server" class="form-control" placeholder="Contact No" required="*"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="form-group">

                                    <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                        <ContentTemplate>
                                            <label class="control-label">Email Id</label>
                                            <asp:TextBox ID="Email_Id" runat="server" class="form-control" placeholder="Email Id" required="*"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email_Id" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                                <div class="form-group">

                                    <label class="control-label">Date of Birth</label>


                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="dob_tb" runat="server" class="form-control" placeholder="dd-mm-yyyy" required="*"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="dob_tb"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" Display="Dynamic" runat="server" ErrorMessage="Please Enter date in dd-mm-yyyy format" ControlToValidate="dob_tb" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\d{4}"></asp:RegularExpressionValidator>
                                            <asp:CompareValidator runat="server" ID="CompareEndTodayValidator" ErrorMessage="The date must be less than today" ControlToValidate="dob_tb" Display="Dynamic" Type="Date" Operator="LessThan" />

                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>



                                <asp:Button ID="next1" runat="server" class="btn btn-primary nextBtn btn-lg pull-right" Text="Next" OnClick="next1_Click"></asp:Button>
                                <!--<button class="btn btn-primary nextBtn btn-lg pull-right" type="button">Next</button>-->


                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</asp:Content>

