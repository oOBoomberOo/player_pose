execute if score @s bb.pp.tick matches 0 run data merge entity @s {Pose: { RightArm: [ -130f, 87f, 0f ] } }
execute if score @s bb.pp.tick matches 1 run data merge entity @s {Pose: { RightArm: [ -135f, 87f, 0f ] } }
execute if score @s bb.pp.tick matches 2 run data merge entity @s {Pose: { RightArm: [ -140f, 87f, 0f ] } }
execute if score @s bb.pp.tick matches 3 run data merge entity @s {Pose: { RightArm: [ -145f, 87f, 0f ] } }
execute if score @s bb.pp.tick matches 5 run data merge entity @s {Pose: { RightArm: [ -150f, 87f, 0f ] } }
execute if score @s bb.pp.tick matches 6 run data merge entity @s {Pose: { RightArm: [ -145f, 87f, 0f ] } }
execute if score @s bb.pp.tick matches 7 run data merge entity @s {Pose: { RightArm: [ -140f, 87f, 0f ] } }
execute if score @s bb.pp.tick matches 8 run data merge entity @s {Pose: { RightArm: [ -135f, 87f, 0f ] } }
scoreboard players add @s bb.pp.tick 1
scoreboard players set @s[scores={bb.pp.tick=10..}] bb.pp.tick 0