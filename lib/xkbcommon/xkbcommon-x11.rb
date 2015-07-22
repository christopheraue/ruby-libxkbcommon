  XKB_X11_MIN_MAJOR_XKB_VERSION = 1
  XKB_X11_MIN_MINOR_XKB_VERSION = 0
  XKB_X11_SETUP_XKB_EXTENSION_NO_FLAGS = 0

  attach_function :xkb_x11_setup_xkb_extension, [ :pointer, :ushort, :ushort, :int, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :xkb_x11_get_core_keyboard_device_id, [ :pointer ], :int
  attach_function :xkb_x11_keymap_new_from_device, [ :pointer, :pointer, :int, :int ], :pointer
  attach_function :xkb_x11_state_new_from_device, [ :pointer, :pointer, :int ], :pointer
