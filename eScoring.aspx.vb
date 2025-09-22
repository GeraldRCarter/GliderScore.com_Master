Imports System.Data
Partial Class eScoring
    Inherits System.Web.UI.Page

    Protected Function getReFlightStatus(ByVal dtFlightGroups As DataTable, ByVal i As Integer) As String

        Dim dr As DataRow = dtFlightGroups.Rows(i)
        Dim drPrev As DataRow
        Dim drNext As DataRow

        ' check the previous row to see if the round and group numbers are the same as for this row
        If i > 0 Then
            drPrev = dtFlightGroups.Rows(i - 1)
            If (drPrev("RoundNo") = dr("RoundNo")) And (drPrev("GroupNo") = dr("GroupNo")) Then
                Return "True"
            End If
        End If
        ' check the next row to see if the round and group numbers are the same as for this row
        If i < dtFlightGroups.Rows.Count - 1 Then
            drNext = dtFlightGroups.Rows(i + 1)
            If (drNext("RoundNo") = dr("RoundNo")) And (drNext("GroupNo") = dr("GroupNo")) Then
                Return "True"
            End If
        End If

        Return "False"

    End Function


End Class
