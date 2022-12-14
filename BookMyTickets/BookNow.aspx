<%@ Page Title="Movie Booking.." Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookNow.aspx.cs" Inherits="BookMyTickets.BookNow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        body {
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        }

        #Username {
            border: none;
            border-bottom: 1px solid;
        }

        .screen {
            width: 100%;
            height: 20px;
            background: #4388cc;
            color: #fff;
            line-height: 20px;
            font-size: 15px;
        }

        .smallBox::before {
            content: ".";
            width: 15px;
            height: 15px;
            float: left;
            margin-right: 10px;
        }

        .greenBox::before {
            content: "";
            background: Green;
        }

        .redBox::before {
            content: "";
            background: Red;
        }

        .emptyBox::before {
            content ="";
            box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);
            background-color: #ccc;
        }

        .seats {
            border: 1px solid red;
            background: yellow;
        }



        .seatGap {
            width: 40px;
        }

        .seatVGap {
            height: 40px;
        }

        table {
            text-align: center;
        }


        .Displaytable {
            text-align: center;
        }

            .Displaytable td, .Displaytable th {
                border: 1px solid;
                text-align: left;
            }

        textarea {
            border: none;
            background: transparent;
        }



        input[type=checkbox] {
            width: 0px;
            margin-right: 18px;
        }

            input[type=checkbox]:before {
                content: "";
                width: 15px;
                height: 15px;
                display: inline-block;
                vertical-align: middle;
                text-align: center;
                box-shadow: inset 0px 2px 3px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);
                background-color: #ccc;
            }

            input[type=checkbox]:checked:before {
                background-color: Green;
                font-size: 15px;
            }
    </style>
    <style>
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
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <body onload="onLoaderFunc()">

        <br />
        <br />
        <br />
        <br />
        <div class="inputForm">
            <center>
                Name *:
                <asp:Label ID="Username" ClientIDMode="Static" runat="server" Text=""></asp:Label>
                <%--<input type="text" id="Username" required>--%>
                Number of Seats *:
                <input type="number" id="Numseats" required>
                <br />
                <br />
                <button onclick="takeData()">Start Selecting</button>
            </center>
        </div>


        <div class="seatStructure">
            <center>

                <table id="seatsBlock">
                    <p id="notification"></p>
                    <tr>
                        <td colspan="14">
                            <div class="screen">SCREEN</div>
                        </td>
                        <td rowspan="20">
                            <div class="smallBox greenBox">Selected Seat</div>
                            <br />
                            <div class="smallBox redBox">Reserved Seat</div>
                            <br />
                            <div class="smallBox emptyBox">Empty Seat</div>
                            <br />
                        </td>

                        <br />
                    </tr>

                    <tr>
                        <td></td>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>4</td>
                        <td>5</td>
                        <td></td>
                        <td>6</td>
                        <td>7</td>
                        <td>8</td>
                        <td>9</td>
                        <td>10</td>
                        <td>11</td>
                        <td>12</td>
                    </tr>

                    <tr>
                        <td>A</td>
                        <td>
                            <input type="checkbox" class="seats" value="A1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A5"></td>
                        <td class="seatGap"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="A12"></td>
                    </tr>

                    <tr>
                        <td>B</td>
                        <td>
                            <input type="checkbox" class="seats" value="B1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B5"></td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="B6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="B12"></td>
                    </tr>

                    <tr>
                        <td>C</td>
                        <td>
                            <input type="checkbox" class="seats" value="C1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C5"></td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="C6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="C12"></td>
                    </tr>

                    <tr>
                        <td>D</td>
                        <td>
                            <input type="checkbox" class="seats" value="D1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D5"></td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="D6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="D12"></td>
                    </tr>

                    <tr>
                        <td>E</td>
                        <td>
                            <input type="checkbox" class="seats" value="E1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E5"></td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="E6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="E12"></td>
                    </tr>

                    <tr class="seatVGap"></tr>

                    <tr>
                        <td>F</td>
                        <td>
                            <input type="checkbox" class="seats" value="F1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F5"></td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="F6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="F12"></td>
                    </tr>

                    <tr>
                        <td>G</td>
                        <td>
                            <input type="checkbox" class="seats" value="G1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G5"></td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="G6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="G12"></td>
                    </tr>

                    <tr>
                        <td>H</td>
                        <td>
                            <input type="checkbox" class="seats" value="H1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H5"></td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="H6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="H12"></td>
                    </tr>

                    <tr>
                        <td>I</td>
                        <td>
                            <input type="checkbox" class="seats" value="I1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I5"></td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="I6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="I12"></td>
                    </tr>

                    <tr>
                        <td>J</td>
                        <td>
                            <input type="checkbox" class="seats" value="J1"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J2"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J3"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J4"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J5"></td>
                        <td></td>
                        <td>
                            <input type="checkbox" class="seats" value="J6"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J7"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J8"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J9"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J10"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J11"></td>
                        <td>
                            <input type="checkbox" class="seats" value="J12"></td>
                    </tr>


                </table>

                <br />
                <button onclick="updateTextArea()">Confirm Selection</button>
            </center>
        </div>

        <br />
        <br />
        <asp:HiddenField ID="hidden" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hidden2" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hidden3" runat="server"></asp:HiddenField>
        <div class="displayerBoxes">
            <center>
                <table class="Displaytable">
                    <tr>
                        <th>Name</th>
                        <th>Number of Seats</th>
                        <th>Seats</th>
                    </tr>
                    <tr>
                        <td>
                           
                           <textarea id="nameDisplay" name="nameDisplay" runat="server" ClientIDMode="Static"></textarea>
                        </td>
                        <td>
                            <textarea id="NumberDisplay" name="NumberDisplay" runat="server" ClientIDMode="Static"></textarea>
                           
                        <td>
                            <textarea id="seatsDisplay" name="seatsDisplay" runat="server" ClientIDMode="Static"></textarea>
                          
                    </tr>
                </table>
            </center>
        </div>

        <br /><br />
        <div class="row">
            <div class="col-lg-5"></div>
            <div class="col-lg-6">
                <asp:Button ID="Button1" CssClass="button" runat="server" Text="Book Now!!" OnClick="booknow" />
               
            </div>
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <script>

      

        function onLoaderFunc() {
            $(".seatStructure *").prop("disabled", true);
            $(".displayerBoxes *").prop("disabled", true);
        }
        function takeData() {
            if (($("#Numseats").val().length == 0)) {
                alert("Please Enter Number of Seats");
            }
            else {
                $(".inputForm *").prop("disabled", true);
                $(".seatStructure *").prop("disabled", false);
                document.getElementById("notification").innerHTML = "<b style='margin-bottom:0px;background:yellow;'>Please Select your Seats NOW!</b>";
            }
        }


        function updateTextArea() {

            if ($("input:checked").length == ($("#Numseats").val())) {
                $(".seatStructure *").prop("disabled", true);

                var allNameVals = [];
                var allNumberVals = [];
                var allSeatsVals = [];

                //Storing in Array
                allNameVals.push($("#Username").val());
                allNumberVals.push($("#Numseats").val());
                $('#seatsBlock :checked').each(function () {
                    allSeatsVals.push($(this).val());
                });

                //Displaying 
                var username = '<%= Session["name"] %>';
                $('#nameDisplay').val(username);
                
                $('#NumberDisplay').val(allNumberVals);
                $('#seatsDisplay').val(allSeatsVals);

               

                document.getElementById('<%=hidden.ClientID %>').value = document.getElementById('nameDisplay').value;
                document.getElementById('<%=hidden2.ClientID %>').value = document.getElementById('NumberDisplay').value;
                document.getElementById('<%=hidden3.ClientID %>').value = document.getElementById('seatsDisplay').value;
       }
            else {
                alert("Please select " + ($("#Numseats").val()) + " seats")
            }
        }


        function myFunction() {
            alert($("input:checked").length);
        }

      

        $(":checkbox").click(function () {
            if ($("input:checked").length == ($("#Numseats").val())) {
                $(":checkbox").prop('disabled', true);
                $(':checked').prop('disabled', false);
            }
            else {
                $(":checkbox").prop('disabled', false);
            }
        });



    </script>
</asp:Content>
