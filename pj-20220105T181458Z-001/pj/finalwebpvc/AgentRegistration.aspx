<%@ Page Title="" Language="C#" MasterPageFile="~/finalwebpvc/Admin_Master.master" AutoEventWireup="true" CodeFile="AgentRegistration.aspx.cs" Inherits="AgentRegistration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="loginform1k" runat="server">

       
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>

        <div class="content center">
            <div class="container" style="">


                <div class="col-md-5 col-sm-5 col-xs-14 wow fadeInUp" style="margin-left: 33.33%; margin-right: 33.33%">
                    <!--callback form div start-->
                    <div class="callback">
                        <h3>Agent Registration</h3>

                        <div class="callback_inner">
                            <div class="form-group">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="Adhar_Card_No" runat="server" class="form-control" AutoPostBack="true" placeholder="Adhar Card No" required="*" OnTextChanged="Adhar_Card_No_TextChanged"></asp:TextBox>
                                        <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="Adhar_Card_No"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Must be a 12 digit number" ControlToValidate="Adhar_Card_No" ValidationExpression="\d{12}"></asp:RegularExpressionValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="form-group">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="First_Name" runat="server" class="form-control" placeholder="First Name" required="*"></asp:TextBox>
                                        <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="First_Name"></asp:RequiredFieldValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="form-group">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="Middle_Name" runat="server" class="form-control" placeholder="Middle Name" required="*"></asp:TextBox>
                                        <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="Middle_Name"></asp:RequiredFieldValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="form-group">
                                <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="Last_Name" runat="server" class="form-control" placeholder="Last Name" required="*"></asp:TextBox>
                                        <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="Last_Name"></asp:RequiredFieldValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="form-group">
                                Gender
                                <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="gender" runat="server" CssClass="form-control">
                                            <asp:ListItem Selected="True">Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <br />
                            </div>


                            <div class="form-group">
                                <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="Address" runat="server" TextMode="MultiLine" class="form-control" Columns="20" Rows="5" placeholder="Address" required="*"></asp:TextBox>
                                        <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ControlToValidate="Address"></asp:RequiredFieldValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <div class="form-group">
                                        <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="Pincode" runat="server" class="form-control" AutoPostBack="true" placeholder="Pincode" required="*" OnTextChanged="Pincode_TextChanged"></asp:TextBox>
                                                <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ControlToValidate="Pincode"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid" ControlToValidate="Pincode" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="form-group">
                                        <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="City" runat="server" class="form-control" AutoPostBack="true" placeholder="City" required="*"></asp:TextBox>
                                                <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="City"></asp:RequiredFieldValidator>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div class="form-group">
                                        <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="District" runat="server" class="form-control" AutoPostBack="true" placeholder="District" required="*"></asp:TextBox>
                                                <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ControlToValidate="District"></asp:RequiredFieldValidator>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div class="form-group">
                                        <asp:UpdatePanel ID="UpdatePanel13" runat="server">
                                            <ContentTemplate>
                                                <asp:TextBox ID="State" runat="server" class="form-control" AutoPostBack="true" placeholder="State" required="*"></asp:TextBox>
                                                <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ControlToValidate="State"></asp:RequiredFieldValidator>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>



                            <div class="form-group">
                                <asp:UpdatePanel ID="UpdatePanel14" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="Contact_No" runat="server" class="form-control" placeholder="Contact No" required="*"></asp:TextBox>
                                        <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="Contact_No"></asp:RequiredFieldValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <div class="form-group">
                                <asp:UpdatePanel ID="UpdatePanel15" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="Email_Id" runat="server" class="form-control" placeholder="Email Id" required="*"></asp:TextBox>
                                        <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="Email_Id"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email_Id" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <div class="form-group">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="User_Name" runat="server" class="form-control" AutoPostBack="true" placeholder="User Name" required="*" OnTextChanged="User_Name_TextChanged"></asp:TextBox>
                                        <!--<input name="Name" type="text" class="form-control" id="Name" placeholder="Name" required />-->
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ControlToValidate="User_Name"></asp:RequiredFieldValidator>
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>


                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control" placeholder="Password" required="*"></asp:TextBox>
                                <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="Password"></asp:RequiredFieldValidator>
                                <%-- <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    
                                 <cc1:PasswordStrength
                                    id="PasswordStrength2"
                                    runat="server" 
                                    displayposition="RightSide" 
                                    strengthindicatortype="BarIndicator" 
                                    targetcontrolid="Password" 
                                    prefixtext="Stength:" 
                                    enabled="true" 
                                    requiresupperandlowercasecharacters="true" 
                                    minimumlowercasecharacters="1" 
                                    minimumuppercasecharacters="1" 
                                    minimumsymbolcharacters="1" 
                                    minimumnumericcharacters="1" 
                                    preferredpasswordlength="6" 
                                    textstrengthdescriptions="VeryPoor; Weak; Average; Strong; Excellent" 
                                    strengthstyles="VeryPoor; Weak; Average; Excellent; Strong;" 
                                    calculationweightings="25;25;15;35" 
                                    barbordercssclass="border" 
                                    helpstatuslabelid="Label1"> 
                                </cc1:PasswordStrength>--%>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="Confirm_Password" runat="server" TextMode="Password" class="form-control" placeholder="Confirm Password" required="*"></asp:TextBox>
                                <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="Password"></asp:RequiredFieldValidator>

                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Does not match" ControlToCompare="Password" ControlToValidate="Confirm_Password"></asp:CompareValidator>

                            </div>

                            <div class="form-group">
                                Date of Birth
                                
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="dob_tb" runat="server" required="*" class="form-control" placeholder="dd-mm-yyyy"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="*" ControlToValidate="dob_tb"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please Enter date in dd-mm-yyyy format" ControlToValidate="dob_tb" ValidationExpression="(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-]\d{4}" Display="Dynamic"></asp:RegularExpressionValidator>
                                        <asp:comparevalidator runat="server" Id="CompareEndTodayValidator" errormessage="The date must be less than today" controltovalidate="dob_tb" type="Date"  Operator="LessThan" Display="Dynamic" />
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <div class="form-group">
                                <asp:Button ID="Register" runat="server" class="btn btn-primary wow none" Text="Register" required="*" OnClick="Register_Click"></asp:Button>
                                <!--<input name="Mobile" type="text" class="form-control" id="Mobile" placeholder="Mobile" required />-->
                            </div>

                        </div>
                    </div>
                    <!--callback form div end-->
                </div>
                &nbsp;
            </div>
        </div>

    </form>
</asp:Content>
