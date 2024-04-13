#!/usr/local/bin/node

// 2024 Acceptable Tech

const path = require('path')
const { exec } = require('child_process')

PATH = {}
PATH.SCRIPT = path.resolve(process.argv[1])
PATH.SCRIPT_DIR = path.dirname(PATH.SCRIPT)
PATH.PARENT = path.resolve(PATH.SCRIPT_DIR, "../../..")
PATH.RESOURCES = path.resolve(PATH.SCRIPT_DIR, "../Resources")

const print = console.log

function execute( bin_path, args ) {

	exec(`${bin_path} ${args.join(' ')}`, (error, stdout, stderr) => {
		if (error) {
			console.error(`${bin_path} failed with exit code ${error.code}`)
			return
		}
		if (stderr) {
			console.error(`Error: ${stderr}`)
			return
		}
		console.log(stdout)
	})

}

function main() {

	const msg = `I think I was launched from ${PATH.PARENT} and my resources are at ${PATH.RESOURCES}`
	print(msg)

	const spoken_msg = msg.replace( /\//g, ' slash ' )
	execute( '/usr/bin/say', [spoken_msg] )

}

main()
