<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="test_view_visa_agent.aspx.cs" Inherits="finalwebpvc_test_view_visa_agent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
            <div class="container">
                <div class="panel panel-default" >
                    <!-- Default panel contents -->
                    <div class="panel-heading text-center" style="font-size:24px "> Visa</div>
                    <asp:Repeater ID="rptragent" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Visa Serial No</th>
                                        <th>Person_Name</th>
                                        <th>Contact No</th>
                                        <th>Refferal Id</th>
                                        <th>Passport No</th>
                                        <th>Visa Service</th>
                                        <th>Country</th>
                                        <th>Status</th>
                                        <th>Amount</th>
                                        <th>Date Of Apply</th>
                                        <th>Interview date</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Visa_Serial_No") %></td>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("Contact_No") %></td>
                                <td><%# Eval("Customer_Id") %></td>
                                <td><%# Eval("Passport_No") %></td>
                                <td><%# Eval("Visa_Service") %></td>
                                <td><%# Eval("Country") %></td>
                                <td><%# Eval("Status") %></td>
                                <td><%# Eval("Amount") %></td>
                                <td><%# Eval("Date_Of_Applying") %></td>
                                <td><%# Eval("Visa_Interview_Date") %></td>

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

