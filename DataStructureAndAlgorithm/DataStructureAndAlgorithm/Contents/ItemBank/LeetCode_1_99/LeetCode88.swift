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
        merge1(&array, 3, [2,5,6], 3)
        print(array)
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
    
    func merge1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index1 = m - 1
        var index2 = n - 1
        var index = m + n - 1
        
        while index >= 0 {
            if index2 < 0 || index1 >= 0 && nums1[index1] >= nums2[index2] {
                nums1[index] = nums1[index1]
                index1 -= 1
            } else {
                nums1[index] = nums2[index2]
                index2 -= 1
            }
            
            index -= 1
        }
    }
}

// 1 2 3 0 0 0
// 0
