<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_View_Agents.aspx.cs" Inherits="Admin_View_Agents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading text-center" style="font-size: 24px">Agents</div>
                    <asp:Repeater ID="rptragent" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>User Name</th>
                                        <th>Contact No</th>
                                        <th>Email ID</th>
                                        <th>Address</th>
                                        <th>City</th>
                                        <th>District</th>
                                        <th>State</th>
                                        <th>Pincode</th>
                                        <th>Adhar Card No</th>
                                        <th>Remaining Amount</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("Username") %></td>
                                <td><%# Eval("Contact_No") %></td>
                                <td><%# Eval("Email_Id") %></td>
                                <td><%# Eval("Address") %></td>
                                <td><%# Eval("City") %></td>
                                <td><%# Eval("District") %></td>
                                <td><%# Eval("States") %></td>
                                <td><%# Eval("Pin_Code") %></td>
                                <td><%# Eval("Adhar_Card_No") %></td>
                                <td><%# Eval("Remaining_Amount") %></td>


                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <!-- Table -->



                </div>
            </div>
        </div>
    </div>


</asp:Content>
