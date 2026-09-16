with HAL.TIM;
with System;
with System.Storage_Elements;

package HAL.NVIC is
   use TIM;
   use System;
   use System.Storage_Elements;

   --  Overload for different interrupts
   procedure Enable_Interrupt (Timer : Timer_Type);

private
   ISER_Address : Address := To_Address (16#E000_E100#);
end HAL.NVIC;