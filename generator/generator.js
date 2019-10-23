const fs = require('fs');
const path = require('path');
const mkdirp = require('mkdirp');
const { promisify } = require('util');
const del = require('del');

const outpath = '../data/boomber/functions/player_pose';
// const outpath = 'output';

// ! Imporntant ! Will delete the entire output directory
// del.sync(`${outpath}/**`);
mkdirp.sync(outpath);

class AnimatedPose {
	constructor(from, to, frame) {
		this.from = from;
		this.to = to;
		this.frame = frame;
	}

	get size() {
		return Math.abs(this.from - this.to);
	}

	get step_size() {
		return this.frame / this.size;
	}

	index(step) {
		return this.from + (step / this.step_size);
	}

	compile(step) {
		return `${this.index(step).toFixed(7)}f`;
	}
}

async function do_stuff() {
	const poses = JSON.parse(fs.readFileSync('data.json'));
	let promises = [];
	let logs = [];

	for (const category_name in poses) {
		const category = poses[category_name];
		for (let pose_name in category) {
			const { type, pose, rotation_offset = 0, frame = 0 } = category[pose_name];

			if (type === 'static_pose') {
				const data = compile_pose(pose, pose_name);
				logs.push({ type, name: pose_name, category: category_name });

				const pose_content = [`data merge entity @s {Pose: ${data.pose}}`];
				if (Math.round(rotation_offset * 1000) !== 0) {
					pose_content.push(`scoreboard players set @s bb.pp.rot_offset ${Math.round(rotation_offset * 1000)}`);
				}

				promises.push(writeFile(pose_content, [type, category_name, data.file_name]));
				promises.push(writeFile(`tellraw @s [{"text": "Now posing [${category_name}/${pose_name}]...", "color": "green"}]`, ['player/pose_list', category_name, data.file_name]));
			}
			else if (type === 'animate_pose') {
				const file_name = `${pose_name}.mcfunction`;
				logs.push({ type, name: pose_name, category: category_name });

				const size = pose.length;
				const step = frame / size ? frame / size: 1;
				const iteration = Math.ceil(frame / step);
				let pose_list = [];

				for (let i = 0; i < iteration; i++) {
					const data = compile_pose(pose[i], '');
					
					pose_list.push(`execute if score @s bb.pp.tick matches ${Math.floor(i * step)} run data merge entity @s {Pose: ${data.pose} }`);
				}

				pose_list.push(`scoreboard players add @s bb.pp.tick 1`);
				pose_list.push(`scoreboard players set @s[scores={bb.pp.tick=${Math.floor(frame)}..}] bb.pp.tick 0`);

				promises.push(writeFile(pose_list, [type, category_name, file_name]));
				promises.push(writeFile(`tellraw @s [{"text": "Now playing [${category_name}/${pose_name}]...", "color": "green"}]`, ['player/pose_list', category_name, file_name]));
			}
		}
	}

	const pose_handler = logs.map(({ name, category }, index) => `execute if score @s pose matches ${index + 1} run function boomber:player_pose/player/pose_list/${category}/${name}`);
	promises.push(writeFile(pose_handler, ['player', 'pose_handler', 'index.mcfunction']));

	const pose_main = logs.map(({ type, name, category }, index) => `execute if score @s pose matches ${index + 1} run function boomber:player_pose/${type}/${category}/${name}`);
	promises.push(writeFile(pose_main, ['pose', 'main.mcfunction']));

	const pose_list = logs.map(({ name, category }, index) => `tellraw @s [{"text": "${index + 1}", "color": "gold", "bold": true}, {"text": "> ", "color": "gray", "bold": false}, {"text": "${category}/${name}", "color": "green", "bold": false, "clickEvent": {"action": "run_command", "value": "/trigger pose set ${index + 1}"}, "hoverEvent": {"action": "show_text", "value": [{"text": "Click to pose"}]}}]`);
	pose_list.push(`scoreboard players set @s pose -1`);
	promises.push(writeFile(pose_list, ['player', 'pose_list', 'list.mcfunction']));

	const static_pose_size = logs.filter(v => v.type === 'static_pose').length;
	const animate_pose_size = logs.filter(v => v.type === 'animate_pose').length;

	await Promise.all(promises);
	console.log(`Generated ${logs.length} poses (${static_pose_size} static poses and ${animate_pose_size} animated poses) and ${promises.length} files in total.`);
}

function compile_pose(pose, name) {
	return {
		a: name,
		b: pose,
		get file_name() {
			return this.a + '.mcfunction';
		},
		get pose() {
			if (typeof this.b === "object") {
				let poses = [];
				for (const key in this.b) {
					const pose = this.b[key];
					if (Array.isArray(pose)) {
						poses.push(`${key}: [ ${pose.map(v => v.toString() + 'f').join(', ')} ]`);
					}
					else if (typeof pose === "string") {
						poses.push(`${key}: ${pose}`);
					}
				}
				return `{ ${poses.join(', ')} }`;
			}
			else if (typeof this.b === "string") {
				return this.b;
			}
			else {
				return '{}';
			}
		}
	}
}

function to_range(range, frame) {
	const splits = range.toString().split('..');
	if (splits.length == 1) {
		const value = parseFloat(splits[0]);
		return new AnimatedPose(value, value, frame);
	}
	else if (splits.length >= 2) {
		const [start, end] = splits;
		const from = parseFloat(start);
		const to = parseFloat(end) + 1;
		return new AnimatedPose(from, to, frame);
	}
	else {
		return new AnimatedPose(0, 0, frame);
	}
}

async function writeFile(data, path_list) {
	const file = path.join(outpath, ...path_list);
	const directory = path.dirname(file);
	const writer = promisify(fs.writeFile);
	const dir_writer = promisify(mkdirp);
	await dir_writer(directory);
	if (Array.isArray(data)) {
		return await writer(file, data.join('\n'));
	}
	else {
		return await writer(file, `${data}`);
	}
}

do_stuff();