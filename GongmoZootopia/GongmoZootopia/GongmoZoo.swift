//
//  GongmoZoo.swift
//  GongmoZootopia
//
//  Created by Junsu Jang on 2022/04/14.
//

import Foundation

struct GongmoZoo: Decodable {
    let ipoIndex: Int?
    let stockName: String?
    let stockExchange: String?
    let stockKinds: String?
    let ipoStartDate: String?
    let ipoEndDate: String?
    let ipoRefundDate: String?
    let ipoDebutDate: String?
    let underwriter: String?
    let tag: String?
    let recentComment: String?
}

struct StockDetail: Codable {
    let ipoIndex: Int
    let stockName: String
    let stockExchange: String
    let sector: String
    let profits: Int
    let sales: Int
    let ipoForecastDate: String
    let ipoStartDate: String
    let ipoEndDate: String
    let ipoRefundDate: String
    let ipoDebutDate: String
    let ipoPrice: Int
    let ipoPriceLow: Int
    let ipoPriceHigh: Int
}
