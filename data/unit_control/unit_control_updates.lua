local util = require("data/util/tf_util")
local tools = require("shared").unit_tools
local path = util.path("data/unit_control/")

local deployer_tool = data.raw["selection-tool"][tools.deployer_selection_tool]
local entity_filter = deployer_tool.entity_filters
local alt_filter = deployer_tool.alt_entity_filters

for entity_type, bool in pairs (util.entity_types()) do
  local entities = data.raw[entity_type]
  if entities then
    for name, entity in pairs (entities) do
      if entity.is_deployer then
        table.insert(entity_filter, entity.name)
        table.insert(alt_filter, entity.name)
      end      
    end
  end
end