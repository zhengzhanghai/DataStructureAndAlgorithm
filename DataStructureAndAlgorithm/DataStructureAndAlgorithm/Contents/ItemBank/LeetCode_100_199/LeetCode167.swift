//
//  LeetCode167.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/18.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 两数之和
class LeetCode167 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count >= 2 else {return []}
        
        var leftIndex = 0
        var rightIndex = numbers.count - 1
        
        while leftIndex < rightIndex {
            if numbers[leftIndex] + numbers[rightIndex] == target {
                return [leftIndex + 1, rightIndex + 1]
            } else if numbers[leftIndex] + numbers[rightIndex] < target {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }
        }
        
        return []
    }
}
