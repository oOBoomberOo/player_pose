tellraw @s [{"text": "Stop posing...", "color": "red"}]

tag @s add boomber.pose.target
scoreboard players operation #bb.pp.target_uid bb.pp.uid = @s bb.pp.uid
execute as @e[type=armor_stand, tag=boomber.pose.pose] if score @s bb.pp.uid = #bb.pp.target_uid bb.pp.uid positioned ~ 255 ~ run function boomber:player_pose/pose/remove

function boomber:player_pose/player/pose_handler/return

tag @s remove boomber.pose.posing
tag @s remove boomber.pose.target
execute if score @s pose matches ..0 run scoreboard players set @s pose -1