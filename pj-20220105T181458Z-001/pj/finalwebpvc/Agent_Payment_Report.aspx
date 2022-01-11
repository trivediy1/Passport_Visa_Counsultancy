<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Admin_Master.master" AutoEventWireup="true" CodeFile="Agent_Payment_Report.aspx.cs" Inherits="finalwebpvc_Agent_Payment_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <form runat="server">
       
       <div class="content">
            <div class="container">
                <div class="row" style="">
                    <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading text-center" style="font-size: 24px">Agents</div>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table" BorderStyle="None" DataKeyNames="Login_Id" GridLines="None" HeaderStyle-BorderStyle="None" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PagerStyle-HorizontalAlign="Center" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="Login_Id" HeaderText="Agent Id" />
                            <asp:BoundField DataField="Name" HeaderText="Agent Name" />
                        </Columns>
                        <HeaderStyle BorderStyle="None"></HeaderStyle>
                        <PagerStyle HorizontalAlign="Center" />
                        
                        </asp:GridView>
                    </div>
                    </div>

                    <div class="col-md-8 col-sm-8 col-xs-12">

                        <div class="col-lg-16 my-auto">
                        <div class="container-fluid">
                            <div class="row center">
                                <div class="col-lg-3">
                                    <div class="feature-item">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/finalwebpvc/images/icons8-passport-50.png" Height="50" Width="50" />
                                        <!--<i class="icon-screen-smartphone"></i>-->
                                        <h4>Passports</h4>
                                        <asp:Label ID="l1" runat="server" Text="0" class="control-label badge" Font-Size="14"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="feature-item">
                                        <!--<i class="icon-camera"></i>-->
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/finalwebpvc/images/icons8-visa-50.png" Height="50" Width="50" />
                                        <h4>Visas</h4>
                                        <asp:Label ID="l2" runat="server" Text="0" class="control-label badge" Font-Size="14"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="feature-item">
                                        <!--<i class="icon-present"></i>-->
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/finalwebpvc/images/icons8-receive-cash-50.png" Height="50" Width="50" />
                                        <h4>Paid Amount</h4>
                                        <asp:Label ID="l3" runat="server" Text="0" class="control-label badge" Font-Size="14"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="feature-item">
                                        <!--<i class="icon-present"></i>-->
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/finalwebpvc/images/icons8-bill-50.png" Height="50" Width="50" />
                                        <h4>Remaining Amount</h4>
                                        <asp:Label ID="l4" runat="server" Text="0" class="control-label badge" Font-Size="14"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />

                    <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading text-center" style="font-size: 24px">Agents Payment</div>
                    <asp:GridView ID="GridView2" runat="server" CssClass="table" BorderStyle="None" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="5"></asp:GridView>
                    </div>
                    </div>
                </div>
            </div>
        </div>
   </form>
</asp:Content>

