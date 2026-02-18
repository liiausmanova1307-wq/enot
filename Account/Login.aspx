<%@ Page Title="Выполнить вход" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TestTest.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="Content/Styles.css" rel="stylesheet">

   <div style="float: right;
    width: 450px;
    padding-top: 15%;">
    <img src="../help.png" style="width: 100px;
    height: 100px; float:left;"/>
       <h3 style="padding-left: 120px;
    padding-top: 25px;
    font-family: cursive;
    color:#A94A5F">Электронный помощник учителя</h3>
</div>
    <div class="testRow" 
    style="        box-shadow: 0px 0px 15px cadetblue;
            width: 400px;
            border-radius: 20px;
            padding: 2px;
            margin: 20px;
        ">
        
    
        <div class="col-md-8" style=" max-width: 100% !important;">
            <section id="loginForm">
                <div class="form-horizontal">
                   
                    
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>

                   

                    <div class="form-group">
                        <h3 style="                                color: #13a0b5;
                                padding-top: 5px;
                                margin-left: 55px;"><%: Title %>.</h3>
                        <hr />
                        <div>
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Логин</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="Поле логина заполнять обязательно." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Пароль</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Поле пароля заполнять обязательно." />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Запомнить меня</asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Выполнить вход" class="btn btn-info" />
                        </div>
                    </div>
                    </div>
                </div>
                
            </section>
        </div>

       
    </div>
</asp:Content>
