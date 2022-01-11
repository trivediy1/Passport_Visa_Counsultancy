<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Admin_Master.master" AutoEventWireup="true" CodeFile="Admin_Home_New.aspx.cs" Inherits="finalwebpvc_Admin_Home_New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/new-age.min.css" rel="stylesheet" />
    <link href="css/custome_font.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <div>
            <section class="features" id="features">
                <div class="container">
                    <div class="section-heading text-center">
                        <h2>Hello Admin !</h2>
                        <p class="text-muted">Check out what you can do with your website!</p>
                        <hr />
                    </div>

                    <div class="col-lg-16 my-auto wow">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-4 wow fadeIn fadeInLeftBig">
                                    <div class="feature-item">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/finalwebpvc/images/icons8-Manager Filled_80.png" Height="80" Width="83" />
                                        <!--<i class="icon-screen-smartphone"></i>-->
                                        <h3>Agent</h3>
                                        <asp:Label ID="agt_count" runat="server" Text="0" class="control-label badge" Font-Size="20"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                                <div class="col-lg-4 wow fadeIn fadeInBottomBig">
                                    <div class="feature-item">
                                        <!--<i class="icon-camera"></i>-->
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/finalwebpvc/images/icons8-Passport Filled_80.png" Height="80" Width="83px" />
                                        <h3>Passport</h3>
                                        <asp:Label ID="pass_count" runat="server" Text="0" class="control-label badge" Font-Size="20"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                                <div class="col-lg-4 wow fadeIn fadeInRightBig">
                                    <div class="feature-item">
                                        <!--<i class="icon-present"></i>-->
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/finalwebpvc/images/icons8-Visa Filled_80.png" Height="80" Width="83" />
                                        <h3>Visa</h3>
                                        <asp:Label ID="visa_count" runat="server" Text="0" class="control-label badge" Font-Size="20"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                                 <div class="col-lg-4 wow fadeIn fadeInLeftBig">
                                    <div class="feature-item">
                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/finalwebpvc/images/icons8-receive-cash-filled-80.png" Height="80" Width="83" />
                                        <!--<i class="icon-screen-smartphone"></i>-->
                                        <h3>Recieved Cash</h3>
                                        <asp:Label ID="Label1" runat="server" Text="0" class="control-label badge" Font-Size="20"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                                <div class="col-lg-4 wow fadeIn fadeInBottomBig">
                                    <div class="feature-item">
                                        <!--<i class="icon-camera"></i>-->
                                        <asp:Image ID="Image5" runat="server" ImageUrl="~/finalwebpvc/images/icons8-bill-80.png" Height="80" Width="83px" />
                                        <h3>Remaning Amount</h3>
                                        <asp:Label ID="Label2" runat="server" Text="0" class="control-label badge" Font-Size="20"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                                <div class="col-lg-4 wow fadeIn fadeInRightBig">
                                    <div class="feature-item">
                                        <!--<i class="icon-present"></i>-->
                                        <asp:Image ID="Image6" runat="server" ImageUrl="~/finalwebpvc/images/icons8-money-bag-80.png"  Height="80" Width="83" />
                                        <h3>Total Cash</h3>
                                        <asp:Label ID="Label3" runat="server" Text="0" class="control-label badge" Font-Size="20"></asp:Label>
                                        <p class="text-muted"></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

        </section>
        
    </form>
</asp:Content>

