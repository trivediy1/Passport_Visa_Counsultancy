<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testsms.aspx.cs" Inherits="finalwebpvc_testsms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="no" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
    </div>
    </form>
</body>
</html>
