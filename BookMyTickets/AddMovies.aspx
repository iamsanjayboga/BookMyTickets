<%@ Page Title="Add Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddMovies.aspx.cs" Inherits="BookMyTickets.AddMovies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        body, div, form, input, select, p {
            padding: 10;
            margin: 10;
            outline: none;
            font-family: Roboto, Arial, sans-serif;
            font-size: 14px;
            color: #666;
            line-height: 22px;
        }

        h1 {
            margin: 15px 0;
            font-weight: 400;
        }

        .testbox {
            display: flex;
            justify-content: center;
            align-items: center;
            height: inherit;
            padding: 30px;
        }

        form {
        }

        input, select, textarea {
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input {
            width: calc(100% - 10px);
            padding: 5px;
        }

        select {
            width: 100%;
            padding: 7px 0;
            background: transparent;
        }

        textarea {
            width: calc(100% - 6px);
        }

        .item {
            position: relative;
            margin: 10px 0;
        }

            .item:hover p, .item:hover i {
                color: #095484;
            }

        input:hover, select:hover, textarea:hover, .preferred-metod label:hover input {
            box-shadow: 0 0 5px 0 #095484;
        }

        .preferred-metod label {
            display: block;
            margin: 5px 0;
        }

        .preferred-metod:hover input {
            box-shadow: none;
        }

        .preferred-metod-item input, .preferred-metod-item span {
            width: auto;
            vertical-align: middle;
        }

        .preferred-metod-item input {
            margin: 0 5px 0 0;
        }

        input[type="date"]::-webkit-inner-spin-button {
            display: none;
        }

        .item i, input[type="date"]::-webkit-calendar-picker-indicator {
            position: absolute;
            font-size: 20px;
            color: #a9a9a9;
        }

        .item i {
            right: 1%;
            top: 30px;
            z-index: 1;
        }

        [type="date"]::-webkit-calendar-picker-indicator {
            right: 0;
            z-index: 2;
            opacity: 0;
            cursor: pointer;
        }

        .btn-block {
            margin-top: 20px;
            text-align: center;
        }

        button {
            width: 150px;
            padding: 10px;
            border: none;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            background-color: #095484;
            font-size: 16px;
            color: #fff;
            cursor: pointer;
        }

            button:hover {
                background-color: #0666a3;
            }

        @media (min-width: 568px) {
            .name-item, .city-item {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }

                .name-item input, .city-item input {
                    width: calc(50% - 20px);
                }

                .city-item select {
                    width: calc(50% - 8px);
                }
        }

        .button {
            background-color: black; /* Green */
            border: none;
            color: white;
            padding: 10px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 12px;
            max-width: 250px;
        }

        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="padding-left:40px;padding-right:40px; margin-top:50px">
    <div class="item" runat="server" id="panel">
        <div class="row">
            <div class="col-lg-4">
                <asp:TextBox ID="title" runat="server" Style="width: 250px" placeholder="Movie Name"></asp:TextBox>
            </div>
            <div class="col-lg-4">
                <asp:TextBox ID="language" runat="server" Style="width: 250px" placeholder="Movie Language"></asp:TextBox>
            </div>
            <div class="col-lg-4">
                <asp:TextBox ID="director" runat="server" Style="width: 250px" placeholder="Director Name"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8">
                <asp:TextBox ID="description" runat="server" Style="width: 100%" placeholder="Description"></asp:TextBox>
            </div>
            <div class="col-lg-4">
                <asp:TextBox ID="release" runat="server" Style="width: 250px" placeholder="Release Date 'DD-MM-YY'"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <asp:DropDownList ID="genre" runat="server" Style="width: 250px">
                    <asp:ListItem Value="301" Text="Action"></asp:ListItem>
                    <asp:ListItem Value="302" Text="Horror"></asp:ListItem>
                    <asp:ListItem Value="303" Text="Crime"></asp:ListItem>
                    <%--  <asp:ListItem Value="304" Text="Family"></asp:ListItem>
                    <asp:ListItem Value="305" Text="Thriller"></asp:ListItem>--%>
                </asp:DropDownList>
            </div>
            <div class="col-lg-4">
                <asp:DropDownList ID="rating" runat="server" Style="width: 250px">
                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                    <asp:ListItem Value="6" Text="6"></asp:ListItem>
                    <asp:ListItem Value="7" Text="7"></asp:ListItem>
                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                    <asp:ListItem Value="9" Text="9"></asp:ListItem>
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-4">
                <asp:TextBox ID="dob" runat="server" Style="width: 250px" placeholder="Actor DOB 'DD-MM-YY'"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <asp:TextBox ID="firstname" runat="server" Style="width: 250px" placeholder="Actor First Name"></asp:TextBox>
            </div>
            <div class="col-lg-4">
                <asp:TextBox ID="lastname" runat="server" Style="width: 250px" placeholder="Actor Last Name"></asp:TextBox>
            </div>
            <div class="col-lg-4">
                <asp:TextBox ID="national" runat="server" Style="width: 250px" placeholder="Nationality"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
            </div>
            <div class="col-lg-8">
                <asp:Button ID="Button2" CssClass="button" runat="server" Text="Publish" OnClick="publish" />
            </div>
        </div>
    </div>


    <asp:GridView ID="GridView1" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="true">
       
    </asp:GridView>
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
