//
//  LeetCode202.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/30.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 快乐数
class LeetCode202{
    func isHappy(_ n: Int) -> Bool {
        
        var visited = Set<Int>()
        var num = n
        
        while true {
            var sum = 0
            var temp = num
            var array = [Int]()
            
            while temp > 0 {
                let num1 = temp % 10
                sum += num1 * num1
                array.append(num1)
                temp /= 10
            }
            
            if sum == 1 {
                return true
            } else {
                num = sum
                array.sort()
                
                var num2 = 0
                var by = 1
                for num in array {
                    num2 += num * by
                    by *= 10
                }
                if visited.contains(num2) {
                    return false
                } else {
                    visited.insert(num2)
                }
            }
        }
    }
}



