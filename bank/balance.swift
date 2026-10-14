import Foundation

do {
    let balanceURL = URL(fileURLWithPath: "balance.json")
    let coinInfoURL = URL(fileURLWithPath: "coin_info.json")

    let balanceData = try Data(contentsOf: balanceURL)
    let balanceObject = try JSONSerialization.jsonObject(with: balanceData)

    guard let balanceJSON = balanceObject as? [String: Any],
          let balance = balanceJSON["balance"] as? Int else {
        throw NSError(
            domain: "JSON",
            code: 1,
            userInfo: [NSLocalizedDescriptionKey: "Missing or invalid balance"]
        )
    }

    let coinInfoData = try Data(contentsOf: coinInfoURL)
    let coinInfoObject = try JSONSerialization.jsonObject(with: coinInfoData)

    guard let coinInfoJSON = coinInfoObject as? [String: Any],
          let coinCode = coinInfoJSON["coin-code"] as? String else {
        throw NSError(
            domain: "JSON",
            code: 2,
            userInfo: [NSLocalizedDescriptionKey: "Missing or invalid coin-code"]
        )
    }

    print("Balance: \(balance) \(coinCode)")
} catch {
    print("Error: \(error.localizedDescription)")
}
