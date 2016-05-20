<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeePages/EmployeeView.Master" AutoEventWireup="true" CodeBehind="LeaveAdd.aspx.cs" Inherits="Employee3.EmployeePages.LeaveAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentScript" ContentPlaceHolderID="scripts" runat="server"> 
     <script>
         $(document).ready(function () {
             $('#<%= dgLeave.ClientID %>').DataTable({
                 responsive: true
             });      
             $('#<%=txtTakenDate.ClientID%>').nepaliDatePicker({
                 onFocus: true,
                 ndpTriggerButton: true,
                 onChange: function () {
                     $('#<%=hdnTakenDate.ClientID%>').val(BS2AD($('#<%=txtTakenDate.ClientID%>').val()));
                     alert($('#<%=hdnTakenDate.ClientID%>').val());
                 }
             });
<%--          $('#<%=txtTakenDate.ClientID%>').change(function () {
              alert(BS2AD($('#<%=txtTakenDate.ClientID%>').val()));

             });--%>
          });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        विदा सम्बन्धी जानकारी
                                    </div>
                                    <table class="table table-striped table-bordered">
                                        <tr>
                                            <td>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <asp:Label ID="lblLeaveType" runat="server" Text="विदाको प्रकार" CssClass="control-label text-center">

                                                            </asp:Label>
                                                            <asp:DropDownList ID="ddlLeaveType" runat="server" CssClass="form-control">
                                                                <asp:ListItem Text="भैपरी बिदा" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="पर्व बिदा" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="विरामी बिदा" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="घर बिदा" Value="4"></asp:ListItem>
                                                                
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <asp:Label ID="lblDaysTaken" runat="server" Text="जम्मा लिएको बिदा" CssClass="control-label" >

                                                            </asp:Label>

                                                            <asp:TextBox ID="txtDaysTaken" runat="server" CssClass="form-control" required>

                                                            </asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <asp:Label ID="lblTakenDate" runat="server" Text="बिदा लिएको मिति" CssClass="control-label">

                                                            </asp:Label>
                                                            <div class="input-group date">
                                                            <asp:TextBox ID="txtTakenDate" runat="server" placeholder="YYYY-MM-DD" CssClass="form-control" style="z-index:0" value="2073-01-01" >
                                                                
                                                            </asp:TextBox>
                                                                <asp:HiddenField ID="hdnTakenDate" runat="server" />
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3">
                                                        <div class="form-group">
                                                            <asp:Label ID="lblNote" runat="server" Text="नोट" CssClass="control-label">

                                                            </asp:Label>

                                                            <asp:TextBox ID="txtNote" runat="server" placeholder="नोट" CssClass="form-control">

                                                            </asp:TextBox>


                                                        </div>
                                                    </div>
                                                   
                                                </div>

                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <asp:Button runat="server" ID="btnAddAnother" type="submit" CssClass="btn btn-primary" Text="ADD LEAVE" OnClick="btnAddAnother_Click"></asp:Button>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <h1></h1>

                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        बिदा सम्बन्धी जानकारी
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <asp:GridView ID="dgLeave" runat="server" AutoGenerateColumns="False" UseAccessibleHeader="true"  CssClass="table table-hover table-striped table-bordered" OnPreRender="dgLeave_PreRender" OnRowCommand="dgLeave_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Id">
                                                    <ItemTemplate>
                                                        <%#Eval("fldLeaveDetailsID") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="fldLeaveID">
                                                    <ItemTemplate>
                                                        <%#Eval("fldLeaveID") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Notes">
                                                    <ItemTemplate>
                                                        <%#Eval("fldNote") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Remove">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkRemove" CssClass="btn btn-danger btn-sm" runat="server" CommandArgument='<%#Eval("fldLeaveDetailsID")%>'  
                                                            CommandName="Remove" OnClientClick="return confirm('Are you sure you want to delete this Education Level?');"><i class="glyphicon glyphicon-remove "></i>  Remove</asp:LinkButton>
                                                         </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
    </div>
</asp:Content>
