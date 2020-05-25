//
//  LeetCode31.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/20.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 下一个排列
class LeetCode31 {
    func test() {
        var array = [1, 1]
        nextPermutation(&array)
    }
    
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count >= 2 else {
            return
        }
        
        var i = nums.count - 2
        while i >= 0 && nums[i] >= nums[i + 1] {
            i -= 1
        }
        
        if i >= 0 {
            var j = nums.count - 1
            while j >= 0 && nums[j] <= nums[i] {
                j -= 1
            }
            (nums[i], nums[j]) =  (nums[j], nums[i])
        }
        
        var left = i + 1
        var right = nums.count - 1
        while left < right {
            (nums[left], nums[right]) =  (nums[right], nums[left])
            left += 1
            right -= 1
        }
    }
}
