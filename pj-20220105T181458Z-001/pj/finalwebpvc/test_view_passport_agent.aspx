<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="test_view_passport_agent.aspx.cs" Inherits="finalwebpvc_test_view_passport_agent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
            <div class="container">
                <div class="panel panel-default" >
                    <!-- Default panel contents -->
                    <div class="panel-heading text-center" style="font-size:24px "> Passport</div>
                    <asp:Repeater ID="rptragent" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Passport Serial No</th>
                                        <th>Person_Name</th>
                                        <th>Contact No</th>
                                        <th>Refferal Id</th>
                                        <th>Passport Service</th>
                                        <th>Status</th>
                                        <th>Amount</th>
                                        <th>Date Of Apply</th>
                                        <th>Document Verification Date</th>
                                        <th>Police Inquiry Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Passport_Serial_No") %></td>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("Contact_No") %></td>
                                <td><%# Eval("Customer_Id") %></td>
                                <td><%# Eval("Passport_Service") %></td>
                                <td><%# Eval("Status") %></td>
                                <td><%# Eval("Amount") %></td>
                                <td><%# Eval("Date_Of_Applying") %></td>
                                <td><%# Eval("Document_Verification_Date") %></td>
                                <td><%# Eval("Police_Inquiry_Date") %></td>

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

