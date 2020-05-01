//
//  LeetCode13.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit
/// 13. 罗马数字转整数
class LeetCode13 {
    func romanToInt(_ s: String) -> Int {
        let hash: [Character : Int] = [
            "I":1,
            "V":5,
            "X":10,
            "L":50,
            "C":100,
            "D":500,
            "M":1000,
        ]
        
        var result = 0
        let sArr = Array<Character>(s)
        let sArrCount = sArr.count
                
        var index = 0
        while index < sArrCount {
            if index + 1 < sArrCount && hash[sArr[index]]! < hash[sArr[index + 1]]! {
                result += hash[sArr[index + 1]]!
                result -= hash[sArr[index]]!
                index += 2
            } else {
                result += hash[sArr[index]]!
                index += 1
            }
        }
        
        return result
    }
}
