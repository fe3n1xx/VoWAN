import Foundation
import Network

let lsbanks = "lsbanks.json"
let lspoolers = "lspoolers.json"
let lsresolvers = "lsresolvers.json"

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
                }
            }
        } 
    } catch {
        print("ERROR PARSING JSON: \(error.localizedDescription)")
    }
}
func reverseBank(bankIP: String) {
    //
    do {
        if let data = try JSONSerialization.sonObject(with: jsonData, options: []) as? [String: Any] {
            //
        }
    }
}

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
