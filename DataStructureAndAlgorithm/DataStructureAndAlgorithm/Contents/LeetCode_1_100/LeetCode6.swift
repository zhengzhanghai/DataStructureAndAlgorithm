//
//  LeetCode6.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/26.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 6. Z 字形变换
class LeetCode6 {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }
        
        var array = [[Character]]()
        for _ in 0 ..< numRows {
            array.append([])
        }
        
        let sArr = Array<Character>(s)
        
        var isDown = true
        var currentRow = 0
        
        for char in sArr {
            array[currentRow].append(char)
            if currentRow == numRows - 1 {
                currentRow -= 1
                isDown = false
            } else if currentRow == 0 {
                currentRow += 1
                isDown = true
            } else {
                currentRow += isDown ? 1 : -1
            }
        }
        
        var result = ""
        for chars in array {
            result += String(chars)
        }
        return result
    }
}
