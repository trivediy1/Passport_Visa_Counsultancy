<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="Agent_Home.aspx.cs" Inherits="finalwebpvc_Agent_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="padding-bottom: 50px; padding-top: 50px">
        <div class="row">
            <span class="label label-primary fadeInUpBig center " runat="server" style="font-size: 30px">Hello Admin!</span>
            <br />
            <asp:Label ID="Admin_Name" CssClass="label label-primary fadeInUpBig center" Font-Size="35px" runat="server"></asp:Label>
        </div>
        <div class="row container">
            <asp:Label ID="Label1" CssClass="label label-primary fadeInUpBig center" Font-Size="35px" runat="server"></asp:Label>

        </div>

    </div>
</asp:Content>
    
