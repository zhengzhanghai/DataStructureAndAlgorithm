//
//  LeetCode88.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/29.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 合并两个有序数组
class LeetCode88 {
    func test() {
        var array = [1,2,3,0,0,0]
        merge(&array, 3, [2,5,6], 3)
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var startIndex = 0
        for i in 0 ..< nums2.count {
            let num2 = nums2[i]
            var isInsert = false
            for index in startIndex ..< m + i {
                let num1 = nums1[index]
                if num2 < num1 {
                    for j in 0 ..< m + i - index {
                        let index = m + i - j
                        nums1[index] = nums1[index - 1]
                    }
                    
                    nums1[index] = num2
                    startIndex = index + 1
                    isInsert = true
                    break
                }
            }
            if !isInsert {
                nums1[m + i] = num2
                startIndex = m + i + 1
            }
        }
    }
}

// 1 2 3 0 0 0
// 0
