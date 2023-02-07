## Unit Control

--------------------------------------

Allows controlling units with special 'Unit selection tool' and other tools available through the GUI.

--------------------------------------

If you do not want unit control to spawn any units from your deployers, add this remote interface:
remote.add_interface("unit-control-no-spawning",{["mod-name"] = function.returns_list_of_deployers_to_be_ignored})
You will need to input your own mod name so no conflicts will happen.
And for the funtion you need a funtion that returns an array of all the deployers you do not want unit control to spawn from.