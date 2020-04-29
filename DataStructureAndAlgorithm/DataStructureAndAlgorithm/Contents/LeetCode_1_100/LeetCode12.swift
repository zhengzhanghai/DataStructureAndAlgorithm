//
//  LeetCode12.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 12. 整数转罗马数字
class LeetCode12 {
    func intToRoman(_ num: Int) -> String {
        var result = ""
        let MCount = num / 1000
        for _ in 0 ..< MCount {
            result += "M"
        }
        
        var num = num % 1000
        result += intToRoman(num / 100, "M", "D", "C")
        
        num %= 100
        result += intToRoman(num / 10, "C", "L", "X")
        
        num %= 10
        result += intToRoman(num, "X", "V", "I")
        
        return result
    }
    
    func intToRoman(_ count: Int, _ maxR: String, _ middleR: String, _ minR: String) -> String {
        var count = count
        var result = ""
        if count == 9 {
            result += minR + maxR
        } else if count == 4 {
            result += minR + middleR
        } else {
            if count >= 5 {
                result += middleR
            }
            count %= 5
            for _ in 0 ..< count {
                result += minR
            }
        }
        return result
    }
}
