with HAL.GPIO; use HAL.GPIO;
with HAL.RCC; use HAL.RCC;

procedure Flashing_Light is
begin
   Enable_Peripheral_Clock (A);
   Pin_Mode (A, 5, Output);
   Pin_Write_Toggle (A, 5);

   loop
      null;
   end loop;
end Flashing_Light;
