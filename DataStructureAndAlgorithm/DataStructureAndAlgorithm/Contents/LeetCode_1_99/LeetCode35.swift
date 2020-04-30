//
//  LeetCode35.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/28.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 35. 搜索插入位置
class LeetCode35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        return search(nums, 0, nums.count - 1, target)
    }
    
    func search(_ nums: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        guard left <= right else {
            var index = left
            if right >= 0 && right < nums.count {
                index = right
            }
            
            if nums[index] > target {
                return max(index - 1, 0)
            } else {
                return index + 1
            }
        }
        
        let middle = (left + right) / 2
        if nums[middle] == target {
            return middle
        } else if nums[middle] > target {
            return search(nums, left, middle - 1, target)
        } else {
            return search(nums, middle + 1, right, target)
        }
    }
}
