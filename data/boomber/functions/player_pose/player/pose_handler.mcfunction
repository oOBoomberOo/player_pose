execute if score @s[tag=!boomber.pose.posing] pose matches 0 run function boomber:player_pose/player/pose_list/list
execute if score @s[tag=boomber.pose.posing] pose matches 0.. run function boomber:player_pose/player/pose_handler/reset
execute if score @s pose matches 1.. run function boomber:player_pose/player/pose_handler/index
execute if score @s pose matches 1.. run function boomber:player_pose/player/pose_handler/posed