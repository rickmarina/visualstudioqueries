Function csvRange(myRange As Range)
    Dim csvRangeOutput
    Dim entry As Variant
    For Each entry In myRange
        If Not IsEmpty(entry.Value) Then
            csvRangeOutput = csvRangeOutput & "'" & entry.Value & "',"
        End If
    Next
    csvRange = Left(csvRangeOutput, Len(csvRangeOutput) - 1)
End Function
