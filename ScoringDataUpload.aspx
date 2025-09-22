<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ScoringDataUpload.aspx.vb" Inherits="ScoringDataUpload" %>

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
            Case "CheckRoundNoSequence" : CheckRoundNoSequence(CompID, FromRound, ToRound)
            Case "CheckForData" : CheckForData(CompID, FromRound, ToRound)
            Case "RemoveData" : RemoveData(CompID, FromRound, ToRound) ' replaced by InsertDataFromZipFile
            Case "UploadScoringData" : UploadScoringData(CompID, FromRound, ToRound) ' replaced by InsertDataFromZipFile
            Case "UploadCompData" : UploadCompData(CompID)
            Case "UploadTargetTimeByRound" : UploadTargetTimeByRound(CompID)
            Case "UploadF3KData" : UploadF3KData(CompID)
            Case "UploadLandingData" : UploadLandingData(CompID)
            Case "UploadF5KData" : UploadF5KData(CompID)
            Case "UploadF5KBonusData" : UploadF5KBonusData(CompID)
            Case "RemoveAllDataForComp" : RemoveAllDataForComp(CompID)

            Case "InsertDataFromZipFile" : InsertDataFromZipFile(CompID)
            Case "DeleteAllTransferFiles" : DeleteAllTransferFiles(CompID)

        End Select

    End Sub
</script>
