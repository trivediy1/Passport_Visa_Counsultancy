<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="Customer_Payment.aspx.cs" Inherits="Customer_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="cp" runat="server">
        <div class="content">
            <div class="container">
                <div class="row" style="">
                    <div class="col-md-8 col-sm-8 col-xs-12">
                        <!--welcome div start-->
                        <div class="wel">
                            <div class="panel-heading text-center " style="font-size: 24px">Customers</div>
                            <asp:Repeater ID="rptragent" runat="server">
                                <HeaderTemplate>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Customer Id</th>
                                                <th>Name</th>
                                                <th>Contact No</th>
                                                <th>Remaining Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Customer_Id") %></td>
                                        <td><%# Eval("name") %></td>
                                        <td><%# Eval("Contact_No") %></td>
                                        <td><%# Eval("Remaining_Amount") %></td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                            </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <!--welcome div end-->
                    </div>



                    <div class="col-md-4 col-sm-4 col-xs-12 wow fadeInRight">
                        <!--callback form div start-->
                        <div class="callback">
                            <h3>Customer Payment</h3>
                            <div class="callback_inner">
                                <input name="cu" type="hidden" value="passportconsultant.com" />
                                <input name="cap" type="hidden" value="26b99f526798845d051782d5e1eabb77" />
                                <div class="form-group">
                                    Enter Customer Id
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                                    <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                </div>

                                <div class="form-group">
                                    Pay Rs.
                                <asp:TextBox ID="Pay_Amount" runat="server" class="form-control" placeholder="" required></asp:TextBox>
                                    <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Amount To Be payed" ControlToValidate="Pay_Amount"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid" ControlToValidate="Pay_Amount" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">

                                    <asp:Button ID="Pay" runat="server" class="btn btn-primary wow none   " Text="Pay" required OnClick="Pay_Click"></asp:Button>
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
