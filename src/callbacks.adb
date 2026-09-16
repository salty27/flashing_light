with HAL.GPIO;
with HAL.TIM;

package body Callbacks is
   use HAL.GPIO;
   use HAL.TIM;

   procedure Timer_Callback is
   begin
      Pin_Write_Toggle (A, 5);
      Timer_Reset_Update_Flag (T3);
   end Timer_Callback;
end Callbacks;