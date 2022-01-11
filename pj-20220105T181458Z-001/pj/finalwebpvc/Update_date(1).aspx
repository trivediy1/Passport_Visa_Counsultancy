<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="Update_date.aspx.cs" Inherits="Update_date" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="updatedate" runat="server">

        <div class="content">
            <div class="container">
                <div style="">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div class="col-md-4 col-sm-4 col-xs-12 wow fadeInRight">
                        <!--callback form div start-->
                        <div class="callback">
                            <h3>Passport DOC. Verf Date</h3>
                            <div class="callback_inner">
                                <input name="cu" type="hidden" value="passportconsultant.com" />
                                <input name="cap" type="hidden" value="26b99f526798845d051782d5e1eabb77" />
                                <div class="form-group">
                                    Passport Application Id
                                <asp:DropDownList ID="pass_ser_no" CssClass="form-control" runat="server"></asp:DropDownList>
                                    <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                </div>

                                <div class="form-group">
                                    Document Verification Date
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="pass_date" runat="server" class="form-control" placeholder="dd-mm-yyyy" required="*"></asp:TextBox>
                                            <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ErrorMessage="Please Enter Amount To Be payed" ControlToValidate="pass_date"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  runat="server" ErrorMessage="Please Enter date in dd-mm-yyyy format" ControlToValidate="pass_date" Display="Dynamic"  ValidationExpression="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\d{4}"></asp:RegularExpressionValidator>
                                            <asp:comparevalidator runat="server" Id="CompareEndTodayValidator"  errormessage="The date must be greater than today" controltovalidate="pass_date" Display="Dynamic" type="Date" Operator="GreaterThan"  />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>   
                                   
                                </div>

                                <div class="form-group">
                                    Police Inquiry Date
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="pass_police" runat="server" class="form-control" placeholder="dd-mm-yyyy" required="*"></asp:TextBox>
                                            <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="Please Enter Amount To Be payed" ControlToValidate="pass_police"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please Enter date in dd-mm-yyyy format" ControlToValidate="pass_police" Display="Dynamic"  ValidationExpression="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\d{4}"></asp:RegularExpressionValidator>
                                            <asp:comparevalidator runat="server" Id="Comparevalidator1" errormessage="The date must be greater than today" controltovalidate="pass_police"  Display="Dynamic"  type="Date" Operator="GreaterThan"  />

                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div class="form-group">
                                    
                                    <asp:Button ID="Pay" runat="server" class="btn btn-primary wow none   " Text="Update" required="*" OnClick="Pay_Click" ></asp:Button>
                                    <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                                </div>

                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>
    </form>
</asp:Content>
