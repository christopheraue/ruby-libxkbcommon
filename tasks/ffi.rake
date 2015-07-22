namespace :ffi do
  desc 'Generate ffi interface'
  task :generate do
    `swig -xml -o xkbcommon-compose_wrap.xml  -I/usr/include swig/xkbcommon-compose.i`
    `swig -xml -o xkbcommon-keysyms_wrap.xml -I/usr/include swig/xkbcommon-keysyms.i`
    `swig -xml -o xkbcommon-names_wrap.xml -I/usr/include swig/xkbcommon-names.i`
    `swig -xml -o xkbcommon-x11_wrap.xml -I/usr/include swig/xkbcommon-x11.i`
    `swig -xml -o xkbcommon_wrap.xml -I/usr/include swig/xkbcommon.i`

    `ffi-gen xkbcommon-compose_wrap.xml lib/xkbcommon/xkbcommon-compose.rb`
    `ffi-gen xkbcommon-keysyms_wrap.xml lib/xkbcommon/xkbcommon-keysyms.rb`
    `ffi-gen xkbcommon-names_wrap.xml lib/xkbcommon/xkbcommon-names.rb`
    `ffi-gen xkbcommon-x11_wrap.xml lib/xkbcommon/xkbcommon-x11.rb`
    `ffi-gen xkbcommon_wrap.xml lib/xkbcommon/xkbcommon.rb`

    `sed -i 's/va_list/:pointer/g' lib/xkbcommon/xkbcommon.rb`

    `sed -i 's/Shift/"Shift"/g' lib/xkbcommon/xkbcommon-names.rb`
    `sed -i 's/Control/"Control"/g' lib/xkbcommon/xkbcommon-names.rb`
    `sed -i 's/Mod1/"Mod1"/g' lib/xkbcommon/xkbcommon-names.rb`
    `sed -i 's/Mod2/"Mod2"/g' lib/xkbcommon/xkbcommon-names.rb`
    `sed -i 's/Mod4/"Mod4"/g' lib/xkbcommon/xkbcommon-names.rb`
    `sed -i 's/= Caps Lock/= "Caps Lock"/g' lib/xkbcommon/xkbcommon-names.rb`
    `sed -i 's/= Num Lock/= "Num Lock"/g' lib/xkbcommon/xkbcommon-names.rb`
    `sed -i 's/= Scroll Lock/= "Scroll Lock"/g' lib/xkbcommon/xkbcommon-names.rb`
    `sed -i 's/= Lock/= "Lock"/g' lib/xkbcommon/xkbcommon-names.rb`

    `rm -f xkbcommon-compose_wrap.xml xkbcommon-keysyms_wrap.xml xkbcommon-names_wrap.xml`
    `rm -f xkbcommon-x11_wrap.xml xkbcommon_wrap.xml`
  end
end