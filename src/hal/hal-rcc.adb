package body HAL.RCC is
   use HAL.GPIO;

   procedure Enable_Peripheral_Clock (Port : Port_Type) is
      IOPENR_Array : Bits (0 .. 31)
         with Address => (Base_Address + IOPENR_Base_Offset), Volatile;
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