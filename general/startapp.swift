import Foundation

let filename = "type.txt"
let fileURL = URL(fileURLWithPath: filename)

guard FileManager.default.fileExists(atPath: filename) else {
    print("type.txt doesn't exist\n")
    print("VoWAN ERROR: /general/type.txt MISSING OR NOT FOUND")
    exit(1)
}

do {
    let typeText = try String(contentsOf: fileURL, encoding: .utf8)

    let scriptPath: String?
    let message: String?

    if typeText.contains("pooler") {
        scriptPath = "../pooler/main.py"
        message = "RAN \n ../pooler/main.py"
    } else if typeText.contains("bank") {
        scriptPath = "../bank/main.py"
        message = "RAN \n ../bank/main.py"
    } else {
        scriptPath = nil
        message = nil
    }

    if let scriptPath, let message {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = ["python3", scriptPath]

        try process.run()
        process.waitUntilExit()

        print(message)
    }

    print("end ../general/startapp.py")
} catch {
    fputs("Error reading or running file: \(error)\n", stderr)
    exit(1)
}
