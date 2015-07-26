  XKB_KEYCODE_INVALID = (0xffffffff)
  XKB_LAYOUT_INVALID = (0xffffffff)
  XKB_LEVEL_INVALID = (0xffffffff)
  XKB_MOD_INVALID = (0xffffffff)
  XKB_LED_INVALID = (0xffffffff)
  XKB_KEYCODE_MAX = (0xffffffff-1)
  class XkbRuleNames < FFI::Struct
    layout(
           :rules, :pointer,
           :model, :pointer,
           :layout, :pointer,
           :variant, :pointer,
           :options, :pointer
    )
    def rules=(str)
      @rules = FFI::MemoryPointer.from_string(str)
      self[:rules] = @rules
    end
    def rules
      @rules.get_string(0)
    end
    def model=(str)
      @model = FFI::MemoryPointer.from_string(str)
      self[:model] = @model
    end
    def model
      @model.get_string(0)
    end
    def layout=(str)
      @layout = FFI::MemoryPointer.from_string(str)
      self[:layout] = @layout
    end
    def layout
      @layout.get_string(0)
    end
    def variant=(str)
      @variant = FFI::MemoryPointer.from_string(str)
      self[:variant] = @variant
    end
    def variant
      @variant.get_string(0)
    end
    def options=(str)
      @options = FFI::MemoryPointer.from_string(str)
      self[:options] = @options
    end
    def options
      @options.get_string(0)
    end

  end
  attach_function :xkb_keysym_get_name, [ :uint, :string, :uint ], :int
  XKB_KEYSYM_CASE_INSENSITIVE = (1 << 0)
  XKB_KEYSYM_NO_FLAGS = 0

  attach_function :xkb_keysym_from_name, [ :string, :int ], :uint
  attach_function :xkb_keysym_to_utf8, [ :uint, :string, :uint ], :int
  attach_function :xkb_keysym_to_utf32, [ :uint ], :uint
  XKB_CONTEXT_NO_DEFAULT_INCLUDES = (1 << 0)
  XKB_CONTEXT_NO_ENVIRONMENT_NAMES = (1 << 1)
  XKB_CONTEXT_NO_FLAGS = 0

  attach_function :xkb_context_new, [ :int ], :pointer
  attach_function :xkb_context_ref, [ :pointer ], :pointer
  attach_function :xkb_context_unref, [ :pointer ], :void
  attach_function :xkb_context_set_user_data, [ :pointer, :pointer ], :void
  attach_function :xkb_context_get_user_data, [ :pointer ], :pointer
  attach_function :xkb_context_include_path_append, [ :pointer, :string ], :int
  attach_function :xkb_context_include_path_append_default, [ :pointer ], :int
  attach_function :xkb_context_include_path_reset_defaults, [ :pointer ], :int
  attach_function :xkb_context_include_path_clear, [ :pointer ], :void
  attach_function :xkb_context_num_include_paths, [ :pointer ], :uint
  attach_function :xkb_context_include_path_get, [ :pointer, :uint ], :string
  XKB_LOG_LEVEL_CRITICAL = 10
  XKB_LOG_LEVEL_ERROR = 20
  XKB_LOG_LEVEL_WARNING = 30
  XKB_LOG_LEVEL_INFO = 40
  XKB_LOG_LEVEL_DEBUG = 50

  attach_function :xkb_context_set_log_level, [ :pointer, :int ], :void
  attach_function :xkb_context_get_log_level, [ :pointer ], :int
  attach_function :xkb_context_set_log_verbosity, [ :pointer, :int ], :void
  attach_function :xkb_context_get_log_verbosity, [ :pointer ], :int
  attach_function :xkb_context_set_log_fn, [ :pointer, callback([ :pointer, :int, :string, :pointer ], :void) ], :void
  XKB_KEYMAP_COMPILE_NO_FLAGS = 0

  attach_function :xkb_keymap_new_from_names, [ :pointer, :pointer, :int ], :pointer
  XKB_KEYMAP_FORMAT_TEXT_V1 = 1

  attach_function :xkb_keymap_new_from_file, [ :pointer, :pointer, :int, :int ], :pointer
  attach_function :xkb_keymap_new_from_string, [ :pointer, :string, :int, :int ], :pointer
  attach_function :xkb_keymap_new_from_buffer, [ :pointer, :string, :uint, :int, :int ], :pointer
  attach_function :xkb_keymap_ref, [ :pointer ], :pointer
  attach_function :xkb_keymap_unref, [ :pointer ], :void
  attach_function :xkb_keymap_get_as_string, [ :pointer, :int ], :string
  attach_function :xkb_keymap_min_keycode, [ :pointer ], :uint
  attach_function :xkb_keymap_max_keycode, [ :pointer ], :uint
  callback(:xkb_keymap_key_iter_t, [ :pointer, :uint, :pointer ], :void)
  attach_function :xkb_keymap_key_for_each, [ :pointer, :xkb_keymap_key_iter_t, :pointer ], :void
  attach_function :xkb_keymap_num_mods, [ :pointer ], :uint
  attach_function :xkb_keymap_mod_get_name, [ :pointer, :uint ], :string
  attach_function :xkb_keymap_mod_get_index, [ :pointer, :string ], :uint
  attach_function :xkb_keymap_num_layouts, [ :pointer ], :uint
  attach_function :xkb_keymap_layout_get_name, [ :pointer, :uint ], :string
  attach_function :xkb_keymap_layout_get_index, [ :pointer, :string ], :uint
  attach_function :xkb_keymap_num_leds, [ :pointer ], :uint
  attach_function :xkb_keymap_led_get_name, [ :pointer, :uint ], :string
  attach_function :xkb_keymap_led_get_index, [ :pointer, :string ], :uint
  attach_function :xkb_keymap_num_layouts_for_key, [ :pointer, :uint ], :uint
  attach_function :xkb_keymap_num_levels_for_key, [ :pointer, :uint, :uint ], :uint
  attach_function :xkb_keymap_key_get_syms_by_level, [ :pointer, :uint, :uint, :uint, :pointer ], :int
  attach_function :xkb_keymap_key_repeats, [ :pointer, :uint ], :int
  attach_function :xkb_state_new, [ :pointer ], :pointer
  attach_function :xkb_state_ref, [ :pointer ], :pointer
  attach_function :xkb_state_unref, [ :pointer ], :void
  attach_function :xkb_state_get_keymap, [ :pointer ], :pointer
  XKB_KEY_UP = 0
  XKB_KEY_DOWN = 1

  XKB_STATE_MODS_DEPRESSED = (1 << 0)
  XKB_STATE_MODS_LATCHED = (1 << 1)
  XKB_STATE_MODS_LOCKED = (1 << 2)
  XKB_STATE_MODS_EFFECTIVE = (1 << 3)
  XKB_STATE_LAYOUT_DEPRESSED = (1 << 4)
  XKB_STATE_LAYOUT_LATCHED = (1 << 5)
  XKB_STATE_LAYOUT_LOCKED = (1 << 6)
  XKB_STATE_LAYOUT_EFFECTIVE = (1 << 7)
  XKB_STATE_LEDS = (1 << 8)

  attach_function :xkb_state_update_key, [ :pointer, :uint, :int ], :int
  attach_function :xkb_state_update_mask, [ :pointer, :uint, :uint, :uint, :uint, :uint, :uint ], :int
  attach_function :xkb_state_key_get_syms, [ :pointer, :uint, :pointer ], :int
  attach_function :xkb_state_key_get_utf8, [ :pointer, :uint, :pointer, :uint ], :int
  attach_function :xkb_state_key_get_utf32, [ :pointer, :uint ], :uint
  attach_function :xkb_state_key_get_one_sym, [ :pointer, :uint ], :uint
  attach_function :xkb_state_key_get_layout, [ :pointer, :uint ], :uint
  attach_function :xkb_state_key_get_level, [ :pointer, :uint, :uint ], :uint
  XKB_STATE_MATCH_ANY = (1 << 0)
  XKB_STATE_MATCH_ALL = (1 << 1)
  XKB_STATE_MATCH_NON_EXCLUSIVE = (1 << 16)

  attach_function :xkb_state_serialize_mods, [ :pointer, :int ], :uint
  attach_function :xkb_state_serialize_layout, [ :pointer, :int ], :uint
  attach_function :xkb_state_mod_name_is_active, [ :pointer, :string, :int ], :int
  attach_function :xkb_state_mod_names_are_active, [ :pointer, :int, :int, :varargs ], :int
  attach_function :xkb_state_mod_index_is_active, [ :pointer, :uint, :int ], :int
  attach_function :xkb_state_mod_indices_are_active, [ :pointer, :int, :int, :varargs ], :int
  attach_function :xkb_state_mod_index_is_consumed, [ :pointer, :uint, :uint ], :int
  attach_function :xkb_state_mod_mask_remove_consumed, [ :pointer, :uint, :uint ], :uint
  attach_function :xkb_state_key_get_consumed_mods, [ :pointer, :uint ], :uint
  attach_function :xkb_state_layout_name_is_active, [ :pointer, :string, :int ], :int
  attach_function :xkb_state_layout_index_is_active, [ :pointer, :uint, :int ], :int
  attach_function :xkb_state_led_name_is_active, [ :pointer, :string ], :int
  attach_function :xkb_state_led_index_is_active, [ :pointer, :uint ], :int
