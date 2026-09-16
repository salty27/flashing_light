package body HAL.RCC is
   use HAL.GPIO;
   use HAL.TIM;

   procedure Enable_Timer (Timer : Timer_Type) is
      APBENR1_Array : Bits (0 .. 31)
         with Address => (Base_Address + APBENR1_Offset);
   begin
      case Timer is
         when T2 =>
            APBENR1_Array (0) := True;
         when T3 =>
            APBENR1_Array (1) := True;
         when others =>
            null;
      end case;
   end Enable_Timer;

   procedure Enable_Peripheral_Clock (Port : Port_Type) is
      IOPENR_Array : Bits (0 .. 31)
         with Address => (Base_Address + IOPENR_Offset);
      Port_Index : Integer;
   begin
      case Port is
         when A =>
            Port_Index := 0;
         when B =>
            Port_Index := 1;
         when C =>
            Port_Index := 2;
         when D =>
            Port_Index := 3;
         when F =>
            Port_Index := 5;
      end case;
      IOPENR_Array (Port_Index) := True;
   end Enable_Peripheral_Clock;
end HAL.RCC;