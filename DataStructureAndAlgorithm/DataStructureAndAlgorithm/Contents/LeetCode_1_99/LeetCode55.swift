//
//  LeetCode55.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/29.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 跳跃游戏
class LeetCode55 {
    func test() {
        print(canJump([3, 2, 1, 0, 4]))
    }
    
    func canJump(_ nums: [Int]) -> Bool {
        var maybeIndex = 0
        var maybeVal = 0
        for index in 0 ..< nums.count {
            if index == nums.count - 1 {
                return true
            } else if nums[index] == 0 {
                if maybeIndex + maybeVal <= index {
                    return false
                }
            } else if index + nums[index] > maybeIndex + maybeVal {
                maybeIndex = index
                maybeVal = nums[index]
            }
        }
        
        return true
    }
}
