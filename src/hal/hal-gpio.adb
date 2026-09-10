package body HAL.GPIO is
   procedure Pin_Mode (Port : Port_Type; Pin : Pin_Type; Mode : Mode_Type) is
      MODER_Array : Crumbs (0 .. 15)
         with Address => Get_Port_Register (Port, MODER_Offset), Volatile;
   begin
      case Mode is
         when Input =>
            Moder_Array (Pin) := 2#00#;
         when Output =>
            Moder_Array (Pin) := 2#01#;
      end case;
   end Pin_Mode;

   function Pin_Read (Port : Port_Type; Pin : Pin_Type) return Value_Type is
      IDR_Array : Bits (0 .. 15)
         with Address => Get_Port_Register (Port, IDR_Offset), Volatile;
   begin
      if Boolean(IDR_Array (Pin)) then
         return High;
      else
         return Low;
      end if;
   end Pin_Read;

   procedure Pin_Write (Port : Port_Type;
                        Pin : Pin_Type;
                        Value : Value_Type) is
      BSRR_Array : Bits (0 .. 31)
         with Address => Get_Port_Register (Port, BSRR_Offset), Volatile;
   begin
      case Value is
         when Low =>
            BSRR_Array (Pin + 16) := True;
         when High =>
            BSRR_Array (Pin) := True;
      end case;
   end Pin_Write;

   procedure Pin_Write_Toggle (Port : Port_Type; Pin : Pin_Type) is
   begin
      case Pin_Read (Port, Pin) is
         when High =>
            Pin_Write (Port, Pin, Low);
         when Low =>
            Pin_Write (Port, Pin, High);
      end case;
   end Pin_Write_Toggle;

   function Get_Port_Register (Port : Port_Type;
                               Offset : Storage_Offset) return Address is
   begin
      return Get_Port_Address (Port) + Offset;
   end Get_Port_Register;

   --  Later check to optimise wether to use multiple returns or a variable
   function Get_Port_Address (Port : Port_Type) return Address is
   begin
      case Port is
         when A =>
            return PORTA_Base_Address;
         when B =>
            return PORTB_Base_Address;
         when C =>
            return PORTC_Base_Address;
         when D =>
            return PORTD_Base_Address;
         when F =>
            return PORTF_Base_Address;
      end case;
   end Get_Port_Address;
end HAL.GPIO;