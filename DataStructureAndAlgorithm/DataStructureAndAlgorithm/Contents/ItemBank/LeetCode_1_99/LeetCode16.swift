//
//  LeetCode16.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 16.最接近的三数之和
class LeetCode16 {
    func test() {
        print(threeSumClosest([0, 2, 1, -3], 1))
    }
    
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        
        let nums = nums.sorted()
        var result = 0
        var minDifference = Int.max
        
        var index = 0
        while index <= nums.count - 3 {
            let num = nums[index]
            var left = index + 1
            var right = nums.count - 1
            while left < right {
                let leftNum = nums[left]
                let rightNum = nums[right]
                let sum = num + leftNum + rightNum
                if sum == target {
                    return sum
                } else {
                    if abs(sum - target) < minDifference {
                        minDifference = abs(sum - target)
                        result = sum
                    }
                    if sum > target {
                        right -= 1
                        while left < right {
                            if nums[right] == rightNum {
                                right -= 1
                            } else {
                                break
                            }
                        }
                    } else {
                        left += 1
                        while left < right {
                            if nums[left] == leftNum {
                                left += 1
                            } else {
                                break
                            }
                        }
                    }
                }
            }
            
            index += 1
            while index < nums.count {
                if nums[index] == num {
                    index += 1
                } else {
                    break
                }
            }
        }
        
        return result
    }
}
