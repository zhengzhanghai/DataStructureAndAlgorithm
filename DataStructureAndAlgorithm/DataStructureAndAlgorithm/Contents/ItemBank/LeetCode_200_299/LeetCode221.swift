//
//  LeetCode221.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/8.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 最大正方形
class LeetCode221 {
    func test() {
        let array: [[Character]] = [["1", "0", "1", "0", "0"],
                                    ["1", "0", "1", "1", "1"],
                                    ["1", "1", "1", "1", "1"],
                                    ["1", "0", "0", "1", "0"]]
        print(maximalSquare(array))
    }
    
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let rows = matrix.count
        let cols = matrix.first?.count ?? 0
        
        var maxLength = 0
        let dpSubArr = [Int](repeating: 0, count: cols)
        var dp = [[Int]](repeating: dpSubArr, count: rows)
        
        for i in 0 ..< rows {
            for j in 0 ..< cols {
                guard matrix[i][j] == "1" else {
                    dp[i][j] = 0
                    continue
                }
                guard i != 0 && j != 0 else {
                    dp[i][j] = 1
                    maxLength = max(1, maxLength)
                    continue
                }
                let length = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                dp[i][j] = length
                maxLength = max(maxLength, length)
            }
        }
        return maxLength * maxLength
    }
}
