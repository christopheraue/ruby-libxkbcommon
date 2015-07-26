namespace :ffi do
  desc 'Generate ffi interface'
  task :generate do
    `swig -xml -o xkbcommon-compose_wrap.xml  -I/usr/include swig/xkbcommon-compose.i`
    `swig -xml -o xkbcommon-keysyms_wrap.xml -I/usr/include swig/xkbcommon-keysyms.i`
    `swig -xml -o xkbcommon-names_wrap.xml -I/usr/include swig/xkbcommon-names.i`
    `swig -xml -o xkbcommon-x11_wrap.xml -I/usr/include swig/xkbcommon-x11.i`
    `swig -xml -o xkbcommon_wrap.xml -I/usr/include swig/xkbcommon.i`

    `ffi-gen xkbcommon-compose_wrap.xml lib/libxkbcommon/xkbcommon-compose.rb`
    `ffi-gen xkbcommon-keysyms_wrap.xml lib/libxkbcommon/xkbcommon-keysyms.rb`
    `ffi-gen xkbcommon-names_wrap.xml lib/libxkbcommon/xkbcommon-names.rb`
    `ffi-gen xkbcommon-x11_wrap.xml lib/libxkbcommon/xkbcommon-x11.rb`
    `ffi-gen xkbcommon_wrap.xml lib/libxkbcommon/xkbcommon.rb`

    # manual adjustments
    `sed -i 's/va_list/:pointer/g' lib/libxkbcommon/xkbcommon.rb`

    # translate char* into :pointer instead of :string
    before = 'attach_function :xkb_state_key_get_utf8, \[ :pointer, :uint, :string, :uint \], :int'
    after  = 'attach_function :xkb_state_key_get_utf8, [ :pointer, :uint, :pointer, :uint ], :int'
    `sed -i 's/#{before}/#{after}/g' lib/libxkbcommon/xkbcommon.rb`

    before = 'attach_function :xkb_keysym_get_name, \[ :uint, :string, :uint \], :int'
    after  = 'attach_function :xkb_keysym_get_name, [ :uint, :pointer, :uint ], :int'
    `sed -i 's/#{before}/#{after}/g' lib/libxkbcommon/xkbcommon.rb`

    before = 'attach_function :xkb_keysym_to_utf8, \[ :uint, :string, :uint \], :int'
    after  = 'attach_function :xkb_keysym_to_utf8, [ :uint, :pointer, :uint ], :int'
    `sed -i 's/#{before}/#{after}/g' lib/libxkbcommon/xkbcommon.rb`

    `sed -i 's/Shift/"Shift"/g' lib/libxkbcommon/xkbcommon-names.rb`
    `sed -i 's/Control/"Control"/g' lib/libxkbcommon/xkbcommon-names.rb`
    `sed -i 's/Mod1/"Mod1"/g' lib/libxkbcommon/xkbcommon-names.rb`
    `sed -i 's/Mod2/"Mod2"/g' lib/libxkbcommon/xkbcommon-names.rb`
    `sed -i 's/Mod4/"Mod4"/g' lib/libxkbcommon/xkbcommon-names.rb`
    `sed -i 's/= Caps Lock/= "Caps Lock"/g' lib/libxkbcommon/xkbcommon-names.rb`
    `sed -i 's/= Num Lock/= "Num Lock"/g' lib/libxkbcommon/xkbcommon-names.rb`
    `sed -i 's/= Scroll Lock/= "Scroll Lock"/g' lib/libxkbcommon/xkbcommon-names.rb`
    `sed -i 's/= Lock/= "Lock"/g' lib/libxkbcommon/xkbcommon-names.rb`

    # clean up
    `rm -f xkbcommon-compose_wrap.xml xkbcommon-keysyms_wrap.xml xkbcommon-names_wrap.xml`
    `rm -f xkbcommon-x11_wrap.xml xkbcommon_wrap.xml`
  end
end