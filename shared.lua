--Shared data interface between data and script, notably prototype names.

local data = {}

data.hotkeys =
{
  --unit_move = "Move unit",
  suicide = "Suicide",
}

data.unit_tools =
{
  unit_selection_tool = "Select units",
  deployer_selection_tool = "Select deployers",
  unit_move_tool = "Move to position",
  unit_patrol_tool = "Add patrol waypoint",
  unit_move_sound = "Unit move sound",
  unit_attack_move_tool = "Attack move to position",
  unit_attack_tool = "Attack targets",
  unit_force_attack_tool = "Force attack targets",
  unit_follow_tool = "Follow target",
  move_indicator = "Move Indicator",
  attack_move_indicator = "Attack Move Indicator"
}

return data
