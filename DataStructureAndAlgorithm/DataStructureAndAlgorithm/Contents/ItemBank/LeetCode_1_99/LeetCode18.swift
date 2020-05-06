//
//  LeetCode18.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 18.四数之和
class LeetCode18 {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }
        let nums = nums.sorted()
        var result = [[Int]]()
        
        var i = 0
        while i < nums.count - 3 {
            let firstNum = nums[i]
            var j = i + 1
            while j < nums.count - 2 {
                let twoNum = nums[j]
                var left = j + 1
                var right = nums.count - 1
                
                while left < right {
                    let leftNum = nums[left]
                    let rightNum = nums[right]
                    let sum = firstNum + twoNum + leftNum + rightNum
                    
                    if sum == target {
                        result.append([firstNum, twoNum, leftNum, rightNum])
                        while left <= right {
                            if nums[left] != leftNum {
                                break
                            }
                            left += 1
                        }
                        while left <= right {
                            if nums[right] != rightNum {
                                break
                            }
                            right -= 1
                        }
                    } else if (sum < target) {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
                
                while j < nums.count - 2  {
                    if nums[j] != twoNum {
                        break
                    }
                    j += 1
                }
            }
            
            while i < nums.count - 3  {
                if nums[i] != firstNum {
                    break
                }
                i += 1
            }
            
        }
        return result
    }
}



//   1 2 3 4 5 6
