scoreboard objectives add bb.variable dummy
scoreboard objectives add bb.calculation dummy
scoreboard objectives add bb.success dummy

scoreboard objectives add bb.pp.uid dummy
scoreboard objectives add bb.pp.tick dummy
scoreboard objectives add bb.pp.rot_offset dummy
scoreboard objectives add pose trigger {"text": "Player Pose"}

execute unless score #bb.pp.current_uid bb.pp.uid matches -2147483648..2147483647 run scoreboard players set #bb.pp.current_uid bb.pp.uid 0