<%@ Page Title="Регистрация" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TestTest.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <link href="../Content/Styles.css" rel="stylesheet">
   

    <div class="divs">
        
            <Button type="button" style="margin: 20px 0px;" class="btn btn-info" data-toggle="modal" data-target="#myModal3" ID="btn_open" runat="server"  >Добавить нового пользователя</Button>
        </div>

     <div id="myModal3" class="modal fade">
         <div class="modal-dialog" >
             <div class="modal-content" style="width:400px" >
                 <div class="modal-header">
                     <asp:label runat="server" Text="Добавление нового пользователя" CssClass="cyrs" ForeColor="#33cccc"/>
                                <button class="close" data-dismiss="modal">x</button>
                     </div>
                       <div class="modal-body" style="width:90%;height:410px;">
                            <p class="text-danger">
                           <asp:Literal runat="server" ID="ErrorMessage" />
                          </p>
                       <div class="form-horizontal">
                     <asp:ValidationSummary runat="server" CssClass="text-danger" />
                     <div>
                       <asp:Label runat="server" AssociatedControlID="Email" Style="color: #F68181;"  CssClass="cyrs lbl">Адрес электронной почты</asp:Label>
                    <div class="col-md-10">
                         <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                         <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="Поле адреса электронной почты заполнять обязательно." />
                    </div>
              </div>
                    <div >
                        <asp:Label runat="server" AssociatedControlID="Password" Style="color: #F68181;" CssClass="cyrs lbl">Пароль</asp:Label>
                            <div class="col-md-10">
                               <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                               <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Поле пароля заполнять обязательно." />
                           </div>
                   </div>
                     <div>
                         <asp:Label runat="server" AssociatedControlID="ConfirmPassword" Style="color: #F68181;"  CssClass="cyrs lbl">Подтверждение пароля</asp:Label>
                              <div class="col-md-10">
                                  <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                                  <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="Поле подтверждения пароля заполнять обязательно." />
                                  <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="Пароль и его подтверждение не совпадают." />
                             </div>
                     </div>
                             <div>
            <%--<asp:Label runat="server" AssociatedControlID="EmailConfirmed" CssClass="col-md-2 control-label">Права администратора</asp:Label>--%>
                                 <div class="col-md-10">
                                      <asp:CheckBox runat="server" ID="EmailConfirmed" Style="                                              width: 240px;
                                              margin-top: 15px;
                                              margin-bottom: 5px
                                      " Text="Права администратора" CssClass="form-control check" />
                                 </div>
                             </div>
        
        </div>
    </div>
                 <div class="modal-footer">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Регистрация" class="btn btn-info" />
                </div>
                 </div>
             </div>
         </div>
    
    <div class="row">
        <div class="col-lg-10" >
            <asp:GridView ID="Register_View" runat="server" Style="width:121%" PageSize="5" AllowPaging="True"  AutoGenerateColumns="False" ShowHeader="true" CssClass="table" AllowSorting="True" CaptionAlign="Top" >
                <Columns >
                    <asp:TemplateField ItemStyle-CssClass="dn" HeaderStyle-CssClass="dn" >
                        <ItemTemplate>
                            <asp:TextBox id="Row_ID" runat="server" Text='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField >
                    <asp:BoundField  DataField="Email" HeaderText="Email"/>
                    <asp:BoundField  DataField="EmailConfirmed" HeaderText="Is Admin"/>
                  <asp:TemplateField >
                        <ItemTemplate >
                            <div class="table-row-div-btn">
                                <asp:Button ID="reg_delete_btn" CommandName='<%# Eval("Id") %>' runat="server" Text="Удалить" OnClick="reg_delete_btn_Click" CssClass="btn btn-info" CausesValidation="False" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
        </div>

</asp:Content>
