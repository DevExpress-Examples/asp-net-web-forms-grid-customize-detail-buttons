<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASPxGridView - How to customize detail buttons</title>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsMaster" KeyFieldName="CategoryID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="CategoryID" />
            <dx:GridViewDataTextColumn FieldName="CategoryName" />
            <dx:GridViewDataTextColumn FieldName="Description" />
            <dx:GridViewDataColumn Name="New">
                <DataItemTemplate>
                    <dx:ASPxImage ID="ASPxImage1" runat="server" Cursor="pointer" OnInit="ASPxImage1_Init" />
                </DataItemTemplate>
            </dx:GridViewDataColumn>
        </Columns>
        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dsDetail"
                    KeyFieldName="ProductID" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ProductID" />
                        <dx:GridViewDataTextColumn FieldName="ProductName" />
                        <dx:GridViewDataTextColumn FieldName="CategoryID" />
                        <dx:GridViewDataTextColumn FieldName="UnitPrice" />
                    </Columns>
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
        <SettingsDetail ShowDetailRow="True" ShowDetailButtons="False" />
    </dx:ASPxGridView>
    <asp:AccessDataSource ID="dsMaster" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Categories]" />
    <asp:AccessDataSource ID="dsDetail" runat="server" DataFile="~/App_Data/nwind.mdb"
        SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice] FROM [Products] WHERE ([CategoryID] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    </form>
</body>
</html>
