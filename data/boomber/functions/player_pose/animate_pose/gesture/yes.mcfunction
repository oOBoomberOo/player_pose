execute if score @s bb.pp.tick matches 0 run data merge entity @s {Pose: {Head: [0f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 1 run data merge entity @s {Pose: {Head: [-5f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 2 run data merge entity @s {Pose: {Head: [-10f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 3 run data merge entity @s {Pose: {Head: [-15f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 4 run data merge entity @s {Pose: {Head: [-10f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 5 run data merge entity @s {Pose: {Head: [-5f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 6 run data merge entity @s {Pose: {Head: [0f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 7 run data merge entity @s {Pose: {Head: [5f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 8 run data merge entity @s {Pose: {Head: [10f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 9 run data merge entity @s {Pose: {Head: [15f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 10 run data merge entity @s {Pose: {Head: [10f, 0.0f, 0.0f]} }
execute if score @s bb.pp.tick matches 11 run data merge entity @s {Pose: {Head: [5f, 0.0f, 0.0f]} }
scoreboard players add @s bb.pp.tick 1
scoreboard players set @s[scores={bb.pp.tick=12..}] bb.pp.tick 0