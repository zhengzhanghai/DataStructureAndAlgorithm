//
//  LeetCode198.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/29.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 打家劫舍
class LeetCode198 {
//    func rob(_ nums: [Int]) -> Int {
//        var map = [Int: Int]()
//        for i in 0 ..< nums.count {
//            map[i] = max(map[i - 1] ?? 0, (map[i - 2] ?? 0) + nums[i])
//        }
//        return map[nums.count - 1] ?? 0
//    }
    
    func rob(_ nums: [Int]) -> Int {
        var first = 0
        var second = 0
        for i in 0 ..< nums.count {
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
