with Hal; use Hal;

procedure Flashing_Light is
begin
   RCC_IO_Array (0) := True;
   GPIO_Mode_Array (5) := 2#01#;
   GPIO_BSRR_Array (5) := True;

   loop
      null;
   end loop;
end Flashing_Light;
