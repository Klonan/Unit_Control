--Shared data interface between data and script, notably prototype names.

local data = {}

data.hotkeys =
{
  --unit_move = "move-unit",
  suicide = "suicide",
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
