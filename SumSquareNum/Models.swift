//
//  Models.swift
//  SumSquareNum
//
//  Created by Sanhanat Ngamchaiwong on 16/12/2566 BE.
//

import Foundation

struct CalculateRequest {
    var number: Int
}

struct CalculateResponse {
    var source: String
    var result: [Int]
}

struct CalculateViewModel {
    var output: String
    var explanation: String
}
