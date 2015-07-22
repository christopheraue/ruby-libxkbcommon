require "xkbcommon/version"
require 'ffi'

module Xkbcommon
  extend FFI::Library

  ffi_lib 'xkbcommon'
end

module Xkbcommon
  class_eval File.read(File.join(File.dirname(__FILE__), 'xkbcommon/xkbcommon-compose.rb'))
  class_eval File.read(File.join(File.dirname(__FILE__), 'xkbcommon/xkbcommon-keysyms.rb'))
  class_eval File.read(File.join(File.dirname(__FILE__), 'xkbcommon/xkbcommon-names.rb'))
  class_eval File.read(File.join(File.dirname(__FILE__), 'xkbcommon/xkbcommon.rb'))
end


