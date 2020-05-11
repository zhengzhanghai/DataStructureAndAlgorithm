//
//  LeetCode220.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/11.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 存在重复元素三
class LeetCode220 {
//    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
//        guard nums.count > 1 else {
//            return false
//        }
//        guard k > 0 else {
//            return false
//        }
//        var set = Set<Int>()
//        for index in 0 ..< nums.count {
//            let num = nums[index]
//            for num1 in set {
//                if abs(num1 - num) <= t {
//                    return true
//                }
//            }
//
//            set.insert(num)
//            if set.count > k {
//                set.remove(nums[index - k])
//            }
//        }
//        return false
//    }
    
//        private long getID(long x, long w) {
//            return x < 0 ? (x + 1) / w - 1 : x / w;
//        }

    func getID(_ x: Int, _ w: Int) -> Int {
        return x < 0 ? (x + 1) / w - 1 : x / w
    }
    
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard t >= 0 else {return false}
        var d = [Int: Int]()
        let w = t + 1
        
        for index in 0 ..< nums.count {
            let m = getID(nums[index], w)
            if d.keys.contains(m) {
                return true
            }
            if d.keys.contains(m - 1) && abs(nums[index] - d[m - 1]!) < w {
                return true
            }
            if d.keys.contains(m + 1) && abs(nums[index] - d[m + 1]!) < w {
                return true
            }
            d[m] = nums[index]
            if index >= k {
                d.removeValue(forKey: getID(nums[index - k], w))
            }
        }
        
        return false
    }
}
