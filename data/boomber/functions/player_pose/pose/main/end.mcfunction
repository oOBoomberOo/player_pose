scoreboard players operation #bb.pp.target_uid bb.pp.uid = @s bb.pp.uid
execute as @a[tag=boomber.pose.posing] if score @s bb.pp.uid = #bb.pp.target_uid bb.pp.uid run scoreboard players set @s pose 0