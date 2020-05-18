//
//  LeetCode152.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/18.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 乘积最大的子数组
class LeetCode152 {
    func test() {
        print(maxProduct([2, 3, -2]))
    }
    
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var res = nums[0]
        var minF = nums[0]
        var maxF = nums[0]
        
        for index in 1 ..< nums.count {
            let num = nums[index]
            let tempMin = minF
            let tempMax = maxF
            
            maxF = max(tempMin * num, tempMax * num, num)
            minF = min(tempMin * num, tempMax * num, num)
            
            res = max(res, maxF)
        }
        
        return res
    }
}
