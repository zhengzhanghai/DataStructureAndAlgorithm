//
//  LeetCode75.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/12.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 75颜色分类
class LeetCode75 {
    func sortColors(_ nums: inout [Int]) {
        var curr = 0
        var p0 = 0
        var p2 = nums.count - 1
        
        while curr <= p2 {
            if nums[curr] == 0 {
                (nums[p0], nums[curr]) = (nums[curr], nums[p0])
                p0 += 1
                curr += 1
            } else if nums[curr] == 2 {
                (nums[p2], nums[curr]) = (nums[curr], nums[p2])
                p2 -= 1
            } else {
                curr += 1
            }
        }
    }
}
