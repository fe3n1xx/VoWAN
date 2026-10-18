import Foundation
import CryptoKit
import Network

// get the port and resolve server from coin_info.json
let coinInfo = "../coin_info.json"
if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: coinInfo)) {
    do {
        //
        if let data = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: any] {
            //
            let port = data["port"] as Integer
            let resolver = data["vowan_resolver_server"] as String
        } catch {
            print("Error parsing JSON")
        }
    }
}
print("Enter a bank to transfer to\n")
if let userInput = readline() { 
    //
    let request = "resolve \(userInput)"
    let connection = NWConnection(
        //
        host: resolver,
        port: NWEndPoint.Port(rawvalue: port),
        using: NWParameters(tls: NWProtocolTLS.Options()
            tcp: NWProtocolTCP.Options()
        )

    )
    connection.stateUpdateHandler = { state in
        switch state {
        case .ready:
            connection.send(
                content: Data(request),
                completion: .contentProcessed { error in
                    if let error { print("Couldn't send resolve request: \(error)") }
                }
            )
            connection.recieve(minimumIncompleteLength: 1, maximumLength: 4096) {
                data, _,_, error in
                if let error { print("Recieve Error: \(error)")}
                if let data { print("Data recieved from \(resolve): \(error)") }
            }
        }
        case .failed(let error):
            print("Connection failed: \(error)")
        default:
            break
    }
    connection.start(queue: .main)
}
