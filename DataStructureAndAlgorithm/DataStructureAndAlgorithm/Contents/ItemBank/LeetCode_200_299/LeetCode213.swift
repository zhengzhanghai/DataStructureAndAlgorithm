//
//  LeetCode213.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/29.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode213 {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.first ?? 0
        }
        return max(rob(nums, 0, nums.count - 2),
                   rob(nums, 1, nums.count - 1))
    }
    
    func rob(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        var first = 0
        var second = 0
        
        for i in start ... end {
            if first < second + nums[i] {
                let temp = first
                first = second + nums[i]
                second = temp
            } else {
                second = first
            }
        }
        
        return first
    }
}
