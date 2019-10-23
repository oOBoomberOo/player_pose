scoreboard players set @s pose -1

scoreboard players operation @s bb.pp.uid = #bb.pp.current_uid bb.pp.uid
scoreboard players add #bb.pp.current_uid bb.pp.uid 1

tag @s add boomber.pose.init