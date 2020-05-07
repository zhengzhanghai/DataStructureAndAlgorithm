//
//  LeetCode509.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/7.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 斐波那契数列
class LeetCode509 {
    
    var hash = [Int: Int]()
    
    func fib(_ N: Int) -> Int {
        guard N > 1 else { return N }
        if let num = hash[N] {
            return num
        }
        let num1 = fib(N - 1) + fib(N - 2)
        hash[N] = num1
        return num1
    }
}
