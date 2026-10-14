import Foundation
let process = process()
print("-- VoWAN BANK PORTAL --")

while true {
    if let userInput = readline() {
        // Commands
        if userInput.contains("nfcreg") {
            // nfcreg command - ADD ARGUMENTS
            process.executableURL = URL("nfcreg.swift")
            do {
                try process.run()
                process.waitUntilExit()
            } catch {
                print("Couldn't launch nfcreg.swift. ERROR: \(error)")
            }
        } else if userInput.contans("transfer") {
            // transfer command - ADD ARGUMENTS
            process.executableURL = URL("transfer.swift")
            do {
                try process.run()
                process.waitUntilExit()
            } catch {
                print("Couldn't launch transfer.swift. ERROR: \(error)")
            }
        }  else if userInput.contains("balance") {
            // balance command
            process.executableURL = URL("balance.swift")
            do {
                try process.run()
                process.waitUntilExit()
            } catch {
                print("Couldn't launch balance.swift. ERROR: \(error)")
            }
        }
    }
}