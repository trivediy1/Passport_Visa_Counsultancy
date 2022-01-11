<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Agent_Master.master" AutoEventWireup="true" CodeFile="Apply_Passport_part2.aspx.cs" Inherits="finalwebpvc_Apply_Passport_part2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="app2" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <div class="content center">
        <div class="container" style="">
            <div class="col-md-5 col-sm-5 col-xs-14 wow fadeInUp col-md-offset-3 row setup-content">
                <!--callback form div start-->
                <div class="callback">
                    <h3>Passport Details</h3>

                    <div class="callback_inner">
                        <div class="form-group">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <label class="control-label">Passport Service</label>

                                    <asp:DropDownList ID="pass_service" runat="server" CssClass="form-control">
                                        <asp:ListItem Selected="True">New</asp:ListItem>
                                        <asp:ListItem>Re-New</asp:ListItem>
                                        <asp:ListItem>Modification</asp:ListItem>
                                        <asp:ListItem>Cancel</asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                            <br />
                        </div>
                        <div class="form-group">
                            <label class="control-label">Amount</label>
                                    <asp:TextBox ID="pass_amount" runat="server" class="form-control" Columns="20" Rows="5" placeholder="Amount"></asp:TextBox>
                                    <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required="*" />-->
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*" ControlToValidate="pass_amount"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="pass_amount" ErrorMessage="Invalid" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                
                        </div>


                        <div class="form-group">
                            
                                    <label class="control-label">Leaving Certificate</label>
                                    <asp:FileUpload ID="FileUpload5" runat="server" class="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="*" ControlToValidate="FileUpload5"></asp:RequiredFieldValidator>
                                
                               
                        </div>  

                        <div class="form-group">
                            
                                    <label class="control-label">Birth Certificate</label>
                                    <asp:FileUpload ID="FileUpload6" runat="server" class="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*" ControlToValidate="FileUpload6"></asp:RequiredFieldValidator>
                               
                               
                        </div>

                        <div class="form-group">
                            
                                    <label class="control-label">Passport Picture</label>
                                    <asp:FileUpload ID="FileUpload7" runat="server" class="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*" ControlToValidate="FileUpload7"></asp:RequiredFieldValidator>
                   
                                
                        </div>
                        <div class="form-group">
                            
                                    <label class="control-label">Adhar Card</label>
                                    <asp:FileUpload ID="FileUpload8" runat="server" class="form-control" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="*" ControlToValidate="FileUpload8"></asp:RequiredFieldValidator>
                                    
                               
                        </div>

                        <div class="form-group">
                            
                                    <label class="control-label">Primary Document</label>
                                    <asp:DropDownList ID="pass_primarydoct" runat="server" CssClass="form-control">
                                        <asp:ListItem Selected="True">Leaving Certificate</asp:ListItem>
                                        <asp:ListItem>Birth Certificate</asp:ListItem>
                                        <asp:ListItem>Adhar Card</asp:ListItem>
                                    </asp:DropDownList>
                                
                            <br />
                        </div>

                        <%-- <asp:UpdatePanel ID="UpdatePanel24" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="next2" runat="server" AutoPostBack="true" class="btn btn-primary nextBtn btn-lg pull-right" Text="Next"></asp:Button>
                            </ContentTemplate>
                        </asp:UpdatePanel>--%>
                        <!--<button class="btn btn-primary nextBtn btn-lg pull-right" type="button">Next</button>-->
                        <h3>Payment</h3>

                        <div class="form-group">
                            <asp:UpdatePanel ID="UpdatePanel26" runat="server">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                        <asp:ListItem Selected="True">Self</asp:ListItem>
                                        <asp:ListItem>Refferal</asp:ListItem>
                                    </asp:RadioButtonList>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="form-group">
                            <asp:UpdatePanel ID="UpdatePanel27" runat="server">
                                <ContentTemplate>
                                    <label class="control-label">Adhar Numbers</label>
                                    <asp:DropDownList ID="pass_adhar" runat="server" CssClass="form-control">
                                    </asp:DropDownList>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>


                        <div class="form-group">
                            <asp:UpdatePanel ID="UpdatePanel28" runat="server">
                                <ContentTemplate>
                                    <label class="control-label">Paid By Adhar No.</label>
                                    <asp:TextBox ID="pass_pay_adhar" runat="server" class="form-control" placeholder="Adhar Number" required="*" ReadOnly="True"></asp:TextBox>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="form-group">
                            
                                    <asp:Button ID="submit" runat="server" CssClass="btn btn-success btn-lg pull-right" Text="Submit" OnClick="submit_Click" />
                                
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
      </form>
</asp:Content>

