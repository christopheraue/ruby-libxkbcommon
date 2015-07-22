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

    `rm -f xkbcommon-compose_wrap.xml xkbcommon-keysyms_wrap.xml xkbcommon-names_wrap.xml`
    `rm -f xkbcommon-x11_wrap.xml xkbcommon_wrap.xml`
  end
end