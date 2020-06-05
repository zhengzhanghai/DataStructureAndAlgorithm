//
//  Interview29.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/6/5.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 顺时针打印矩阵
class Interview29 {
    func spiralOrder(_ matrix:[[Int]]) -> [Int] {
        let rows = matrix.count
        let cols = matrix.first?.count ?? 0
        let totalCount = rows * cols
        var res = [Int]()
        
        var minRow = 1
        var maxRow = rows - 1
        var minCol = 0
        var maxCol = cols - 1
        var row = 0
        var col = 0
        var index = 0
        // 是否运动方向向右
        var isRight = true
        var isLeft = false
        var isDown = false
        // 是否运动方向上
        var isUp = false
        
        
        func set(direction: Int) {
            isUp = direction == 1
            isLeft = direction == 2
            isDown = direction == 3
            isRight = direction == 4
        }
        
        while index < totalCount {
            res.append(matrix[row][col])
            
            if isRight {
                if col + 1 <= maxCol {
                    col += 1
                } else {
                    row += 1
                    maxCol -= 1
                    set(direction: 3)
                }
            } else if isDown {
                if row + 1 <= maxRow {
                    row += 1
                } else {
                    col -= 1
                    maxRow -= 1
                    set(direction: 2)
                }
            } else if isLeft {
                if col - 1 >= minCol {
                    col -= 1
                } else {
                    row -= 1
                    minCol += 1
                    set(direction: 1)
                }
            } else if isUp {
                if row - 1 >= minRow {
                    row -= 1
                } else {
                    col += 1
                    minRow += 1
                    set(direction: 4)
                }
            }
            
            index += 1
        }
        
        return res
    }

}
