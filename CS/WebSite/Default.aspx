<%-- BeginRegion Page setup --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Editors_Lookup_Lookup" %>

<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxCallback"
    TagPrefix="dxcb" %>

<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Implementing lookup functionality using ASPxTextBox</title>
    <style type="text/css">
        * {
            font: 12px Arial, Tahoma;
        }
        .paddingLeft {
            padding-left: 5px;
        }
    </style>
    <script type="text/javascript">
        function OnTextChanged(s, e) {
    UpdateValue();
}
function OnKeyPressed(s, e) {
    if (e.htmlEvent.keyCode == 13)
        UpdateValue();
}
function UpdateValue() {
    loadingStatus.SetText("Loading...");
    var text = tbText.GetText();
    callback.SendCallback(text);
}
function OnHyperLinkClick(s, e) {
    var sampleText = s.GetText();
    tbText.SetValue(sampleText);
    UpdateValue();
}
function OnCallbackComplete(s, e) {
    loadingStatus.SetText("");
    tbValue.SetText(e.result);
}
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        
        <dxcb:ASPxCallback ID="cbCallback" runat="server" ClientInstanceName="callback" OnCallback="OnCallback">
            <ClientSideEvents CallbackComplete="OnCallbackComplete" />
        </dxcb:ASPxCallback>
        
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    Text:
                </td>
                <td class="paddingLeft">
                    <dxe:ASPxTextBox ID="tbText" runat="server" Width="170px">
                        <ClientSideEvents TextChanged="OnTextChanged" KeyPress="OnKeyPressed" />
                    </dxe:ASPxTextBox>
                </td>
                <td class="paddingLeft">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                ( Examples: 
                            </td>
                            <td class="paddingLeft">
                                <dxe:ASPxHyperLink ID="lnkSample1" runat="server" Text="Text #1" Cursor="pointer">
                                    <BorderBottom BorderStyle="Dashed" BorderWidth="1px" />
                                    <ClientSideEvents Click="OnHyperLinkClick" />
                                </dxe:ASPxHyperLink>,
                            </td>
                            <td class="paddingLeft">
                                <dxe:ASPxHyperLink ID="lnkSample2" runat="server" Text="Text #2" Cursor="pointer">
                                    <BorderBottom BorderStyle="Dashed" BorderWidth="1px" />
                                    <ClientSideEvents Click="OnHyperLinkClick" />
                                </dxe:ASPxHyperLink>,
                            </td>
                            <td class="paddingLeft">
                                <dxe:ASPxHyperLink ID="lnkSample3" runat="server" Text="Another text" Cursor="pointer">
                                    <BorderBottom BorderStyle="Dashed" BorderWidth="1px" />
                                    <ClientSideEvents Click="OnHyperLinkClick" />
                                </dxe:ASPxHyperLink>)
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    Value:
                </td>
                <td class="paddingLeft">
                    <dxe:ASPxTextBox ID="tbValue" runat="server" Width="170px" ReadOnly="true" ClientInstanceName="tbValue">
                    </dxe:ASPxTextBox>
                </td>
                <td class="paddingLeft">
                    <dxe:ASPxLabel ID="lblLoadingStatus" runat="server" ClientInstanceName="loadingStatus" />
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>