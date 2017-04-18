require "libxkbcommon/version"
require 'ffi'

module Libxkbcommon
  extend FFI::Library

  ffi_lib 'xkbcommon'
end

module Libxkbcommon
  XKB_KEYMAP_USE_ORIGINAL_FORMAT = 0
  class_eval File.read(File.join(File.dirname(__FILE__), 'libxkbcommon/xkbcommon-compose.rb'))
  class_eval File.read(File.join(File.dirname(__FILE__), 'libxkbcommon/xkbcommon-keysyms.rb'))
  class_eval File.read(File.join(File.dirname(__FILE__), 'libxkbcommon/xkbcommon-names.rb'))
  class_eval File.read(File.join(File.dirname(__FILE__), 'libxkbcommon/xkbcommon.rb'))
  #class_eval File.read(File.join(File.dirname(__FILE__), 'libxkbcommon/xkbcommon-x11.rb'))
end


