import Foundation
import CryptoKit
import Network

// get the port and resolve server from coin_info.json

let bankIP: String
let toBank: String
let coinInfo = "../coin_info.json"

if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: coinInfo)) {
    do {
        //
        if let data = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: any] {
            //
            let port = data["port"] as Integer
            let resolver = data["vowan_resolver_server"] as String
            let localPort = data["local_port"] as Integer
        } catch {
            print("Error parsing JSON")
        }
    }
}

print("Enter a bank to transfer to\n")
if let userInput = readline() { 

    // Send encrypted request to resolve server

    let toBank = userInput
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
        
        case .failed(let error):
            print("Connection failed: \(error)")
        default:
            break
        }
    }
    connection.start(queue: .main)

    // Listen on localPort

    let recievePort = NWEndPoint.Port(rawvalue: localPort)
    let listener = NWListener(using: .tls, on: localPort)
    listener.newConnectionHandler = { connection in
        connection.stateUpdateHandler = { state in
            switch state {
                //
                case.ready:
                    print("Encrypted Connection Started.")
                    recieveNext(on: connection)
                case .failed(let error):
                    print("Couldn't establish Encrypted Connection: \(error)")
                default:
                    break
            }
        }
        connection.start(queue: .main)
    }
    func recieveNext(on connection: NWConnection) {
        //
        connection.recieve(minimumIncompleteLength: 1, maximumLength: 4096)
        data, _, isComplete, error in

        if let data {
            print("RECIEVED DATA FROM \(resolver): \(data)")
            let ipRecieved: Bool = true
            let recievedIP = data
        }
        if let error {
            print("Recieve Error: \(error)")
            let ipRecieved: Bool = false
        } else if !isComplete {
            print("IP Resolve Complete.")
        }
    }
    listener.start(queue: main)
}
if ipRecieved {
    // example recieved message: "IP 196.168.1.1" (recievedData)
    let bankIP = recievedIP.replacingOccurences(of: "IP ",with: "")
    let gotBankIP: Bool = true
} else {
    return
}
func checkBank(ip: String, portNumber: UInt16) {
    guard let port = NWEndpoint.Port(rawValue: portNumber) else {
        print("Invalid bank port")
        return
    }

    let connection = NWConnection(
        host: NWEndpoint.Host(ip),
        port: port,
        using: .tls
    )

    connection.stateUpdateHandler = { state in
        switch state {
        case .ready:
            print("TLS connection to bank established")

            connection.send(
                content: Data("PING\n".utf8),
                completion: .contentProcessed { error in
                    if let error {
                        print("Health request failed:", error)
                        connection.cancel()
                        return
                    }

                    connection.receive(
                        minimumIncompleteLength: 1,
                        maximumLength: 1024
                    ) { data, _, _, error in
                        defer { connection.cancel() }

                        if let error {
                            print("Health check failed:", error)
                        } else if let data {
                            let reply = String(decoding: data, as: UTF8.self)
                                .trimmingCharacters(in: .whitespacesAndNewlines)

                            print("Bank replied:", reply)
                            print(reply == "PONG" ? "Bank is online" : "Unexpected reply")
                        }
                    }
                }
            )

        case .failed(let error):
            print("Could not connect to bank:", error)
        default:
            break
        }
    }

    connection.start(queue: .main)
}

if checkBank(ip: bankIP, portNumber: port) {
    // Get a host and start the transaction
} catch {
    print("Failed to connect to the bank: \(toBank)")
    break
}