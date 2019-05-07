--Shared data interface between data and script, notably prototype names.

local data = {}

data.hotkeys =
{
  suicide = "suicide",
  suicide_all = "suicide-all",
  stop = "stop",
  queue_stop = "queue-stop",
  hold_position = "hold-position",
  queue_hold_position = "queue-hold-position",
  select_all_units = "select-all-units",
  select_all_deployers = "select-all-deployers",
}

data.unit_tools =
{
  unit_selection_tool = "select-units",
  deployer_selection_tool = "select-deployers",
  unit_move_tool = "move-to-position",
  unit_patrol_tool = "add-patrol-waypoint",
  unit_move_sound = "unit-move-sound",
  unit_attack_move_tool = "attack-move-to-position",
  unit_attack_tool = "attack-targets",
  unit_force_attack_tool = "force-attack-targets",
  unit_follow_tool = "follow-target",
  select_units_shortcut = "select-units-shortcut",
  select_deployers_shortcut = "select-deployers-shortcut",
}

return data
