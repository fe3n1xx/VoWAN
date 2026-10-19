import Foundation
let process = process()
print("-- VoWAN BANK PORTAL --\n")

let coinInfo = "../coin_info.json"
if let JSONData = try? Data(contentsOf: URL(fileURLWithPath: coinInfo)) {
    do {
        //
        if let data = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: any] {
            //
            let nfcOn = ["nfc"] as Bool
        }
    }
}
while true {
    if let userInput = readline() {
        // Commands
        if userInput.contains("nfcreg") {
            // nfcreg command - ADD ARGUMENTS
            if nfcOn {
            process.executableURL = URL("nfcreg.swift")
                do {
                    try process.run()
                    process.waitUntilExit()
                } catch {
                    print("Couldn't launch nfcreg.swift. ERROR: \(error)")
                }
            } else {
                print("NFC is turned OFF")
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
        } else if userInput.contains("nfc") {
            // nfc transfer (hybrid currency)
            if nfcOn {
                //
                process.executableURL = URL("nfctransfer.swift")
                do {
                    try process.run()
                    process.waitUntilExit()
                } catch {
                    print("Couldn't launch nfctransfer.swift. ERROR: \(error)")
                }
            } else {
                print("NFC is turned OFF")
            }
        }
    }
}