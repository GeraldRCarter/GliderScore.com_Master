Imports System.Data
Imports System.Data.OleDb

Partial Class eScoreInterface


    Inherits System.Web.UI.Page

    Dim sql As String
    Dim cmd As OleDbCommand
    Dim msg As String

    Protected Function getCompName(ByVal CompID As String) As String

        msg = ""

        ' connect to database
        Dim cn As New OleDbConnection
        cn.ConnectionString = ConfigurationManager.ConnectionStrings("cnGliderScore").ConnectionString

        Try
            If cn.State = ConnectionState.Closed Then cn.Open()
        Catch ex As Exception
            msg = "ConnectionToDBFailed"
            If cn.State = ConnectionState.Open Then cn.Close()
            GoTo EndOfFunction
        End Try

        ''**************************************************************************************
        '' check for records in the ScoringData table
        Try
            sql = "SELECT CompData.CompName FROM CompData WHERE CompID='" & CompID & "'"
            cmd = New OleDbCommand(sql, cn)
            If cn.State = ConnectionState.Closed Then cn.Open()
            msg = cmd.ExecuteScalar.ToString
        Catch ex As Exception
            msg = "CheckForCompNameFailed"
            If cn.State = ConnectionState.Open Then cn.Close()
            GoTo EndOfFunction
        End Try

EndOfFunction:

        Return msg

    End Function

End Class
