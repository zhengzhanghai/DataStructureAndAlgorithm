//
//  LeetCode80.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/11.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

///   删除排序数组中的重复项 II
class LeetCode80 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 2 else {
            return nums.count
        }
        
        var num = Int.max
        var count = 0
        let numCount = nums.count
        
        for i in 0 ..< numCount {
            let index = numCount - i - 1
            let curNum = nums[index]
            if num == curNum {
                count += 1
            } else {
                count = 1
                num = curNum
            }
            if count > 2 {
                nums.remove(at: index)
            }
        }
        
        return nums.count
    }
}
