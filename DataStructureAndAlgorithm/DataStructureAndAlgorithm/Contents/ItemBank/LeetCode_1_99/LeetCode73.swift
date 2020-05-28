//
//  LeetCode73.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/28.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 矩阵置0
class LeetCode73 {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let cols = matrix.first?.count ?? 0
        var rowSet = Set<Int>()
        var colSet = Set<Int>()
        
        for i in 0 ..< rows {
            for j in 0 ..< cols {
                if matrix[i][j] == 0 {
                    rowSet.insert(i)
                    colSet.insert(j)
                }
            }
        }
        
        for row in rowSet {
            for col in 0 ..< cols {
                matrix[row][col] = 0
            }
        }
        
        for col in colSet {
            for row in 0 ..< rows {
                matrix[row][col] = 0
            }
        }
    }
}
