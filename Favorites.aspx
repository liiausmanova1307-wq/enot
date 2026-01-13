<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="TestTest.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Styles.css" rel="stylesheet">
    <link href="Content/Site.css" rel="stylesheet">
   

    <div class="divs">
    <div class="findDiv" >
            
            <asp:TextBox ID="Find2" runat="server" class="form-control img"  ></asp:TextBox>
            <asp:Button ID="FindBtn2" runat="server" Text="Найти" OnClick="FindBtn2_Click" class="btn btn-info find" />
        </div>
</div>
    <div class="divs">
            <asp:Button id="btn_sort2" Text="Сортировать" runat="server"  class="btn btn-info my-btn-sort-class" OnClick="btn_sort2_Click" />
            <asp:button id="btn_delete2" text="Удалить" runat="server" OnClick="btn_delete2_Click" class="btn btn-info"   />
            
        </div>
    

    <div class="row">
        <div class="col-lg-10" >
            <asp:GridView ID="GridView2" runat="server" PageSize="5" OnPageIndexChanging="GridView2_PageIndexChanging" AllowPaging="true"  AutoGenerateColumns="False" ShowHeader="false" CssClass="table" RowStyle-CssClass="rows"  >
                <Columns >
                    <asp:TemplateField >
                        <ItemTemplate>
                            <asp:CheckBox id="CheckID2" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="dn" >
                        <ItemTemplate>
                            <asp:TextBox id="Row_ID2" runat="server" Text='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField >
                    <asp:BoundField  DataField="Name" SortExpression="Name"/>
                    <asp:BoundField DataField="Content" SortExpression="Content" />
                    <asp:TemplateField >
                        <ItemTemplate >
                            <div class="table-row-div-btn">
                            <Button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" ID="btn_open2" runat="server" onclick='<%# "javascript:fetchServerData(\"" + Eval("Id" ) + "\" );" %>' >Просмотр</Button>
                        </div>
                                </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
        </div>

            
                <div id="myModal" class="modal fade" >
                    <div class="modal-dialog" >
                        <div class="modal-content"  >
                            <input type="hidden" id="hdn_id4" runat="server" />
                            <div class="modal-header">
                                <asp:label runat="server" Text="Просмотр информации" CssClass="cyrs" ForeColor="#33cccc"/>
                                <button class="close" data-dismiss="modal">x</button>
                            </div>
                            <div class="modal-body" style="width:90%;height:150px;">
                                <asp:label id="Label1" CssClass="cyrs lbl" runat="server" Text="Название" />
                               <textarea readonly="readonly" type="text"  class="test_lbl" id="test_lbl" runat="server"/>
                            </div>
                            <div class="modal-content" style="width: 90%; height: 300px; border: none; left: 10px" >
                                <asp:label ID="Label2" CssClass="cyrs lbl" runat="server" Text="Содержание" />
                               <textarea readonly="readonly" id="test_lbl5" class="test_lbl2" runat="server"></textarea>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-default" data-dismiss="modal" >Закрыть</button>
                            </div>
                        </div>
                    </div>
                </div>
           
     
    
<script>
    function fetchServerData(id) {
        console.log("Row ID: ", id);

        $.ajax({
            type: "POST",
            url: '<%= ResolveUrl("Favorites.aspx/FetchInfoData") %>',
            data: `{id: ${id} }`,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var data = response.d;
                console.log("response: ", data.Name);
    
                $('#MainContent_test_lbl').val(data.Name);
                $('#MainContent_test_lbl5').val(data.Content);
                $('#MainContent_hdn_id4').val(data.Id);
            },
            failure: function (response) {
                console.log("failure");
            }
        });
    }
    </script>
</asp:Content>
