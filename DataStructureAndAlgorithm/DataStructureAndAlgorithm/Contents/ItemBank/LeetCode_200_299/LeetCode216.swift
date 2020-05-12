//
//  LeetCode216.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/12.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 第K个最大元素
class LeetCode216 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k else {
            return 0
        }
        
        var set = Set<Int>()
        var n = 1
        var nMax = 0
        while n <= k {
            var max = Int.min
            var maxIndex = 0
            for index in 0 ..< nums.count {
                guard !set.contains(index) else {continue}
                if nums[index] > max {
                    max = nums[index]
                    maxIndex = index
                }
            }
            set.insert(maxIndex)
            nMax = max
            n += 1
        }
        
        return nMax
    }
}
