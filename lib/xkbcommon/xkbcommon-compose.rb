  XKB_COMPOSE_COMPILE_NO_FLAGS = 0

  XKB_COMPOSE_FORMAT_TEXT_V1 = 1

  attach_function :xkb_compose_table_new_from_locale, [ :pointer, :string, :int ], :pointer
  attach_function :xkb_compose_table_new_from_file, [ :pointer, :pointer, :string, :int, :int ], :pointer
  attach_function :xkb_compose_table_new_from_buffer, [ :pointer, :string, :uint, :string, :int, :int ], :pointer
  attach_function :xkb_compose_table_ref, [ :pointer ], :pointer
  attach_function :xkb_compose_table_unref, [ :pointer ], :void
  XKB_COMPOSE_STATE_NO_FLAGS = 0

  attach_function :xkb_compose_state_new, [ :pointer, :int ], :pointer
  attach_function :xkb_compose_state_ref, [ :pointer ], :pointer
  attach_function :xkb_compose_state_unref, [ :pointer ], :void
  attach_function :xkb_compose_state_get_compose_table, [ :pointer ], :pointer
  XKB_COMPOSE_NOTHING = 0
  XKB_COMPOSE_COMPOSING = 1
  XKB_COMPOSE_COMPOSED = 2
  XKB_COMPOSE_CANCELLED = 3

  XKB_COMPOSE_FEED_IGNORED = 0
  XKB_COMPOSE_FEED_ACCEPTED = 1

  attach_function :xkb_compose_state_feed, [ :pointer, :uint ], :int
  attach_function :xkb_compose_state_reset, [ :pointer ], :void
  attach_function :xkb_compose_state_get_status, [ :pointer ], :int
  attach_function :xkb_compose_state_get_utf8, [ :pointer, :string, :uint ], :int
  attach_function :xkb_compose_state_get_one_sym, [ :pointer ], :uint
