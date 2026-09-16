with System;
with System.Storage_Elements;

package HAL.TIM is
   use System;
   use System.Storage_Elements;

   type Timer_Type is (T1, T2, T3, T14, T15, T16, T17);
   type Direction_Type is (Up, Down);
   type Timer_Callback_Type is access procedure;
   type Tick_Limit_Type is mod 2 ** 32;
   type Prescaler_Type is mod 2 ** 16;

   procedure Timer_Direction (Timer : Timer_Type; Direction : Direction_Type);
   --  As of now, internal clock is used so not needed
   --  procedure Timer_Clock (Timer : Timer_Type; Clock : RCC.Clock_Type);
   procedure Timer_One_Pulse (Timer : Timer_Type;
                              One_Pulse : Boolean);
   procedure Timer_Enable (Timer : Timer_Type);
   procedure Timer_Callback (Timer : Timer_Type;
                             Callback : Timer_Callback_Type);
   procedure Timer_Reset_Update_Flag (Timer : Timer_Type);
   procedure Timer_Tick_Limit (Timer : Timer_Type;
                               Tick_Limit : Tick_Limit_Type);
   procedure Timer_Prescaler (Timer : Timer_Type;
                              Prescaler : Prescaler_Type);

private
   TIM1_Base_Address : constant Address := To_Address (16#4001_2C00#);
   TIM2_Base_Address : constant Address := To_Address (16#4000_0000#);
   TIM3_Base_Address : constant Address := To_Address (16#4000_0400#);
   TIM14_Base_Address : constant Address := To_Address (16#4000_2000#);
   TIM15_Base_Address : constant Address := To_Address (16#4001_4000#);
   TIM16_Base_Address : constant Address := To_Address (16#4001_4400#);
   TIM17_Base_Address : constant Address := To_Address (16#4001_4800#);

   --  TIM1 has two interrupt lines so we leave it out as of now
   TIM2_Interrupt_Address : constant Address := To_Address (16#0000_007C#);
   TIM3_Interrupt_Address : constant Address := To_Address (16#0000_0080#);
   TIM14_Interrupt_Address : constant Address := To_Address (16#0000_008C#);
   TIM15_Interrupt_Address : constant Address := To_Address (16#0000_0090#);
   TIM16_Interrupt_Address : constant Address := To_Address (16#0000_0094#);
   TIM17_Interrupt_Address : constant Address := To_Address (16#0000_0098#);

   CR1_Offset : constant Storage_Offset := 16#00#;
   DIER_Offset : constant Storage_Offset := 16#0C#;
   SR_Offset : constant Storage_Offset := 16#10#;
   PSC_Offset : constant Storage_Offset := 16#28#;
   ARR_Offset : constant Storage_Offset := 16#2C#;

   function Get_Timer_Register (Timer : Timer_Type;
                                Register : Storage_Offset) return Address;
   function Get_Timer_Address (Timer : Timer_Type) return Address;
   function Get_Timer_Interrupt_Address (Timer : Timer_Type) return Address;
end HAL.TIM;