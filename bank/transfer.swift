import Foundation
import CryptoKit
// ISTFG IF THIS CPOILOT SHIT DOESNT FUCK OFF

print("Enter a bank to transfer to\n")
if let userInput = readline() {
    // Send request to resolve server to get the banks ip from the banks id
    let request = "RESOLVE \(userInput)"
    let symmetricKey = SymmetricKey(size: .bits256)
    struct ChaChaPolyCipher {
        //
        func encrypt(_message: request) {

        }
    }
}