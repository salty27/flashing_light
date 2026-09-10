with System;
with System.Storage_Elements;

package HAL.GPIO is
   use System;
   use System.Storage_Elements;

   type Port_Type is (A, B, C, D, F);
   subtype Pin_Type is Integer range 0 .. 15;
   type Mode_Type is (Input, Output);
   type Value_Type is (Low, High);

   procedure Pin_Mode (Port : Port_Type; Pin : Pin_Type; Mode : Mode_Type);
   function Pin_Read (Port : Port_Type; Pin : Pin_Type) return Value_Type;
   procedure Pin_Write (Port : Port_Type; Pin : Pin_Type; Value : Value_Type);
   procedure Pin_Write_Toggle (Port : Port_Type; Pin : Pin_Type);

private
   PORTA_Base_Address : constant Address := To_Address (16#5000_0000#);
   PORTB_Base_Address : constant Address := To_Address (16#5000_0400#);
   PORTC_Base_Address : constant Address := To_Address (16#5000_0800#);
   PORTD_Base_Address : constant Address := To_Address (16#5000_0C00#);
   PORTF_Base_Address : constant Address := To_Address (16#5000_1400#);

   MODER_Offset : constant Storage_Offset := 16#00#;
   OTYPER_Offset : constant Storage_Offset := 16#04#;
   OSPEEDR_Offset : constant Storage_Offset := 16#08#;
   PUPDR_Offset : constant Storage_Offset := 16#0C#;
   IDR_Offset : constant Storage_Offset := 16#10#;
   ODR_Offset : constant Storage_Offset := 16#14#;
   BSRR_Offset : constant Storage_Offset := 16#18#;
   LCKR_Offset : constant Storage_Offset := 16#1C#;
   AFRL_Offset : constant Storage_Offset := 16#20#;
   AFRH_Offset : constant Storage_Offset := 16#24#;
   BRR_Offset : constant Storage_Offset := 16#28#;

   function Get_Port_Register (Port : Port_Type;
                               Offset : Storage_Offset) return Address;
   function Get_Port_Address (Port : Port_Type) return Address;
end HAL.GPIO;