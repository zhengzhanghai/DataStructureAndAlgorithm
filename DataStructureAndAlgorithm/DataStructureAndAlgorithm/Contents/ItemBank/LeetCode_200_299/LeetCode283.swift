//
//  LeetCode.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/11.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 移动0
class LeetCode283 {
    func test() {
        var array = [0, 0]
        moveZeroes(&array)
        print(array)
    }
    /// 遇到0 移除，再添加
//    func moveZeroes(_ nums: inout [Int]) {
//        var zeroCount = 0
//        let numCount = nums.count
//        for i in 0 ..< numCount {
//            let index = numCount - i - 1
//            if nums[index] == 0 {
//                nums.remove(at: index)
//                zeroCount += 1
//            }
//        }
//
//        for _ in numCount - zeroCount ..< numCount {
//            nums.append(0)
//        }
//    }
    /// 将第一个为0，和这个0之后第一个不为0的数交换
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        var i = 0
        var j = 0
        let count = nums.count
        
        while j < count {
            while i < count && nums[i] != 0 { // 找到最前面的0
                i += 1
            }
            j = max(j, i + 1)
            while j < count && nums[j] == 0 { // 找到i后第一个不为0的数
                j += 1
            }
            if i < j && j < count && i < count {
                let temp = nums[i]
                nums[i] = nums[j]
                nums[j] = temp
                i += 1
                j += 1
            }
        }
    }
}
