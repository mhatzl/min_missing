package body min_missing with SPARK_Mode is

   type Boolean_Array is array (Small_Natural range <>) of Boolean;
   
   function FindMinMissing (a: Natural_Array) return Natural
   is
      b: Boolean_Array (0 .. a'Length - 1) := (others => false);
   begin
      for i in a'Range loop
         if a(i) <= b'Last then
            b(a(i)) := true;
         end if;
         
         pragma Loop_Invariant (for all j in a'First .. i => (if a(j) <= b'Last then (Exists(a, a(j)) and then b(a(j)) = true)));
         pragma Loop_Invariant (for all n in b'Range => (if b(n) = true then Exists(a, n)));
      end loop;
      
      for j in b'Range loop
         if b(j) = false then
            return j;
         end if;
         
         pragma Loop_Invariant (for all i in b'First .. j => b(i) = true);
      end loop;    
      
      return a'Length;
   end FindMinMissing;
   
   
   function Exists(a: Natural_Array; n: Small_Natural) return Boolean
   is
   begin
      for i in a'Range loop
         if a(i) = n then
            return true;
         end if;
         
         pragma Loop_Invariant (for all j in a'First .. i => a(j) /= n);
      end loop;
       
      return false;
   end Exists;
   
end min_missing;
