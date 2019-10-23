function boomber:player_pose/pose/create/armor

scoreboard players operation @s bb.pp.uid = #bb.pp.target_uid bb.pp.uid
scoreboard players operation @s pose = #bb.pp.target_pose pose
scoreboard players set @s bb.pp.tick -1
tag @s remove boomber.pose.spawning