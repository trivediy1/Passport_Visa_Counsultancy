<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="page-loader">
            <asp:Image ID="Image1" runat="server" src="images/loader.gif" alt="loader" />
            <!--<img src="images/loader.gif" alt="loader"/>-->
        </div>
        <!--slider div start-->
        <div class="customtypewowslider fullwidth flexslider clearfix cayman-slider" style="max-height: 500px;">
            <ul class="slides slider-content-style1">
                <li style="background-color: #000000;">
                    <asp:Image ID="Image4" runat="server" src="images/banner/s1.jpg" alt="" Style="opacity: 0.7;" />
                    <!---<img src="images/banner/s1.jpg" alt="" style="opacity: 0.7;"/>-->
                    <div class="flex-caption" style="top: 2%;">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h2 class="wow none" data-wow-duration="1.0s" data-wow-delay="0.1s">Worldwide Travel Visa Consultancy ! Hassle Free Services</h2>
                                    <h1 class="wow fadeInUp" data-wow-duration="1.0s" data-wow-delay="0.6s"><span class="accentcolor">Documentation</span><br />
                                        & Application Support</h1>
                                    <%--                                    <a href="visa-consultancy-services-delhi.html" class="btn btn-ghost wow none">Read More </a>--%>
                                    <a href="ContactUs.aspx" class="btn btn-primary wow none">Quick Contact </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li style="background-color: #000000;">
                    <asp:Image ID="Image3" runat="server" src="images/banner/s2.jpg" alt="" Style="opacity: 0.7;" />
                    <!---<img src="images/banner/s2.jpg" alt="" style="opacity: 0.7;">-->
                    <div class="flex-caption" style="top: 2%;">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h2 class="wow none" data-wow-duration="1.0s" data-wow-delay="0.1s">Passport Consultancy for Delhi & NCR Residents </h2>
                                    <h1 class="wow fadeInUp" data-wow-duration="1.0s" data-wow-delay="0.6s"><span class="accentcolor">Application</span> &amp;<br />
                                        & Docs Guidance</h1>
                                    <%-- <a href="passport-consultancy-services-delhi.html" class="btn btn-ghost wow none">Read More </a>--%>
                                    <a href="ContactUs.aspx" class="btn btn-primary wow none">Quick Contact </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li style="background-color: #000000;">
                    <asp:Image ID="Image2" runat="server" src="images/banner/s3.jpg" alt="" Style="opacity: 0.7;" />
                    <!---<img src="images/banner/s3.jpg" alt="" style="opacity: 0.7;"/>-->
                    <div class="flex-caption" style="top: 2%;">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-2">
                                    <h2 class="wow none" data-wow-duration="1.0s" data-wow-delay="0.1s">Worldwide International Air Ticketing Services </h2>
                                    <h1 class="wow fadeInUp" data-wow-duration="1.0s" data-wow-delay="0.6s"><span class="accentcolor">All Airlines</span><br />
                                        @ Best Mkt Price</h1>
                                    <%--<a href="passport-and-visa-fee.html" class="btn btn-ghost wow none">Read More </a>--%>
                                    <a href="ContactUs.aspx" class="btn btn-primary wow none">Quick Contact </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <!--slider div end-->

        <!-- content div start -->
        <div class="content">
            <div class="container">
                
                                    
                    <div class="col-md-16 col-sm-16 col-xs-10">
                        <!--welcome div start-->
                        <div class="wel">
                            <h1>Welcome To <span>Passport Consultancy Services</span></h1>
                            <div class="text">
                                <div>The best part of going abroad is travelling to a new country. But, the time and money consuming part of it all is getting the visa, Pan Card, Driving Licence, Demat Account, Health Insurance, passport and E-Stamp Paper Vendor. Because this is important for entering in the foreign country as a permit certificate to stay there.</div>
                                <div>
                                    <br />
                                </div>
                                <div>Thus we safe you to wait in long queues for a long time. We value your excitement to the visit to a country. We provide passport and visa at when it required by clients. We specialize in providing fast, authentic and valid passport and visa services. Our company is famous for availing super speed passport and visa services. Therefore we are one of the leading passport and visa service provider in entire country. We solve all the problems related to these services.&nbsp;</div>
                                <div>
                                    <br />
                                </div>
                                <div>We give our clients 100% safety and security in departure and arrival to their destination. These all possible because we drive it by very young and energetic management and highly qualified team to give quick and prompt valid solutions for our clients. For any kind of help visit our company. We will help you to get your passport and visa….</div>
                                <div>
                                    <br />
                                </div>
                                <div>A passport is a document, issued by a national government, which certifies, for the purpose of international travel, the identity and nationality of its holder.</div>
                                <div class="cl"></div>
                            </div>
                        </div>
                        <!--welcome div end-->
                    </div>
                        


                    

                        
                    </div>
                </div>
                <!--content div end-->

                <!--adv box and form div start-->
                <div class="adv_bg">
                    <div class="container">
                        <!--adv box and form div start-->
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-12 wow fadeInLeft">
                                <div class="adv_box">
                                    <img src="images/img1.jpg" alt="" class="img-responsive" />
                                    <div class="adv_box_inner">
                                        <h2>Passport Consultancy</h2>
                                        <p>We specialize in providing fast, authentic and valid passport services</p>
                                        <asp:LinkButton ID="LinkButton1" class="btn more" PostBackUrl="passport-consultancy.aspx" runat="server">Read More</asp:LinkButton>
                                        <!--<a href="passport-consultancy-services-delhi.html" class="btn more">Read More</a>-->
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-4 col-xs-12 wow fadeInUp">
                                <div class="adv_box">
                                    <img src="images/img2.jpg" alt="" class="img-responsive" />
                                    <div class="adv_box_inner">
                                        <h2>Visa Consultancy</h2>
                                        <p>We deal in arranging travel Visa for different countries for you while going abroad...</p>
                                        <asp:LinkButton ID="LinkButton2" class="btn more" PostBackUrl="visa-consultancy.aspx" runat="server">Read More</asp:LinkButton>
                                        <!--<a href="visa-consultancy-services-delhi.html" class="btn more">Read More</a>-->
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-4 col-xs-12 wow fadeInRight">
                                <div class="adv_box">
                                    <img src="images/img3.jpg" alt="" class="img-responsive" />
                                    <div class="adv_box_inner">
                                        <h2>Agents</h2>
                                        <p>Competitive Passport & Travel Visa Consultancy Fee, Contact us for Detals of Charges...</p>
                                        <asp:LinkButton ID="LinkButton3" class="btn more" PostBackUrl="agents.aspx" runat="server">View Agents</asp:LinkButton>
                                        <!--<a href="passport-and-visa-fee.html" class="btn more">Read More</a>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--adv box and form div end-->

                    </div>
                </div>
                <!--adv box and form div end-->

                <!-- about div start -->
                <div class="about">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <img src="images/passport.jpg" class="img-responsive" alt="" />
                            </div>

                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <div class="about">
                                    <h1>About<span> Passport Consultant</span></h1>
                                    <div class="text">
                                        We are a Leading Firm Deals in Travel Visa, New Passport Application & Passport Renewal/Alteration Services. Our clients are drawn from many of Indian’s leading law and accountancy firms as well as members of the public. Our aim is always to provide you with a service that is safe, efficient, cost-effective and tailored to your needs. We take all the hassle out of getting visas and passports, using our many years of experience to ensure you get the service you need
                       
                                <br />
                                      
                        

                                <div class="cl"></div>
                                        <asp:LinkButton ID="LinkButton4" class="btn read" PostBackUrl="passport-consultancy.aspx" runat="server">Read More</asp:LinkButton>
                                        <!--<a class="btn read" href="passport-and-visa-services-company-delhi.html">Read More</a>-->
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--about div end-->

                <!--counter div start-->
                <div class="counter wow bounceInRight">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="funfacts">
                                    <div class="icon"><i class="fa fa-life-ring"></i></div>
                                    <h3>Clients Served</h3>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="funfacts">
                                    <div class="icon"><i class="fa fa-cube"></i></div>
                                    <h3>Satisfied Clients</h3>
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="funfacts">
                                    <div class="icon"><i class="fa fa-globe"></i></div>
                                    <h3>Year of Experience</h3>
                                    
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--counter div end-->

                <!--testimonial div start-->
                <%--<div class="container">
                    <div class="row">

                        <div class="the-headline">
                            <h1>Happy <span>Clients</span></h1>
                            <div class="divider"></div>
                            <h3>JUST LISTEN TO WHAT OUR CLIENTS HAVE TO SAY</h3>
                        </div>

                        <div class="testimonials">
                            <div class="flexslider testimonials-wrapper">
                                <ul class="slides">
                                    <li>
                                        <img src="../www.thelinkindia.com/uploads/testi/59b8185179ee3.gif" alt="Clients" />
                                        <p>Awesome Passport Consultancy Services offered by Passport Consultant. I took a services from these guys for me & my family passport a couple of Month ago. I have got hassle free consultancy at reasonable price</p>
                                        <strong class="signature">- Sunil Mishra</strong>
                                    </li>
                                    <li>
                                        <img src="../www.thelinkindia.com/uploads/testi/59b818e1296dc.gif" alt="Clients" />
                                        <p>I have a good experience with these Firm to get best solution for Passport Consultancy, Travel Visa for UAE & Return Air Tickets for me alone. Thanks for the Nice Co-operation & Excellent Consultancy Services</p>
                                        <strong class="signature">- Prabhakar Sharma</strong>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>--%>
                <!--testimonial div end-->

               
    </form>
</asp:Content>

