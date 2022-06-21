with min_missing; use min_missing;
with Text_IO;

procedure Main is
   Sample_Array: Natural_Array := (2, 1, 10, 0, 5, 6);
   Result: Integer;
begin
   Result := FindMinMissing(Sample_Array);
   Text_IO.Put_Line(Result'Image);
end Main;
