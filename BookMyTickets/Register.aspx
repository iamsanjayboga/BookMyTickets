<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookMyTickets.WebPages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up</title>

    <!-- Font Icon -->
    <%--<link rel="stylesheet" href="Cololib/fonts/material-icon/css/material-design-iconic-font.min.css">--%>
    <link href="../Content/Cololib/fonts/material-icon/css/material-design-iconic-font.min.css" rel="stylesheet" />
    <!-- Main css -->
    <link href="../Content/Cololib/css/style.css" rel="stylesheet" />
 <%--   <link rel="stylesheet" href="Cololib/css/style.css">--%>

    <!-- JS --> 
    <script src="../Content/Cololib/vendor/jquery/jquery.min.js"></script>
    <script src="../Content/Cololib/js/main.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="signup" style="margin-top:50px">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <%--<form method="POST" class="register-form" id="register-form">--%>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <%--<input type="text" name="name" id="name" placeholder="Your Name"/>--%>
                                <asp:TextBox ID="username" ClientIDMode="Static" placeholder="Your Name" ValidateRequestMode="Enabled" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <%--<input type="email" name="email" id="email" placeholder="Your Email"/>--%>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>                                  
                                <asp:TextBox ID="email" ClientIDMode="Static"  placeholder="Your Email Address" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <%--<input type="password" runat="server" name="pass" id="password" placeholder="Password"/>--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password Required" ControlToValidate="txt_pwd"></asp:RequiredFieldValidator> 
                                <asp:TextBox ID="txt_pwd" type="password" runat="server" ClientIDMode="Static" placeholder="Password"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <input required type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <%--<input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>--%>
                                <asp:Button ID="Button1" style="background-color :blue;color:white" runat="server" Text="Register" OnClick="RegisterCourse" />
                            </div>
                       <%-- </form>--%>
                    </div>
                    <div class="signup-image">
                        <figure><img src="../Content/Cololib/Clibimages/signup-image.jpg" /></figure>
                        
                        
                        <a href="Login.aspx" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
