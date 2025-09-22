<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ScoringDataDownload.aspx.vb" Inherits="ScoringDataDownload" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>--%>

<script runat="server">
    Protected Overrides Sub OnLoad(ByVal e As EventArgs)
        MyBase.OnLoad(e)

        Dim Action As String = Request.QueryString("ACTION")
        Dim CompID As String = Request.QueryString("ID") ' compID
        Dim FromRound As Integer = Request.QueryString("FR") ' From round
        Dim ToRound As Integer = Request.QueryString("TR") ' To round
        Select Case Action
            Case "CheckScoresExist" : CheckScoresExist(CompID, FromRound, ToRound)
            Case "CheckNewScoresExist" : CheckNewScoresExist(CompID, FromRound, ToRound)
            Case "DownloadScoringData" : DownloadScoringData(CompID, FromRound, ToRound)
            Case "DeleteDownloadFile" : DeleteDownloadFile(CompID)

            Case "CreateScoringDataAsZipArchive"
                DownloadScoringData(CompID, 1, 99)
                CreateScoringDataAsZipArchive(CompID)
        End Select

    End Sub
</script>


