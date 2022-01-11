<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="View_Agent_Customers.aspx.cs" Inherits="View_Agent_Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content">
            <div class="container">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading text-center" style="font-size: 24px">Your Customers</div>
                    <asp:Repeater ID="rptragent" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Customer Id</th>
                                        <th>Name</th>
                                        <th>Email Id</th>
                                        <th>Contact No</th>
                                        <th>Address</th>
                                        <th>City</th>                       
                                        <th>District</th>
                                        <th>State</th>
                                        <th>Pin Code</th>
                                     </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Customer_Id") %></td>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("Email_Id") %></td>
                                <td><%# Eval("Contact_No") %></td>
                                <td><%# Eval("Address") %></td>
                                <td><%# Eval("City") %></td>
                                <td><%# Eval("District") %></td>
                                <td><%# Eval("States") %></td>
                                <td><%# Eval("Pin_Codes") %></td>
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
 
</asp:Content>