package Callbacks is
   procedure Timer_Callback
   with
      Export => True,
      Convention => C,
      External_Name => "__TIM3_handler";
end Callbacks;