with HAL.GPIO; use HAL.GPIO;
with HAL.RCC; use HAL.RCC;
with HAL.TIM; use HAL.TIM;
with HAL.NVIC; use HAL.NVIC;
with Callbacks;

procedure Flashing_Light is
begin
   Enable_Peripheral_Clock (A);
   Enable_Timer (T3);
   Enable_Interrupt (T3);

   Pin_Mode (A, 5, Output);

   Timer_Direction (T3, Up);
   Timer_Prescaler (T3, 47999);
   Timer_Tick_Limit (T3, 1000); -- Simulation lags when setting to 10 -> Interrupt is working, but callback is not
   --  Timer_Callback (T3, Timer_Callback'Access);
   Timer_One_Pulse (T3, False);
   Timer_Enable (T3);

   loop
      null;
   end loop;
end Flashing_Light;
