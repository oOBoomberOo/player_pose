execute if score @s bb.pp.tick matches 0 run data merge entity @s {Pose: { RightArm: [ -130f, 60f, 10f ] } }
execute if score @s bb.pp.tick matches 1 run data merge entity @s {Pose: { RightArm: [ -135f, 60f, 10f ] } }
execute if score @s bb.pp.tick matches 2 run data merge entity @s {Pose: { RightArm: [ -140f, 60f, 10f ] } }
execute if score @s bb.pp.tick matches 3 run data merge entity @s {Pose: { RightArm: [ -145f, 60f, 10f ] } }
execute if score @s bb.pp.tick matches 4 run data merge entity @s {Pose: { RightArm: [ -150f, 60f, 10f ] } }
execute if score @s bb.pp.tick matches 5 run data merge entity @s {Pose: { RightArm: [ -155f, 60f, 10f ] } }
execute if score @s bb.pp.tick matches 6 run data merge entity @s {Pose: { RightArm: [ -150f, 60f, 10f ] } }
execute if score @s bb.pp.tick matches 7 run data merge entity @s {Pose: { RightArm: [ -145f, 60f, 10f ] } }
execute if score @s bb.pp.tick matches 8 run data merge entity @s {Pose: { RightArm: [ -140f, 60f, 10f ] } }
execute if score @s bb.pp.tick matches 9 run data merge entity @s {Pose: { RightArm: [ -135f, 60f, 10f ] } }
scoreboard players add @s bb.pp.tick 1
scoreboard players set @s[scores={bb.pp.tick=10..}] bb.pp.tick 0