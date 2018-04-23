Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Collections.Generic

Partial Public Class Editors_Lookup_Lookup
	Inherits System.Web.UI.Page
	' (Value; Text)
	Private Shared ReadOnly data As Dictionary(Of String, String) = New Dictionary(Of String, String)()

	Shared Sub New()
		For i As Integer = 1 To 10
			data.Add("Value #" & i, "Text #" & i)
		Next i
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Private Function GetValueByText(ByVal text As String) As String
		If text Is Nothing Then
			Return String.Empty
		End If
		For Each item As KeyValuePair(Of String, String) In data
			If item.Value = text Then
				Return item.Key
			End If
		Next item
		Return "[not found]"
	End Function
	Protected Sub OnCallback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
		' DEMO
		System.Threading.Thread.Sleep(100)

		Dim text As String = e.Parameter
		e.Result = GetValueByText(text)
	End Sub
End Class

