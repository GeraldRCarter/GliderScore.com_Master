
Partial Class MasterPage1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        ' Disable ExpandDepth if the TreeView's expand/collapse
        ' state is stored in session.

        If ViewState("TreeViewState") IsNot Nothing Then
            TreeView1.ExpandDepth = -1
        Else
            RestoreTreeViewState(TreeView1.Nodes, Session("TreeViewState"))
        End If

    End Sub



    ' Save or reapply the state of the treeview
    Protected Sub TreeView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        If Session("TreeViewState") Is Nothing Then
            For Each node As TreeNode In TreeView1.Nodes
                node.Collapse()
            Next
            ' Record the TreeViews current expand/collapse state.
            Dim list As ArrayList = New ArrayList
            SaveTreeViewState(TreeView1.Nodes, list)
            Session("TreeViewState") = list
        Else
            'Apply the recorded expand/collapse state to the TreeView.
            Dim list As ArrayList = CType(Session("TreeViewState"), ArrayList)
            RestoreTreeViewState(TreeView1.Nodes, list)
        End If

    End Sub


    Protected Sub TreeView1_TreeNodeCollapsed(ByVal sender As Object, ByVal e As TreeNodeEventArgs)

        If (IsPostBack) Then
            Dim List As New ArrayList
            SaveTreeViewState(TreeView1.Nodes, List)
            Session("TreeViewState") = List
        End If

    End Sub

    Protected Sub TreeView1_TreeNodeExpanded(ByVal sender As Object, ByVal e As TreeNodeEventArgs)
        If (IsPostBack) Then
            Dim List As New ArrayList
            SaveTreeViewState(TreeView1.Nodes, List)
            Session("TreeViewState") = List
        End If
    End Sub




    'The save state func...
    Private Sub SaveTreeViewState(ByVal nodes As TreeNodeCollection, ByVal list As ArrayList)
        ' Recursivley record all expanded nodes in the 'list'.
        For Each node As TreeNode In nodes
            If (IsNothing(node.ChildNodes) = False And node.ChildNodes.Count <> 0) Then
                If node.Expanded.HasValue And node.Expanded = True And String.IsNullOrEmpty(node.Value) = False Then
                    list.Add(node.Value)
                    SaveTreeViewState(node.ChildNodes, list)
                End If
            End If
        Next
    End Sub

    'The restore state func...
    Private Sub RestoreTreeViewState(ByVal nodes As TreeNodeCollection, ByVal list As ArrayList)
        ' recursively expand all nodes in the list

        If IsNothing(list) Then Exit Sub

        For Each node As TreeNode In nodes
            ' if the node is in the list

            If list.Contains(node.Value) Then
                If IsNothing(node.ChildNodes) = False _
                   And (node.ChildNodes.Count) <> 0 _
                   And node.Expanded.HasValue And _
                   CBool(node.Expanded) = False Then
                    node.Expand()
                End If
                ' if the node is not in the list, it must be collapsed
            Else
                If IsNothing(node.ChildNodes) = False And (node.ChildNodes.Count) <> 0 _
                   And node.Expanded.HasValue And CBool(node.Expanded) = True Then
                    node.Collapse()
                End If
            End If

            ' if the node has child nodes and the count of these is not zero, restore them
            ' according to whether they are in the list (expand) or not (collapse)
            If IsNothing(node.ChildNodes) = False And node.ChildNodes.Count <> 0 Then
                RestoreTreeViewState(node.ChildNodes, list)
            End If
        Next
    End Sub








End Class

