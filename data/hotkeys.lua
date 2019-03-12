local hotkeys = names.hotkeys

local move_unit =
{
  type = "custom-input",
  name = hotkeys.unit_move,
  localised_name = hotkeys.unit_move,
  key_sequence = "SHIFT + A",
  consuming = "game-only"
}

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

data:extend
{
  --move_unit,
  become_an_hero,
  become_all_an_hero
}