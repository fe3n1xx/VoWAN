import Foundation
import Network

let lsbanks = "lsbanks.json"
let lspoolers = "lspoolers.json"
let lsresolvers = "lsresolvers.json"

// Resolve BANK -> IP
func getBank(bankID: String) {
    //
    if let data = try? Data(contentsOf: URL(fileURLWithPath: lsbanks)) {
        do {
            //
            if let data = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                //
                if let value = data["\(bankID)"] as? String {
                    return value
                } else {
                    return "ERROR RESOLVING"
                };
            };
        }; 
    }; catch {
        print("ERROR PARSING JSON: \(error.localizedDescription)")
    }
}

// Resolve IP -> BANK
func reverseBank(bankIP: String) {
    //
    let lsbanksData = try Data(contentsOf: URL(fileURLWithPath: lsbanks))
    let jsonString = String(decoding: data, as: UTF8.self)
    func getVariableName(from jsonString: String, valueToFind: Any) -> [String] {
        guard let jsonData = jsonString.data(using: .utf8) else {return []}
        do {
            //
            if let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                var keysFound: [String] = []
                for (key, value) in jsonDict {
                    if let innerDict = value as? [String: Any] {
                        for (innerKey, innerValue) in innerDict {
                            if innerValue as? AnyHashable == valueToFind {
                                keysFound.append("\(key).\(innerkey)")
                            };
                        };
                    };
                };
                return keysFound
            };
        }; catch {
            //
            print("ERROR PARSING JSON \(error)")
        }
    }
    return []

    let toReturn = getVariableName(from: jsonString, valueToFind: bankIP)
    return toReturn
}

// Resolve HOST -> IP
func getHost(hostID: String) {
    //
    if let data = try? Data(contentsOf: URL(fileURLWithPath: lspoolers)) {
        do {
            //
            if let data = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                if let value = data["\(hostID)"] as? String {
                    return value
                } else {
                    return "ERROR RESOLVING"
                }
            }
        }
    } catch {
        print("ERROR PARSING JSON: \(error.localizedDescription)")
    }
}

// Send LSRESOLVERS
func getResolver() {
    //
    if let data = try? Data(contentsOf: URL(fileURLWithPath: lsresolvers)) {
        do {
            //
            if let data = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                return data
            }
        }
    } catch {
        print("ERROR PARSING JSON: \(error.localizeDescription)")
    }
}

print(getBank(bankID: "b-y3kKtzR7Sn9z8CXBAX6d6FwdP5UM07")) // TEST BANK
print(getHost(hostID: "p-R1cLDL0RzyHrEbKlgFfe3GY5hnZ826")) // TEST HOST
print(getResolver())