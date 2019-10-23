summon item ~ ~ ~ {Item: {id: "minecraft:stone", Count: 1b}, PickupDelay: 5s, Tags: ['boomber.pose.previous_item']}
data modify entity @e[type=item, tag=boomber.pose.previous_item, limit=1] Item set from entity @s HandItems[0].tag.ucit.player_pose.previous_item
tag @e[type=item, tag=boomber.pose.previous_item] remove boomber.pose.previous_item