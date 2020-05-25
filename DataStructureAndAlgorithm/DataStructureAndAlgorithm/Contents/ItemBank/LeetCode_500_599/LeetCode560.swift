//
//  LeetCode560.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/15.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 和为K的子数组
class LeetCode560 {
    
    func test() {
        print(subarraySum([1, 2, 3, -1, 2], 3))
    }
    
    /// 枚举法
//    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
//        var res = 0
//        for i in 0 ..< nums.count {
//            var sum = 0
//            for j in i ..< nums.count {
//                sum += nums[j]
//                if sum == k {
//                    res += 1
//                }
//            }
//        }
//
//        return res
//    }
    
    ///
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var map = [0: 1]
        var count = 0
        var sum = 0
        for i in 0 ..< nums.count {
            sum += nums[i]
            count += map[sum - k] ?? 0
            map[sum] = (map[sum] ?? 0) + 1
            
            print(map)
        }
        
        return count
    }
}
