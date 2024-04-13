#!/usr/bin/env xcrun swift

// 2024 Acceptable Tech

import Foundation

struct PATH {
	static func ancestor( _ dir: URL, _ levels: Int ) -> URL {
		return ( 0 ..< levels ).reduce(dir){ path, _ in path.deletingLastPathComponent() }
	}	
	static let SCRIPT = URL( fileURLWithPath: CommandLine.arguments[0] )
	static let SCRIPT_DIR = ancestor(SCRIPT,1)
	static let PARENT = ancestor(SCRIPT_DIR,3)
	static let RESOURCES = ancestor(SCRIPT_DIR,2).appendingPathComponent("Resources")
}

func exec( _ bin_path: String, _ args: [String] ) {
	let proc = Process()
	proc.executableURL = URL( fileURLWithPath: bin_path )
	proc.arguments = args
	do {
		try proc.run()
		proc.waitUntilExit()
		if proc.terminationStatus != 0 {
			print("\(bin_path) failed with exit code \(proc.terminationStatus).")
		}
	} catch { print("failed to run \(bin_path): \(error)") }	
}

func main() {

	let msg = "I think I was launched from \(PATH.PARENT.path) and my resources are at \(PATH.RESOURCES.path)"
	print( msg )

	let spoken_msg = msg.replacingOccurrences( of: "/", with: " slash " )
	exec( "/usr/bin/say", [spoken_msg] )

}

main()
