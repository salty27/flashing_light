with System;

package Hal is
   type Bits16 is array (0 .. 15) of Boolean with
      Component_Size => 1;
   type Bits32 is array (0 .. 31) of Boolean with
      Component_Size => 1;
   type Mode is range 0 .. 3;
   type Mode16 is array (0 .. 15) of Mode with
      Component_Size => 2;

   GPIOA_Base_Address : constant := 16#5000_0000#;
   GPIOB_Base_Address : constant := 16#5000_0400#;
   GPIOC_Base_Address : constant := 16#5000_0800#;
   GPIOD_Base_Address : constant := 16#5000_0C00#;
   GPIOF_Base_Address : constant := 16#5000_1400#;

   GPIO_MODER_Base_Offset : constant := 16#00#;
   GPIO_OTYPER_Base_Offset : constant := 16#04#;
   GPIO_OSPEEDR_Base_Offset : constant := 16#08#;
   GPIO_PUPDR_Base_Offset : constant := 16#0C#;
   GPIO_IDR_Base_Offset : constant := 16#10#;
   GPIO_ODR_Base_Offset : constant := 16#14#;
   GPIO_BSRR_Base_Offset : constant := 16#18#;

   GPIO_Mode_Array : Mode16 with Address => System'To_Address (GPIOA_Base_Address + GPIO_MODER_Base_Offset), Volatile;
   GPIO_Output_Type_Array : Bits16 with Address => System'To_Address (GPIOA_Base_Address + GPIO_OTYPER_Base_Offset);
   GPIO_Output_Speed_Array : Mode16 with Address => System'To_Address (GPIOA_Base_Address + GPIO_OSPEEDR_Base_Offset);
   GPIO_Pull_Array : Mode16 with Address => System'To_Address (GPIOA_Base_Address + GPIO_PUPDR_Base_Offset);
   GPIO_Input_Array : Bits16 with Address => System'To_Address (GPIOA_Base_Address + GPIO_IDR_Base_Offset);
   GPIO_Output_Array : Bits16 with Address => System'To_Address (GPIOA_Base_Address + GPIO_ODR_Base_Offset);
   GPIO_BSRR_Array : Bits32 with Address => System'To_Address (GPIOA_Base_Address + GPIO_BSRR_Base_Offset), Volatile;

   RCC_Base_Address : constant := 16#4002_1000#;
   RCC_IOPENR_Base_Offset : constant := 16#34#;

   RCC_IO_Array : Bits32 with Address => System'To_Address (RCC_Base_Address + RCC_IOPENR_Base_Offset), Volatile;
end Hal;