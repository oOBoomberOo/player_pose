effect give @s minecraft:invisibility 1 0 true
execute store result score #bb.pp.rot.x bb.variable run data get entity @s Rotation[0] 1000
execute store result score #bb.pp.rot.y bb.variable run data get entity @s Rotation[1] 1000

scoreboard players operation #bb.pp.target_uid bb.pp.uid = @s bb.pp.uid
execute as @e[type=armor_stand, tag=boomber.pose.pose] if score @s bb.pp.uid = #bb.pp.target_uid bb.pp.uid run tag @s add boomber.pose.select
execute rotated ~ 0 positioned ^ ^ ^-0.5 as @e[tag=boomber.pose.select] run function boomber:player_pose/player/pose_handler/pose

tag @e[tag=boomber.pose.select] remove boomber.pose.select