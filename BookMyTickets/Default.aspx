<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BookMyTickets._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .mySlides {
            display: none;
        }

        .card {
            height: 350px;
        }

            .card:hover {
                box-shadow: -1px 9px 40px -12px #808080;
            }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <img class="mySlides" src="Content/images/Untitled-1.jpg">
        <img class="mySlides" src="Content/images/Untitled-2.jpg">
        <img class="mySlides" src="Content/images/Untitled-3.jpg">
        <img class="mySlides" src="Content/images/Untitled-4.jpg">
        <img class="mySlides" src="Content/images/Untitled-5.jpg">
        <img class="mySlides" src="Content/images/Untitled-6.jpg">
        <img class="mySlides" src="Content/images/Untitled-7.jpg">
    </div>
    <br />
    <br />

  

    <%-- Advance Seach Begin --%>

    <div class="row" style="margin-left: 25px; margin-right: 50px; border-radius: 10px">

        <div class="col-lg-2" style="margin: 10px">
            <asp:DropDownList CssClass="btn btn-success" ID="DropDownList1" Style="width: 100%; background: #0094ff" runat="server">
                <asp:ListItem Text="Pick one" Value="Pick one"></asp:ListItem>
                <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                <asp:ListItem Text="Crime" Value="Crime"></asp:ListItem>
                <asp:ListItem Text="Action" Value="Action"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-lg-2" style="margin: 10px">
            <asp:DropDownList CssClass="btn btn-success" ID="DropDownList2" Style="width: 100%; background: #0094ff" runat="server">
                <asp:ListItem Text="Pick one" Value="Pick one"></asp:ListItem>
                <asp:ListItem Text="English" Value="English"></asp:ListItem>
                <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
            </asp:DropDownList>
        </div>
<%--        <div class="col-lg-6">
            <asp:TextBox ID="TextBox1" CssClass="btn btn-success" runat="server"></asp:TextBox>
        </div>--%>
        <div class="col-lg-2" style="margin: 10px">
            <asp:Button CssClass="btn btn-success" OnClick="filterClick" ID="Button1" runat="server" Style="width: 100%; background: #0094ff" Text="Search Now" />
        </div>
    </div>
    <%-- Advance Search Ends --%>

    <div class="row" style="margin-left: 35px; margin-right: 30px">
        <% foreach (var my in filter)
            { %>

        <div class="card" style="width: 20em; margin: 10px">
            <div class="card-body">
                <div class="card-title">
                    <h2><%= my.Title%></h2>
                </div>
                <div class="card-text">
                    <p class="badge bg-success">IMDB: <%= my.Rating %></p>
                    <p>Genre: <%= my.Genre %></p>
                    <p><%= my.Language %></p>
                    <p><%= my.Description%></p>
                </div>
                <a href="Movies.aspx?Title=<%= my.Title%>" class="btn btn-primary">Load More..</a>
            </div>
        </div>

        <% } %>
    </div>

    <div class="row">
        <div class="col-lg-2" style="background-color: #002b36; margin-left: 65px; margin-top: 30px">
            <h6 style="color: white; text-align: center; font-weight: 600">Popular Movies..</h6>
        </div>
        <div class="col-lg-10"></div>
    </div>

    <div class="row" style="margin-left: 35px; margin-right: 30px">
        <% foreach (var my in Sites)
            { %>

        <div class="card" style="width: 20em; margin: 10px">
            <div class="card-body">
                <div class="card-title">
                    <h2><%= my.Title%></h2>
                </div>
                <div class="card-text">
                    <p class="badge bg-success">IMDB: <%= my.Rating %></p>
                    <p>Genre: <%= my.Genre %></p>
                    <p><%= my.Language %></p>
                    <p><%= my.Description%></p>
                </div>
                <a href="Movies.aspx?Title=<%= my.Title%>" class="btn btn-primary">Load More..</a>
            </div>
        </div>

        <% } %>
    </div>

    <div class="row">
        <div class="col-lg-2" style="background-color: #002b36; margin-left: 65px; margin-top: 30px; width: auto">
            <h6 style="color: white; text-align: center; font-weight: 600">UnderRated Movies</h6>
        </div>
        <div class="col-lg-10"></div>
    </div>

    <div class="row" style="margin-left: 35px; margin-right: 30px">
        <% foreach (var my in NonPop)
            { %>

        <div class="card" style="width: 20em; margin: 10px">
            <div class="card-body">
                <div class="card-title">
                    <h2><%= my.Title%></h2>
                </div>
                <div class="card-text">
                    <p class="badge bg-success">IMDB: <%= my.Rating %></p>
                    <p>Genre: <%= my.Genre %></p>
                    <p><%= my.Language %></p>
                    <p><%= my.Description%></p>
                </div>
                <a href="Movies.aspx?Title=<%= my.Title%>" class="btn btn-primary">Load More..</a>
            </div>
        </div>

        <% } %>
    </div>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">

    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) { myIndex = 1 }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 5000); // Change image every 2 seconds
        }

        function functioncall(str) {
            window.location.href = "Movies.aspx?" + str;
        }

        $("#Card2").click(function () {
            alert('button clicked');
        }
        );
    </script>

</asp:Content>
