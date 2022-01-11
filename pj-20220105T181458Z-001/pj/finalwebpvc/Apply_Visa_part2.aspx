<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="Apply_Visa_part2.aspx.cs" Inherits="finalwebpvc_Apply_Visa_part2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="acp2" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <div class="content center">
        <div class="container ">
            <div id="step-2" class="col-md-5 col-sm-5 col-xs-14 wow fadeInUp col-md-offset-3 row setup-content">
                <!--callback form div start-->
                <div class="callback">
                    <h3>Visa Details</h3>

                    <div class="callback_inner">
                        <div class="form-group">
                            <label class="control-label">Visa Service</label>
                            <asp:DropDownList ID="visa_service" runat="server" CssClass="form-control">
                                <asp:ListItem Selected="True">New</asp:ListItem>
                                <asp:ListItem>Cancel</asp:ListItem>
                            </asp:DropDownList>

                            <br />
                        </div>

                        <div class="form-group">
                            <label class="control-label">Amount</label>
                            <asp:TextBox ID="visa_amount" runat="server" class="form-control" Columns="20" Rows="5" placeholder="Amount"></asp:TextBox>
                            <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ControlToValidate="visa_amount"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="visa_amount" ErrorMessage="Invalid" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Contry</label>
                            <asp:TextBox ID="country" runat="server" class="form-control" Columns="20" Rows="5" placeholder="Contry"></asp:TextBox>
                            <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="country"></asp:RequiredFieldValidator>
                            
                            <br />
                        </div>

                        <div class="form-group">
                            <label class="control-label">Passport No.</label>
                            <asp:TextBox ID="pass_no" runat="server" class="form-control" Columns="20" Rows="5" placeholder="Passport No."></asp:TextBox>
                            <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="pass_no"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="pass_no" ErrorMessage="Invalid" ValidationExpression="^[a-zA-Z0-9]*$"></asp:RegularExpressionValidator>
                        </div>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <label class="control-label">Passport Side1</label>
                                    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Passport Side2</label>
                                    <asp:FileUpload ID="FileUpload2" runat="server" class="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" ControlToValidate="FileUpload2"></asp:RequiredFieldValidator>
                                </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%--<asp:Button ID="next2" runat="server" class="btn btn-primary nextBtn btn-lg pull-right" Text="Next"></asp:Button>--%>
                        <!--<button class="btn btn-primary nextBtn btn-lg pull-right" type="button">Next</button>-->
                    </div>
                </div>
            </div>

            <div id="step-3" class="col-md-5 col-sm-5 col-xs-14 wow fadeInUp col-md-offset-3 row setup-content">
                <!--callback form div start-->
                <div class="callback">
                    <h3>Payment</h3>

                    <div class="form-group">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem Selected="True">Self</asp:ListItem>
                            <asp:ListItem>Refferal</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Adhar Numbers</label>
                        <asp:DropDownList ID="pass_adhar" runat="server" Enabled="true" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Paid By Adhar No.</label>
                        <asp:TextBox ID="pass_pay_adhar" runat="server" class="form-control" placeholder="Adhar Number" required ReadOnly="True"></asp:TextBox>
                    </div>
                     <div class="form-group">
                    <asp:Button ID="submit" runat="server" CssClass="btn btn-success btn-lg pull-right" Text="Submit" OnClick="submit_Click" />
                    <%--<button class="btn btn-success btn-lg pull-right" type="submit">Submit</button>--%>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
        </form>
</asp:Content>

