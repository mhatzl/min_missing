package min_missing with SPARK_Mode is
   
   subtype Small_Natural is Natural range 0 .. Natural'Last - 1;
   type Natural_Array is array(Small_Natural range <>) of Small_Natural;
   
   function FindMinMissing (a: Natural_Array) return Natural
     with
     Post => (if FindMinMissing'Result = 0 then not Exists(a, 0) else (
                     for all n in 0 .. FindMinMissing'Result - 1 => Exists(a, n)));

   function Exists(a: Natural_Array; n: Small_Natural) return Boolean with Ghost,
     Post => (if Exists'Result then (for some i in a'Range => a(i) = n) else (for all j in a'Range => a(j) /= n));

end min_missing;
