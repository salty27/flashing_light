with System;

package HAL is
   type Bit is new Boolean with Size => 1;
   type Crumb is range 0 .. 3 with Size => 2;
   type Nibble is range 0 .. 15 with Size => 4;
   type Byte is range 0 .. 255 with Size => 8;

   type Bits is array (Integer range <>) of Bit with Component_Size => 1;
   type Crumbs is array (Integer range <>) of Crumb with Component_Size => 2;
   type Nibbles is array (Integer range <>) of Nibble with Component_Size => 4;

   type Bits32 is array (0 .. 31) of Bit with
      Component_Size => 1;
   type Crumb32 is array (0 .. 15) of Crumb with
      Component_Size => 2;
   type Nibble32 is array (0 .. 7) of Nibble with
      Component_Size => 4;

   type Bits16 is array (0 .. 15) of Bit with
      Component_Size => 1;

   RCC_Base_Address : constant := 16#4002_1000#;
   RCC_IOPENR_Base_Offset : constant := 16#34#;

   RCC_IO_Array : Bits32 with Address => System'To_Address (RCC_Base_Address + RCC_IOPENR_Base_Offset), Volatile;
end Hal;