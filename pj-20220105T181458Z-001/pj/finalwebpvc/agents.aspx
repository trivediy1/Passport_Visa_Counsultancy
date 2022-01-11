<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/MasterPage.master" AutoEventWireup="true" CodeFile="agents.aspx.cs" Inherits="finalwebpvc_agents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="findagent" runat="server" style="min-width:530px">
        <div class="content">
            <div class="container">
                <div class="panel panel-default" >
                    <!-- Default panel contents -->
                    <div class="panel-heading text-center" style="font-size:24px "> Agents</div>
                    <asp:Repeater ID="rptragent" runat="server">
                        <HeaderTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Contact No</th>
                                        <th>Email ID</th>
                                        <th>City</th>
                                        <th>District</th>
                                        <th>State</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("name") %></td>
                                <td><%# Eval("Contact_No") %></td>
                                <td><%# Eval("Email_Id") %></td>
                                <td><%# Eval("City") %></td>
                                <td><%# Eval("District") %></td>
                                <td><%# Eval("States") %></td>

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
    </form>
</asp:Content>

