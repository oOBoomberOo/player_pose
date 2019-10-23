loot replace entity @s weapon.mainhand loot boomber:player_pose/pose
data modify entity @s HandItems[0].tag.ucit.player_pose.armor_items set from entity @s ArmorItems

data modify entity @s HandItems[0].tag.ucit.player_pose.armor_items[0].Slot set value 0b
data modify entity @s HandItems[0].tag.ucit.player_pose.armor_items[1].Slot set value 1b
data modify entity @s HandItems[0].tag.ucit.player_pose.armor_items[2].Slot set value 2b
data modify entity @s HandItems[0].tag.ucit.player_pose.armor_items[3].Slot set value 3b

execute if data entity @p[tag=boomber.pose.target] Inventory[{Slot: 100b}].id run data modify entity @s HandItems[0].tag.ucit.player_pose.previous_items append from entity @p[tag=boomber.pose.target] Inventory[{Slot: 100b}]
execute if data entity @p[tag=boomber.pose.target] Inventory[{Slot: 101b}].id run data modify entity @s HandItems[0].tag.ucit.player_pose.previous_items append from entity @p[tag=boomber.pose.target] Inventory[{Slot: 101b}]
execute if data entity @p[tag=boomber.pose.target] Inventory[{Slot: 102b}].id run data modify entity @s HandItems[0].tag.ucit.player_pose.previous_items append from entity @p[tag=boomber.pose.target] Inventory[{Slot: 102b}]
execute if data entity @p[tag=boomber.pose.target] Inventory[{Slot: 103b}].id run data modify entity @s HandItems[0].tag.ucit.player_pose.previous_items append from entity @p[tag=boomber.pose.target] Inventory[{Slot: 103b}]

execute at @s run function boomber:player_pose/pose/remove/previous_items

setblock ~ ~ ~ minecraft:shulker_box

data modify block ~ ~ ~ Items set from entity @s HandItems[0].tag.ucit.player_pose.armor_items

execute as @p[tag=boomber.pose.target] run loot replace entity @s armor.feet 4 mine ~ ~ ~ minecraft:iron_pickaxe{ucit: {id: "inventory_modifier"}}
execute as @p[tag=boomber.pose.target] run clear @s minecraft:player_head{ucit: {id: "player_head", from: "boomber:player_pose"}}

setblock ~ ~ ~ minecraft:air

kill @s