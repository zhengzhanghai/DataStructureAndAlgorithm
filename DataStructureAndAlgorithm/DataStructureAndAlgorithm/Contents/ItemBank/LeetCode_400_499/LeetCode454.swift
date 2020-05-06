//
//  LeetCode454.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/6.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 四数之和2
class LeetCode454 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var hashAB = [Int: Int]()
        for a in A {
            for b in B {
                let sum = a + b
                if let count = hashAB[sum] {
                    hashAB[sum] = count + 1
                } else {
                    hashAB[sum] = 1
                }
            }
        }
        
        var count = 0
        
        for c in C {
            for d in D {
                let sum = 0 - c - d
                count += hashAB[sum] ?? 0
            }
        }
        
        return count
    }
}
