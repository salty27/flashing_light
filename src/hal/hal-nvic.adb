package body HAL.NVIC is
   procedure Enable_Interrupt (Timer : Timer_Type) is
      ISER_Array : Bits (0 .. 31)
         with Address => ISER_Address;
   begin
      case Timer is
         when T3 =>
            ISER_Array (16) := True;
         when others =>
            null;
      end case;
      null;
   end Enable_Interrupt;
end HAL.NVIC;
