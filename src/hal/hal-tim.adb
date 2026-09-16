package body HAL.TIM is
   procedure Timer_Direction (Timer : Timer_Type;
                              Direction : Direction_Type) is
      CR1_Array : Bits (0 .. 31)
         with Address => Get_Timer_Register (Timer, CR1_Offset);
   begin
      case Direction is
         when Up =>
            CR1_Array (4) := False;
         when Down =>
            CR1_Array (4) := True;
      end case;
   end Timer_Direction;

   procedure Timer_One_Pulse (Timer : Timer_Type; One_Pulse : Boolean) is
      CR1_Array : Bits (0 .. 31)
         with Address => Get_Timer_Register (Timer, CR1_Offset);
   begin
      CR1_Array (3) := Bit (One_Pulse);
   end Timer_One_Pulse;

   procedure Timer_Enable (Timer : Timer_Type) is
      CR1_Array : Bits (0 .. 31)
         with Address => Get_Timer_Register (Timer, CR1_Offset);
      DIER_Array : Bits (0 .. 31)
         with Address => Get_Timer_Register (Timer, DIER_Offset);
   begin
      DIER_Array (0) := True;
      CR1_Array (0) := True;
   end Timer_Enable;

   procedure Timer_Callback (Timer : Timer_Type;
                             Callback : Timer_Callback_Type) is
      Interrupt_Line : Timer_Callback_Type
         with Address => Get_Timer_Interrupt_Address (Timer);
   begin
      Interrupt_Line := Callback;
   end Timer_Callback;

   procedure Timer_Reset_Update_Flag (Timer : Timer_Type) is
      SR_Array : Bits (0 .. 31)
         with Address => Get_Timer_Register (Timer, SR_Offset);
   begin
      SR_Array (0) := False;
   end Timer_Reset_Update_Flag;

   procedure Timer_Tick_Limit (Timer : Timer_Type;
                               Tick_Limit : Tick_Limit_Type) is
      ARR_Register : Tick_Limit_Type
         with Address => Get_Timer_Register (Timer, ARR_Offset);
   begin
      ARR_Register := Tick_Limit;
   end Timer_Tick_Limit;
   procedure Timer_Prescaler (Timer : Timer_Type;
                                 Prescaler : Prescaler_Type) is
      PSC_Register : Prescaler_Type
         with Address => Get_Timer_Register (Timer, PSC_Offset);
   begin
      PSC_Register := Prescaler;
   end Timer_Prescaler;

   function Get_Timer_Register (Timer : Timer_Type;
                                Register : Storage_Offset) return Address is
   begin
      return Get_Timer_Address (Timer) + Register;
   end Get_Timer_Register;
   function Get_Timer_Address (Timer : Timer_Type) return Address is
   begin
      case Timer is
         when T1 =>
            return TIM1_Base_Address;
         when T2 =>
            return TIM2_Base_Address;
         when T3 =>
            return TIM3_Base_Address;
         when T14 =>
            return TIM14_Base_Address;
         when T15 =>
            return TIM15_Base_Address;
         when T16 =>
            return TIM16_Base_Address;
         when T17 =>
            return TIM17_Base_Address;
      end case;
   end Get_Timer_Address;
   function Get_Timer_Interrupt_Address (Timer : Timer_Type) return Address is
   begin
      case Timer is
         when T1 =>
            null;
         when T2 =>
            return TIM2_Interrupt_Address;
         when T3 =>
            return TIM3_Interrupt_Address;
         when T14 =>
            return TIM14_Interrupt_Address;
         when T15 =>
            return TIM15_Interrupt_Address;
         when T16 =>
            return TIM16_Interrupt_Address;
         when T17 =>
            return TIM17_Interrupt_Address;
      end case;
   end Get_Timer_Interrupt_Address;
end HAL.TIM;