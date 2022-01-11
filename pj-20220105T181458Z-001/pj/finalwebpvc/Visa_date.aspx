<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="Visa_date.aspx.cs" Inherits="finalwebpvc_Visa_date" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="visadate" runat="server">

    <div class="content">
            <div class="container">
                <div  style="">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <div class="col-md-4 col-sm-4 col-xs-12 wow fadeInRight">
                        <!--callback form div start-->
                        <div class="callback">
                            <h3>Visa Interview Date</h3>
                            <div class="callback_inner">
                                <input name="cu" type="hidden" value="passportconsultant.com" />
                                <input name="cap" type="hidden" value="26b99f526798845d051782d5e1eabb77" />
                                <div class="form-group">
                                    Visa Application Id
                                <asp:DropDownList ID="visa_ser_no" CssClass="form-control" runat="server"></asp:DropDownList>
                                    <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                </div>

                                <div class="form-group">
                                    Visa Interview Date
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                        <asp:TextBox ID="visa_date" runat="server" class="form-control" required="*" placeholder="dd-mm-yyyy"></asp:TextBox>
                                        <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please Enter Amount To Be payed" ControlToValidate="visa_date"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ErrorMessage="Please Enter date in dd-mm-yyyy format" ControlToValidate="visa_date" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\d{4}"></asp:RegularExpressionValidator>
                                            <asp:comparevalidator runat="server" Id="CompareEndTodayValidator"  errormessage="The date must be greater than today" controltovalidate="visa_date" Display="Dynamic" type="Date" Operator="GreaterThan"  />
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>

                               
                                <div class="form-group">

                                    <asp:Button ID="Pay" runat="server" class="btn btn-primary wow none   " Text="Update" required="*" OnClick="Update_Click"></asp:Button>
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

