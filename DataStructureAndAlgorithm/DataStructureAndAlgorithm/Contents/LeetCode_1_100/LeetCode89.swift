//
//  LeetCode89.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/29.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 89. 格雷编码
class LeetCode89 {
    func test() {
        print(grayCode(3))
    }
    
    func grayCode(_ n: Int) -> [Int] {
        guard n > 0 else {
            return [0]
        }
        var result = [Int]()
        result.append(0)
        var values = [Int]()
        var nums = [Int]()
        var temp = 1
        for _ in 0 ..< n {
            nums.append(0)
            values.append(temp)
            temp *= 2
        }
        
        var changeIndex = -1
        let totalCount = Int(pow(Double(2), Double(n)))
        var value = 0
        
        var count = 0
        while count < totalCount - 1 {
            
            for index in 0 ..< n {
                guard index != changeIndex else {
                    continue
                }
                
                var isAdd = true
                if nums[index] == 1 {
                    isAdd = false
                }
                
                value += values[index] * (isAdd ? 1 : -1)
                if result.contains(value) {
                    continue
                } else {
                    print(value)
                    print(nums)
                    result.append(value)
                    nums[index] = isAdd ? 1 : 0
                    changeIndex = index
                    break
                }
            }
            
            count += 1
        }
        
        return result
    }
}

// 0
// 00 01 11 10
// 000 001 101 100 000

//0 0 0   0
//1 0 0   1
//1 1 0   3
//0 1 0   2
//0 1 1   6
//1 1 1   7
//1 0 1   5
//0 0 1   4
