package HAL is
   type Bit is new Boolean with Size => 1;
   type Crumb is range 0 .. 3 with Size => 2;
   type Nibble is range 0 .. 15 with Size => 4;
   type Byte is range 0 .. 255 with Size => 8;

   type Bits is array (Integer range <>) of Bit
      with Component_Size => 1, Volatile, Volatile_Components;
   type Crumbs is array (Integer range <>) of Crumb
      with Component_Size => 2, Volatile, Volatile_Components;
   type Nibbles is array (Integer range <>) of Nibble
      with Component_Size => 4, Volatile, Volatile_Components;
end Hal;