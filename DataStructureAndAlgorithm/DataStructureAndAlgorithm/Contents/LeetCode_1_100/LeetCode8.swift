//
//  LeetCode8.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/26.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode8 {
    func test() {
        print(myAtoi("words and 987"))
    }
    
    func myAtoi(_ str: String) -> Int {
        let strArr = Array<Character>(str)
        var num = 1
        var isStart = false
        var array = [Character]()
        for char in strArr {
            if isStart && !isNumber(char) {
                break
            }
            if char == "-" || char == "+" {
                num = char == "-" ? -1 : 1
                isStart = true
            } else if isNumber(char) {
                isStart = true
                array.append(char)
            } else if char != " " {
                break
            }
        }
        let numStr = String(array)
        let result = Int64(numStr) ?? 0
        if result > Int64(Int32.max) {
            return Int((Int64(Int32.max) + Int64(num < 0 ? 1 : 0))) * num
        } else {
            return Int(result) * num
        }
    }
    
    func isNumber(_ char: Character) -> Bool {
        switch char {
        case "0": fallthrough
        case "1": fallthrough
        case "2": fallthrough
        case "3": fallthrough
        case "4": fallthrough
        case "5": fallthrough
        case "6": fallthrough
        case "7": fallthrough
        case "8": fallthrough
        case "9":
            return true
        default:
            return false
        }
    }
}
