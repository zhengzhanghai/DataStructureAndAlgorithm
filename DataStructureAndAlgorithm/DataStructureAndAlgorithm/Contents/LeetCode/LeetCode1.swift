//
//  LeetCode1.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/24.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hash = [Int: Int]()
        for (index, num) in nums.enumerated() {
            if let index1 = hash[target - num] {
                return [index1, index]
            } else {
                hash[num] = index
            }
        }
        return []
    }
}
