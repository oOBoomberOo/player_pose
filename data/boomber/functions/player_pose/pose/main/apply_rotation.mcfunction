scoreboard players operation #bb.pp.rot.x bb.calculation = #bb.pp.rot.x bb.variable
scoreboard players operation #bb.pp.rot.x bb.calculation += @s bb.pp.rot_offset
scoreboard players operation #bb.pp.rot.y bb.calculation = #bb.pp.rot.y bb.variable

# execute unless score #bb.pp.rot.y bb.calculation matches 0 run data merge entity @s {Pose: {Head: [45.0f, 0.0f, 0.0f]}}

execute store result entity @s Rotation[0] float 0.001 run scoreboard players get #bb.pp.rot.x bb.calculation
# execute store result entity @s Pose.Head[0] float 0.001 run scoreboard players get #bb.pp.rot.y bb.calculation