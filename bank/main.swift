import Foundation
let process = process()
print("-- VoWAN BANK PORTAL --")

while true {
    if let userInput = readline() {
        // Commands
        if userInput.contains("nfcreg") {
            // nfcreg command
            process.executableURL = URL("nfcreg.swift")
            do {
                try process.run()
                process.waitUntilExit()
            } catch {
                print("Couldn't launch nfcreg.swift. ERROR: \(error)")
            }
        } else if userInput.contans("transfer") {
            // sendto command
            process.executableURL = URL("transfer.swift")
            do {
                try process.run()
                process.waitUntilExit()
            } catch {
                print("Couldn't launch transfer.swift. ERROR: \(error)")
            }
        }  else if userInput.contains("balance") {
            // balance command
        }
    }
}