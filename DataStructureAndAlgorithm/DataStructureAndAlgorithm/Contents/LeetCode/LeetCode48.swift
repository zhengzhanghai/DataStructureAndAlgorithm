//
//  LeetCode48.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/28.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 48. 旋转图像
class LeetCode48 {
    
    func test() {
        var dd = [
          [1,2,3],
          [4,5,6],
          [7,8,9]
        ]
        rotate(&dd)
        print(dd)
    }
    
    func rotate(_ matrix: inout [[Int]]) {
        guard matrix.count > 1 else {
            return
        }
        
        let rows = matrix.count
        
        for i in 0 ..< rows - 1 {
            if i >= rows - i - 1 {
                break
            }
            for j in i ..< rows - i - 1 {
                var count = 0
                var row = i
                var col = j
                let first = matrix[row][col]
                var temp = matrix[rows - col - 1][row]
                
                while count < 4 {
                    if count == 3 {
                        matrix[row][col] = first
                    } else {
                        matrix[row][col] = temp
                    }
                    let tempRow = row
                    row = rows - col - 1
                    col = tempRow
                    temp = matrix[rows - col - 1][row]
                    count += 1
                }
            }
        }
        
    }
}
