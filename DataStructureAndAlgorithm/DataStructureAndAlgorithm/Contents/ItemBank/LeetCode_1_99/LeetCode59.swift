//
//  LeetCode59.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/29.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 59. 螺旋矩阵 II
class LeetCode59 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var result = [[Int]]()
        for _ in 0 ..< n {
            var array = [Int]()
            for _ in 0 ..< n {
                array.append(0)
            }
            result.append(array)
        }
        
        var val = 1
        let maxVal = n * n
        var row = 0
        var col = 0
        var minRow = 1
        var maxRow = n - 1
        var minCol = 0
        var maxCol = n - 1
        var isHor = true // 是否是水平方向移动
        var isForward = true // 是否是正向移动(水平向右、垂直向下为true)
        
        while val <= maxVal {
            result[row][col] = val
            if isHor { // 水平方向
                if isForward { // 水平向右
                    if col < maxCol {
                        col += 1
                    } else {
                        row += 1
                        maxCol -= 1
                        isHor = false
                        isForward = true
                    }
                } else { // 水平向左
                    if col > minCol {
                        col -= 1
                    } else {
                        row -= 1
                        minCol += 1
                        isHor = false
                        isForward = false
                    }
                }
            } else { // 垂直方向
                if isForward { // 垂直向下
                    if row < maxRow {
                        row += 1
                    } else {
                        col -= 1
                        maxRow -= 1
                        isHor = true
                        isForward = false
                    }
                } else { // 垂直向上
                    if row > minRow {
                        row -= 1
                    } else {
                        col += 1
                        minRow += 1
                        isHor = true
                        isForward = true
                    }
                }
            }
            
            
            val += 1
        }
        
        return result
    }
}
