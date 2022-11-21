<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookMyTickets.WebPages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login In</title>

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

    <section class="sign-in" style="margin-top:50px; overflow-x:hidden">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure>
                            <img src="../Content/Cololib/Clibimages/signin-image.jpg" />
                        </figure>
                        <a href="Register.aspx" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Login In</h2>
                      <%--  <form method="POST" class="register-form" id="login-form">--%>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <asp:TextBox ID="email" ClientIDMode="Static" placeholder="Your Email Address" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <asp:TextBox ID="txt_pwd" type="password" runat="server" ClientIDMode="Static" placeholder="Password"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            <div class="form-group form-button">
                                <asp:Button ID="Button1" style="background-color :blue;color:white" runat="server" Text="Login" OnClick="LoginCourse" />
                            </div>
                       <%-- </form>--%>
                        
                    </div>
                </div>
            </div>
        </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
