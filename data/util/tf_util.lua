local util = require("util")

util.path = function(str)
  return "__Unit_Control__/" .. str
end

local is_sprite_def = function(array)
  return array.width and array.height and (array.filename or array.stripes or array.filenames)
end

util.is_sprite_def = is_sprite_def

local recursive_hack_scale
recursive_hack_scale = function(array, scale)
  for k, v in pairs (array) do
    if type(v) == "table" then
      if is_sprite_def(v) then
        v.scale = (v.scale or 1) * scale
        if v.shift then
          v.shift[1], v.shift[2] = v.shift[1] * scale, v.shift[2] * scale
        end
      end
      if v.source_offset then
        v.source_offset[1] = v.source_offset[1] * scale
        v.source_offset[2] = v.source_offset[2] * scale
      end
      if v.projectile_center then
        v.projectile_center[1] = v.projectile_center[1] * scale
        v.projectile_center[2] = v.projectile_center[2] * scale
      end
      if v.projectile_creation_distance then
        v.projectile_creation_distance = v.projectile_creation_distance * scale
      end
      recursive_hack_scale(v, scale)
    end
  end
end
util.recursive_hack_scale = recursive_hack_scale

local recursive_hack_animation_speed
recursive_hack_animation_speed = function(array, scale)
  for k, v in pairs (array) do
    if type(v) == "table" then
      if is_sprite_def(v) then
        v.animation_speed = v.animation_speed * scale
      end
      recursive_hack_animation_speed(v, scale)
    end
  end
end
util.recursive_hack_animation_speed = recursive_hack_animation_speed

local recursive_hack_tint
recursive_hack_tint = function(array, tint)
  for k, v in pairs (array) do
    if type(v) == "table" then
      if is_sprite_def(v)  then
        v.tint = tint
      end
      recursive_hack_tint(v, tint)
    end
  end
end
util.recursive_hack_tint = recursive_hack_tint

local recursive_hack_make_hr
recursive_hack_make_hr = function(prototype)
  for k, v in pairs (prototype) do
    if type(v) == "table" then
      if is_sprite_def(v) and v.hr_version then
        prototype[k] = v.hr_version
        --v.scale = v.scale * 0.5
        v.hr_version = nil
      end
      recursive_hack_make_hr(v)
    end
  end
end
util.recursive_hack_make_hr = recursive_hack_make_hr

util.scale_box = function(box, scale)
  box[1][1] = box[1][1] * scale
  box[1][2] = box[1][2] * scale
  box[2][1] = box[2][1] * scale
  box[2][2] = box[2][2] * scale
  return box
end

util.scale_boxes = function(prototype, scale)
  for k, v in pairs {"collision_box", "selection_box"} do
    local box = prototype[v]
    if box then
      local width = (box[2][1] - box[1][1]) * (scale / 2)
      local height = (box[2][2] - box[1][2]) * (scale / 2)
      local x = (box[1][1] + box[2][1]) / 2
      local y = (box[1][2] + box[2][2]) / 2
      box[1][1], box[2][1] = x - width, x + width
      box[1][2], box[2][2] = y - height, y + height
    end
  end
end

util.remove_flag = function(prototype, flag)
  if not prototype.flags then return end
  for k, v in pairs (prototype.flags) do
    if v == flag then
      table.remove(prototype.flags, k)
      break
    end
  end
end

util.add_flag = function(prototype, flag)
  if not prototype.flags then return end
  table.insert(prototype.flags, flag)
end

util.base_player = function()

  local player = util.table.deepcopy(data.raw.player.player or error("Wat man cmon why"))
  player.ticks_to_keep_gun = SU(600)
  player.ticks_to_keep_aiming_direction = SU(100)
  player.ticks_to_stay_in_combat = SU(600)
  util.remove_flag(player, "not-flammable")
  return player
end

util.damage_type = function(name)
  if not data.raw["damage-type"][name] then
    data:extend{{type = "damage-type", name = name, localised_name = name}}
  end
  return name
end

util.ammo_category = function(name)
  if not data.raw["ammo-category"][name] then
    data:extend{{type = "ammo-category", name = name, localised_name = name}}
  end
  return name
end

util.base_gun = function(name)
  return
  {
    name = name,
    localised_name = name,
    type = "gun",
    stack_size = 1,
    flags = {}
  }
end

util.base_ammo = function(name)
  return
  {
    name = name,
    localised_name = name,
    type = "ammo",
    stack_size = 1,
    magazine_size = 1,
    flags = {}
  }
end

local base_speed = 0.25
util.speed = function(multiplier)
  return multiplier * SD(base_speed)
end

util.remove_from_list = function(list, name)
  local remove = table.remove
  for i = #list, 1, -1 do
    if list[i] == name then
      remove(list, i)
    end
  end
