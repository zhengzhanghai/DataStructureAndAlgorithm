//
//  LeetCode219.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/11.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 是否存在重复的元素
class LeetCode219 {
    /// 方法一：hash存储值与下标
//    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
//        var hash = [Int: Int]()
//        for index in 0 ..< nums.count {
//            let num = nums[index]
//            if let index1 = hash[num], index - index1 <= k {
//                return true
//            } else {
//                hash[num] = index
//            }
//        }
//        return false
//    }
    
    /// 方法二，只存储k范围内的元素
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()
        for index in 0 ..< nums.count {
            let num = nums[index]
            if set.contains(num) {
                return true
            }
            
            set.insert(num)
            
            if set.count > k {
                set.remove(nums[index - k])
            }
        }
        return false
    }
}
