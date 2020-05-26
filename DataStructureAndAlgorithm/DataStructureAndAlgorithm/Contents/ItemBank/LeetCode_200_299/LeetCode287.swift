//
//  LeetCode287.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/26.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 找到重复的数
class LeetCode287 {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0
        var fast = 0
        
        slow = nums[slow]
        fast = nums[nums[fast]]
        
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        slow = 0
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        
        return slow
    }
}
