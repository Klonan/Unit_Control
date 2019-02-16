local util = require("data/util/tf_util")
local names = require("shared")
local tools = names.unit_tools
local path = util.path("data/unit_control/")

local deployer_tool = data.raw["selection-tool"][tools.deployer_selection_tool]
local entity_filter = deployer_tool.entity_filters
local alt_filter = deployer_tool.alt_entity_filters

for name, entity in pairs (data.raw["assembling-machine"]) do
  if entity.is_deployer then
    table.insert(entity_filter, entity.name)
    table.insert(alt_filter, entity.name)
  end
end

for name, entity in pairs (data.raw["furnace"]) do
  if entity.is_deployer then
    table.insert(entity_filter, entity.name)
    table.insert(alt_filter, entity.name)
  end
end
