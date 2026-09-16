with System;
with System.Storage_Elements;

with HAL.GPIO;
with HAL.TIM;

package HAL.RCC is
   use System;
   use System.Storage_Elements;

   procedure Enable_Timer (Timer : TIM.Timer_Type);
   procedure Enable_Peripheral_Clock (Port : GPIO.Port_Type);
private
   Base_Address : constant Address := To_Address (16#4002_1000#);

   APBENR1_Offset : constant Storage_Offset := 16#3C#;
   IOPENR_Offset : constant Storage_Offset := 16#34#;
end HAL.RCC;