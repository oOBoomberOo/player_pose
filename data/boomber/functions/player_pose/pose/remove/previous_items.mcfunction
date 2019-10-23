data modify entity @s HandItems[0].tag.ucit.player_pose.previous_item set from entity @s HandItems[0].tag.ucit.player_pose.previous_items[0]
data remove entity @s HandItems[0].tag.ucit.player_pose.previous_items[0]
execute store result score #bb.pp.length bb.variable run data get entity @s HandItems[0].tag.ucit.player_pose.previous_items

execute if data entity @s HandItems[0].tag.ucit.player_pose.previous_item run function boomber:player_pose/pose/remove/previous_item

execute if score #bb.pp.length bb.variable matches 1.. run function boomber:player_pose/pose/remove/previous_items