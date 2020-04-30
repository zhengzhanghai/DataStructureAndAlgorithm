//
//  LeetCode11.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 11. 盛最多水的容器
class LeetCode11 {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else {return 0}
        
        var maxV = 0
        var left = 0
        var right = height.count - 1
        
        while left < right {
            maxV = max(maxV, (right - left) * min(height[left], height[right]))
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxV
    }
}
