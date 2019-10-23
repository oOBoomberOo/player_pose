execute as @p[tag=boomber.pose.target] unless data entity @s Inventory[{Slot: 103b}].id run loot replace entity @e[type=armor_stand, tag=boomber.pose.spawning, limit=1] armor.head loot boomber:player_pose/player_head
execute if data entity @p[tag=boomber.pose.target] Inventory[{Slot: 103b}].id run data modify entity @s ArmorItems[3] set from entity @p[tag=boomber.pose.target] Inventory[{Slot: 103b}]

data modify entity @s ArmorItems[2] set from entity @p[tag=boomber.pose.target] Inventory[{Slot: 102b}]
data modify entity @s ArmorItems[1] set from entity @p[tag=boomber.pose.target] Inventory[{Slot: 101b}]
data modify entity @s ArmorItems[0] set from entity @p[tag=boomber.pose.target] Inventory[{Slot: 100b}]

replaceitem entity @p[tag=boomber.pose.target] armor.head minecraft:air
replaceitem entity @p[tag=boomber.pose.target] armor.chest minecraft:air
replaceitem entity @p[tag=boomber.pose.target] armor.legs minecraft:air
replaceitem entity @p[tag=boomber.pose.target] armor.feet minecraft:air