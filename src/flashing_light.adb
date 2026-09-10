with HAL; use HAL;
with HAL.GPIO; use HAL.GPIO;

--TODO before next PR: Clean up HAL and isolate into functions
procedure Flashing_Light is
begin
   RCC_IO_Array (0) := True;
   Pin_Mode (A, 5, Output);
   Pin_Write (A, 5, High);

   loop
      null;
   end loop;
end Flashing_Light;
