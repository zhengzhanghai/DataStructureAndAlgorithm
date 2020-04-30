//
//  LeetCode15.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 15.三数之和
class LeetCode15 {
    func test() {
        print(threeSum([0, 0, 0, 0]))
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        
        var result = [[Int]]()
        let nums = nums.sorted()
        
        guard nums.first! <= 0 && nums.last! >= 0 else {
            return []
        }
        
        var index = 0
        
        while index <= nums.count - 3 {
            let num = nums[index]
            guard num <= 0 else {
                break
            }
            var left = index + 1
            var right = nums.count - 1
            
            while left < right {
                let leftNum = nums[left]
                let rightNum = nums[right]
                
                let sum = leftNum + num + rightNum
                if sum == 0 {
                    result.append([num, leftNum, rightNum])
                    left += 1
                    right -= 1
                    while left < right {
                        if nums[left] == leftNum {
                            left += 1
                        } else {
                            break
                        }
                    }
                    while left < right {
                        if nums[right] == rightNum {
                            right -= 1
                        } else {
                            break
                        }
                    }
                } else if sum > 0 {
                    right -= 1
                } else {
                    left += 1
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
