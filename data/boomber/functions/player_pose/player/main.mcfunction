execute unless entity @s[tag=boomber.pose.init] run function boomber:player_pose/player/init

scoreboard players enable @s pose
execute if score @s pose matches 0.. run function boomber:player_pose/player/pose_handler

execute as @s[tag=boomber.pose.posing] run function boomber:player_pose/player/pose_handler/posing