<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="pioplesAccount.aspx.cs" Inherits="TestTest.pioplesAccount" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <link href="Content/Styles.css" rel="stylesheet">


    <div>
        <div>

        </div>

        <div>

        </div>

        <div>

        </div>

        <div>

        </div>
    </div>

    <div>

    </div>

    <div>
        <div>
            <asp:GridView runat="server">

            </asp:GridView>
        </div>
    </div>

    <div id="myModal2" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content" >
                            <input type="hidden" id="hdn_id4" runat="server" />
                            <div class="modal-header">
                                <button class="close" data-dismiss="modal">x</button>
                            </div>
                            <div class="modal-body">
                               <input type="text" id="lbl_email" runat="server"/>
                            </div>
                            <div class="modal-content">
                               <input type="text" id="lbl_password" runat="server"/>
                            </div>
                            <div class="modal-footer">
                                <asp:button id="btn_upDate2" OnClick="btn_upDate2_Click" text="Сохранить" runat="server"></asp:button>
                                <button class="close" data-dismiss="modal">Закрыть</button>
                            </div>
                        </div>
                    </div>
                </div>

    </asp:Content>
