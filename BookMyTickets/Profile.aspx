<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BookMyTickets.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="margin-left: 35px">Booking Transaction</h2>
    <div class="row" style="margin-left: 35px; margin-right: 30px">
        <% foreach (var my in bookedmovies)
            { %>

        <div class="card" style="width: 1500px; margin: 10px">
            <div class="card-body">
                <div class="card-title">
                    <h2>Booking ID: <%= my.BOOKINGID%></h2>
                </div>
                <div class="card-text">                  
                    <p class="badge bg-success"><a href="Movies.aspx?Title=<%= my.MOVIENAME%>" style="color:white">Movie: <%= my.MOVIENAME %> </a></p>
                    <p>SEATS: <%= my.NUMBER_OF_SEAT %></p>
                    <p><%= my.SEATS %></p>                  
                </div>               
            </div>
        </div>

        <% } %>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
