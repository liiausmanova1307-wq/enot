<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TestTest.About" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <link href="Content/Styles.css" rel="stylesheet">

    <div class="divs">

        <div class="findDiv" >
            <asp:TextBox ID="Find" runat="server" class="form-control img"  ></asp:TextBox>
            <asp:Button ID="FindBtn" runat="server" Text="Найти" OnClick="FindBtn_Click"  class="btn btn-info find" />
        </div>

        

            <div id="myModal2" class="modal fade">
                    <div class="modal-dialog" >
                        <div class="modal-content"  >
                            <input type="hidden" id="Hidden1" runat="server" />
                            <div class="modal-header">
                                <asp:label runat="server" Text="Добавить информацию" CssClass="cyrs" ForeColor="#33cccc"/>
                                <button class="close" data-dismiss="modal">x</button>
                            </div>
                            <div class="modal-body" style="width:90%;height:150px;">
                                <asp:label id="NameLabel"  CssClass="cyrs lbl" runat="server" Text="Название" />
                               <textarea type="text" class="test_lbl fon"  id="NameText" runat="server"/>
                            </div>
                            <div class="modal-content" style="width:90%;height:300px; left:10px;border:none"  >
                                <asp:label ID="lbl_Content"  CssClass="cyrs lbl" runat="server" Text="Содержание" />
                               <textarea  id="txt_Content" class="test_lbl2 fon" runat="server"></textarea>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="insertbtn" runat="server" Text="Добавить"  OnClick="insertbtn_Click" class="btn btn-info"  />
                                <button class="btn btn-default"  data-dismiss="modal" >Закрыть</button>
                            </div>
                        </div>
                    </div>
                </div>



        </div >
        <div class="divs">
            <Button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal2" ID="btn_open" runat="server" onclick='<%# "javascript:fetchServerData(\"" + Eval("Id" ) + "\" );" %>' >Добавить информацию</Button>
            <asp:Button id="btn_sort" Text="Сортировать" runat="server" class="btn btn-info my-btn-sort-class" OnClick="btn_sort_Click" />
            <asp:button id="btn_delete" text="Удалить" runat="server" OnClick="btn_delete_Click" class="btn btn-info"   />
             
        </div>
  

    

    <div class="row">
        <div class="col-lg-10" >
            <asp:GridView ID="GridView1" runat="server" PageSize="5" OnRowDataBound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true"  AutoGenerateColumns="False" ShowHeader="false" CssClass="table" RowStyle-CssClass="rows" >
                <Columns >
                    <asp:TemplateField >
                        <ItemTemplate>
                            <asp:CheckBox id="CheckID" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="dn" >
                        <ItemTemplate>
                            <asp:TextBox id="Row_ID" runat="server" Text='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField >
                    <asp:BoundField  DataField="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Content" SortExpression="Content" ItemStyle-Width="300" />
                    <asp:TemplateField >
                        <ItemTemplate >
                            <div class="table-row-div-btn">
                                <Button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" ID="btn_open" runat="server" onclick='<%# "javascript:fetchServerData(\"" + Eval("Id" ) + "\" );" %>' >Просмотр</Button>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate >
                            <div class="table-row-div-btn">
                                <Button type="button" class='<%# "btn btn-info btn_fav_" + Eval("Id" ) %>' ID="btn_AddInFavorites" runat="server" onclick='<%# "javascript:addToFavourites(\"" + Eval("Id" ) + "\" );" %>' >Избранное</Button>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>
        </div>

            
                <div id="myModal" class="modal fade">
                    <div class="modal-dialog" >
                        <div class="modal-content"  >
                            <input type="hidden" id="hdn_id3" runat="server" />
                            <div class="modal-header">
                                <asp:label runat="server" Text="Просмотр информации" CssClass="cyrs" ForeColor="#33cccc"/>
                                <button class="close" data-dismiss="modal">x</button>
                            </div>
                            <div class="modal-body" style="width:90%;height:150px;">
                                <asp:label id="Label1" CssClass="cyrs lbl" runat="server" Text="Название" />
                               <textarea type="text" class="test_lbl" id="test_lbl" runat="server"/>
                            </div>
                            <div class="modal-content" style="width: 90%; height: 300px; border: none; left: 10px"  >
                                 <asp:label ID="Label2" CssClass="cyrs lbl" runat="server" Text="Содержание" />
                               <textarea  id="test_lbl2" class="test_lbl2" runat="server"></textarea>
                            </div>
                            <div class="modal-footer">
                                <asp:button id="btn_upDate" OnClick="btn_upDate_Click" class="btn btn-info" text="Сохранить" runat="server"></asp:button>
                                <button class="btn btn-default"  data-dismiss="modal" >Закрыть</button>
                            </div>
                        </div>
                    </div>
                </div>
           
     
    
<script>
    function fetchServerData(id) {
        console.log("Row ID: ", id);

        $.ajax({
            type: "POST",
            url: '<%= ResolveUrl("About.aspx/FetchInfoData") %>',
            data: `{id: ${id} }`,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var data = response.d;
                console.log("response: ", data.Name);
    
                $('#MainContent_test_lbl').val(data.Name);
                $('#MainContent_test_lbl2').val(data.Content);
                $('#MainContent_hdn_id3').val(data.Id);
            },
            failure: function (response) {
                console.log("failure");
            }
        });
    }

    function addToFavourites(id) {
        $.ajax({
            type: "POST",
            url: '<%= ResolveUrl("About.aspx/AddToFavourites") %>',
            data: `{id: ${id}, <%= $"userName: '{User.Identity.Name}'" %> }`,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                
                $(`.btn_fav_${id}`).each(function () {
                    $(this).hide();
                });
            },
            failure: function (response) {
                console.log("failure");
            }
        });
    }

    
    
        
    //$(document).ready(function () {
    //    $("#MainContent_btn_AddInfo").on('click', function (e) {
    //        display = document.getElementById('insertDiv').style.display;
    //        if (display == "none") {
    //            document.getElementById('insertDiv').style.display = "block";
    //        }
    //        else {
    //            document.getElementById('insertDiv').style.display = "none";
    //        }

    //        e.preventDefault();
    //    });
    //});
</script>

</asp:Content>


