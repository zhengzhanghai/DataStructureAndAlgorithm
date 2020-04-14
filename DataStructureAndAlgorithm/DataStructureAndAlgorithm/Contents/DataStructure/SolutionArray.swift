//
//  SolutionArray.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/14.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionArray {
    
    func test() {
        let result = findDiagonalOrder(
            [
             [ 1, 2, 3 ],
             [ 4, 5, 6 ],
             [ 7, 8, 9 ]
            ]
        )
        print(result)
    }
    
    /// 二维数组对角线遍历算法
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        let rows = matrix.count
        let cols = matrix.first?.count ?? 0
        guard rows > 0 && cols > 0 else {
            return matrix.first ?? []
        }
        
        var result = [Int]()
        var symbol = true
        var row = 0
        var col = 0
        
        while true {
            result.append(matrix[row][col])
            if row == rows - 1 && col == cols - 1 {
                break
            }
            
            var temp = symbol
            if (symbol && (row == 0 || col == cols - 1)) || (!symbol && (col == 0 || row == rows - 1)) {
                temp = !symbol
            }
            
            if (symbol && row == 0 && col != cols - 1) || !symbol && (row == rows - 1) {
                col += 1
            } else if (symbol && col == cols - 1) || (!symbol && col == 0) {
                row += 1
            } else {
                row += symbol ? -1 : 1
                col += symbol ? 1 : -1
            }
            
            symbol = temp
        }
        
        return result
    }
}

//print(String(row) + " " + String(col) + " " + String(symbol))
//[ 1, 2, 3 ],
//[ 4, 5, 6 ],
//[ 7, 8, 9 ]

//横移
//sym = true   row = 0
//sym = false  row = rows - 1
//
//竖移
//sym = false  col = 0
//sym = true   col = cols - 1

//转向
//sym = true   row = 0 || col = cols - 1
//sym = false  col = 0 || row = rows - 1

 