end

local recursive_hack_something
recursive_hack_something = function(prototype, key, value)
  for k, v in pairs (prototype) do
    if type(v) == "table" then
      recursive_hack_something(v, key, value)
    end
  end
  prototype[key] = value
end
util.recursive_hack_something = recursive_hack_something

local recursive_hack_blend_mode
recursive_hack_blend_mode = function(prototype, value)
  for k, v in pairs (prototype) do
    if type(v) == "table" then
      if util.is_sprite_def(v) then
        v.blend_mode = value
      end
      recursive_hack_blend_mode(v, value)
    end
  end
end

util.copy = util.table.deepcopy

util.flying_unit_collision_mask = function()
  return {"not-colliding-with-itself", "layer-15"}
end

util.ground_unit_collision_mask = function()
  return {"not-colliding-with-itself", "player-layer", "train-layer"}
end

util.projectile_collision_mask = function()
  return {"layer-15", "player-layer", "train-layer"}
end

util.shift_box = function(box, shift)
  local left_top = box[1]
  local right_bottom = box[2]
  left_top[1] = left_top[1] + shift[1]
  left_top[2] = left_top[2] + shift[2]
  right_bottom[1] = right_bottom[1] + shift[1]
  right_bottom[2] = right_bottom[2] + shift[2]
  return box
end


util.shift_layer = function(layer, shift)
  layer.shift = layer.shift or {0,0}
  layer.shift[1] = layer.shift[1] + shift[1]
  layer.shift[2] = layer.shift[2] + shift[2]
  return layer
end

util.entity_types = function()
  return
  {
    accumulator = true,
    ["ammo-turret"] = true,
    ["arithmetic-combinator"] = true,
    arrow = true,
    ["artillery-flare"] = true,
    ["artillery-projectile"] = true,
    ["artillery-turret"] = true,
    ["artillery-wagon"] = true,
    ["assembling-machine"] = true,
    beacon = true,
    beam = true,
    boiler = true,
    car = true,
    ["cargo-wagon"] = true,
    ["character-corpse"] = true,
    cliff = true,
    ["combat-robot"] = true,
    ["constant-combinator"] = true,
    ["construction-robot"] = true,
    container = true,
    corpse = true,
    ["curved-rail"] = true,
    ["decider-combinator"] = true,
    ["deconstructible-tile-proxy"] = true,
    decorative = true,
    ["electric-energy-interface"] = true,
    ["electric-pole"] = true,
    ["electric-turret"] = true,
    ["entity-ghost"] = true,
    explosion = true,
    fire = true,
    fish = true,
    ["flame-thrower-explosion"] = true,
    ["fluid-turret"] = true,
    ["fluid-wagon"] = true,
    ["flying-text"] = true,
    furnace = true,
    gate = true,
    generator = true,
    ["heat-interface"] = true,
    ["heat-pipe"] = true,
    ["highlight-box"] = true,
    ["infinity-container"] = true,
    ["infinity-pipe"] = true,
    inserter = true,
    ["item-entity"] = true,
    ["item-request-proxy"] = true,
    lab = true,
    lamp = true,
    ["land-mine"] = true,
    ["leaf-particle"] = true,
    loader = true,
    locomotive = true,
    ["logistic-container"] = true,
    ["logistic-robot"] = true,
    market = true,
    ["mining-drill"] = true,
    ["offshore-pump"] = true,
    particle = true,
    ["particle-source"] = true,
    pipe = true,
    ["pipe-to-ground"] = true,
    player = true,
    ["player-port"] = true,
    ["power-switch"] = true,
    ["programmable-speaker"] = true,
    projectile = true,
    pump = true,
    radar = true,
    ["rail-chain-signal"] = true,
    ["rail-remnants"] = true,
    ["rail-signal"] = true,
    reactor = true,
    resource = true,
    roboport = true,
    ["rocket-silo"] = true,
    ["rocket-silo-rocket"] = true,
    ["rocket-silo-rocket-shadow"] = true,
    ["simple-entity"] = true,
    ["simple-entity-with-force"] = true,
    ["simple-entity-with-owner"] = true,
    smoke = true,
    ["smoke-with-trigger"] = true,
    ["solar-panel"] = true,
    ["speech-bubble"] = true,
    splitter = true,
    sticker = true,
    ["storage-tank"] = true,
    ["straight-rail"] = true,
    stream = true,
    ["tile-ghost"] = true,
    ["train-stop"] = true,
    ["transport-belt"] = true,
    tree = true,
    turret = true,
    ["underground-belt"] = true,
    unit = true,
    ["unit-spawner"] = true,
    wall = true
  }
end


return util
