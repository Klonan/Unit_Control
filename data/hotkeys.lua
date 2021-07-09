local hotkeys = names.hotkeys
local tools = names.unit_tools

local become_an_hero =
{
  type = "custom-input",
  name = hotkeys.suicide,
  localised_name = {hotkeys.suicide},
  key_sequence = "DELETE",
  consuming = "game-only"
}

local become_all_an_hero =
{
  type = "custom-input",
  name = hotkeys.suicide_all,
  localised_name = {hotkeys.suicide_all},
  key_sequence = "CONTROL + DELETE",
  consuming = "game-only"
}

local attack_move = {
  type = "custom-input",
  name = tools.unit_attack_move_tool,
  localised_name = {tools.unit_attack_move_tool},
  key_sequence = "ALT + A",
  consuming = "game-only",
  item_to_spawn = tools.unit_attack_move_tool,
  action = "spawn-item"
}

local move = {
  type = "custom-input",
  name = tools.unit_move_tool,
  localised_name = {tools.unit_move_tool},
  key_sequence = "ALT + M",
  consuming = "game-only",
  item_to_spawn = tools.unit_move_tool,
  action = "spawn-item"
}

local patrol = {
  type = "custom-input",
  name = tools.unit_patrol_tool,
  localised_name = {tools.unit_patrol_tool},
  key_sequence = "ALT + P",
  consuming = "game-only",
  item_to_spawn = tools.unit_patrol_tool,
  action = "spawn-item"
}

local stop =
{
  type = "custom-input",
  name = hotkeys.stop,
  localised_name = {hotkeys.stop},
  key_sequence = "ALT + S",
  consuming = "game-only"
}

local queue_stop =
{
  type = "custom-input",
  name = hotkeys.queue_stop,
  localised_name = {hotkeys.queue_stop},
  key_sequence = "SHIFT + ALT + S",
  consuming = "game-only"
}

local hold_position =
{
  type = "custom-input",
  name = hotkeys.hold_position,
  localised_name = {hotkeys.hold_position},
  key_sequence = "ALT + H",
  consuming = "game-only"
}

local queue_hold_position =
{
  type = "custom-input",
  name = hotkeys.queue_hold_position,
  localised_name = {hotkeys.queue_hold_position},
  key_sequence = "SHIFT + ALT + H",
  consuming = "game-only"
}

local quick_unit_selection =
{
  type = "custom-input",
  name = tools.unit_selection_tool,
  localised_name = {tools.unit_selection_tool},
  key_sequence = "ALT + mouse-button-1",
  consuming = "game-only",
  item_to_spawn = tools.unit_selection_tool,
  action = "spawn-item"
}

local select_all_units =
{
  type = "custom-input",
  name = hotkeys.select_all_units,
  localised_name = {hotkeys.select_all_units},
  key_sequence = "SHIFT + ALT + mouse-button-1",
  consuming = "game-only"
}

local select_all_deployers =
{
  type = "custom-input",
  name = hotkeys.select_all_deployers,
  localised_name = {hotkeys.select_all_deployers},
  key_sequence = "SHIFT + ALT + mouse-button-2",
  consuming = "game-only"
}

local left_click =
{
  type = "custom-input",
  name = "left-click",
  localised_name = "Mouse click",
  key_sequence = "mouse-button-1",
  consuming = "none"
}

local shift_left_click =
{
  type = "custom-input",
  name = "shift-left-click",
  localised_name = "Mouse click",
  key_sequence = "SHIFT + mouse-button-1",
  consuming = "none"
}

local right_click =
{
  type = "custom-input",
  name = "right-click",
  localised_name = "Mouse click",
  key_sequence = "mouse-button-2",
  consuming = "none"
}

local shift_right_click =
{
  type = "custom-input",
  name = "shift-right-click",
  localised_name = "Mouse click",
  key_sequence = "SHIFT + mouse-button-2",
  consuming = "none"
}

data:extend
{
  become_an_hero,
  become_all_an_hero,
  attack_move,
  move,
  patrol,
  stop,
  queue_stop,
  hold_position,
  queue_hold_position,
  quick_unit_selection,
  select_all_units,
  left_click,
  right_click,
  shift_left_click,
  shift_right_click
}