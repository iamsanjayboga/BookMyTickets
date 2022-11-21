<%@ Page Title="Movie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="BookMyTickets.Movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .carddesign {
            height: 379px;
            width: 300px;
            background: grey;
            border-radius: 10px;
            transition: background 0.8s;
            overflow: hidden;
            background: black;
            /*box-shadow: 0 70px 63px -60px #000000;*/
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .card2 {
            background: url('Content/images/Movies/Bajrangi.jpg') center center no-repeat;
            background-size: 300px;
        }

        .border {
            height: 369px;
            width: 290px;
            background: transparent;
            border-radius: 10px;
            transition: border 1s;
            position: relative;
        }

        .button-28 {
            appearance: none;
            background-color: transparent;
            border: 2px solid #1A1A1A;
            border-radius: 15px;
            box-sizing: border-box;
            color: #3B3B3B;
            cursor: pointer;
            display: inline-block;
            font-family: Roobert,-apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
            font-size: 16px;
            font-weight: 600;
            line-height: normal;
            margin: 0;
            min-height: 60px;
            min-width: 0;
            outline: none;
            padding: 16px 24px;
            text-align: center;
            text-decoration: none;
            transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            width: 20%;
            will-change: transform;
        }

        .button-28:disabled {
            pointer-events: none;
        }

        .button-28:hover {
            color: #fff;
            background-color: #1A1A1A;
            box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
            transform: translateY(-2px);
        }

        .button-28:active {
            box-shadow: none;
            transform: translateY(0);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card" style="width: 1300px; margin: 10px">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-3">
                    <div class="carddesign card2" id="Card2" runat="server">
                        <div class="border">
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="card-title">
                        <h1>
                            <asp:Label ID="title" runat="server" Text="Label"></asp:Label>
                        </h1>
                    </div>
                    <div class="card-text">
                        <br />
                        <h4>
                            <asp:Label CssClass="badge bg-success" ID="rating" runat="server" Text="IMDB: "></asp:Label></h4>

                        <br />
                        <h5>
                            <asp:Label ID="description" runat="server" Text="Label"></asp:Label></h5>

                        <br />
                        <h4>
                            <asp:Label ID="Lang" runat="server" Text="Label"></asp:Label></h4>
                        <br />
                        <div class="row">
                            <div class="col-lg-2">
                                <h4>
                                    <asp:Label ID="genre" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                            <div class="col-lg-4">
                                <h4>
                                    <asp:Label ID="release" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <h4>
                                    <asp:Label CssClass="badge bg-info" ID="actor" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                            <div class="col-lg-4">
                                <h4>
                                    <asp:Label CssClass="badge bg-danger" ID="director" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                        <br />
                        <asp:Button ID="bookmovie" OnClick="ProceedToSeat" CssClass="button-28" runat="server" Text="Researve your Seat!!" />
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>
