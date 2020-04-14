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
//        let array = [
//         [ 1, 2, 3 ],
//         [ 4, 5, 6 ],
//         [ 7, 8, 9 ]
//        ]
//        print(findDiagonalOrder(array)
//        print(spiralOrder(array))
        
//        print(generate(5) as NSArray)
        
        var array: [Character] = ["1", "2", "3", "4", "5"]
        reverseString(&array)
        print(array)
    }
    
    //MARK: 二维数组对角线遍历算法
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
    
    //MARK: 顺时针螺旋遍历二维数组
    /// 顺时针螺旋遍历二维数组
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let rows = matrix.count
        let cols = matrix.first?.count ?? 0
        guard rows > 0 && cols > 0 else {
            return matrix.first ?? []
        }
        
        var row = 0
        var col = 0
        var isH = true // 是否是在水平方向移动
        var isForword = true // true 水平方向向右，垂直方向向下
        var result = [Int]()
        var visitors = Set<Int>() // 访问过的元素
        
        while true {
            
            result.append(matrix[row][col])
            visitors.insert(row * cols + col)
            
            if result.count == rows * cols {
                break
            }
            
            if isH && isForword { // 向右移动
                // 如果当前已到最右边，或者右边一个元素已经遍历了，向下移动
                if col == cols - 1 || visitors.contains(row * cols + col + 1) {
                    row += 1
                    isH = false
                    isForword = true
                } else {
                    col += 1
                }
            } else if !isH && isForword { // 向下移动
                // 如果当前已经到最下面，或者下面一个元素已经被遍历了，向左移动
                if row == rows - 1 || visitors.contains((row + 1) * cols + col) {
                    col -= 1
                    isH = true
                    isForword = false
                } else {
                    row += 1
                }
            } else if isH && !isForword { // 向左移动
                // 如果已经到最左边，或者左边一个元素访问过，向上移动
                if col == 0 || visitors.contains(row * cols + col - 1) {
                    row -= 1
                    isH = false
                    isForword = false
                } else {
                    col -= 1
                }
            } else { // 向上移动
                // 如果已到最上，或者最上一个元素已被访问，向右移动
                if row == 0 || visitors.contains((row - 1) * cols + col) {
                    col += 1
                    isH = true
                    isForword = true
                } else {
                    row -= 1
                }
            }
        }
        
        return result
    }

    //MARK: 杨辉三角
    /// 杨辉三角
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        guard numRows > 0 else {
            return result
        }
        
        for i in 0 ..< numRows {
            var previous = [Int]()
            if i > 0 {
                previous = result[i - 1]
            }
            
            var nums = [Int]()
            for j in 0 ..< i + 1 {
                var sum = 0
                if previous.isEmpty {
                    sum = 1
                } else {
                    if j < previous.count {
                        sum += previous[j]
                    }
                    if j - 1 >= 0 {
                        sum += previous[j - 1]
                    }
                }
                
                nums.append(sum)
            }
            result.append(nums)
        }
        
        return result
    }
    
    //MARK: 反转数组
    /// 反转数组
    func reverseString(_ s: inout [Character]) {
        for index in 0 ..< s.count {
            let left = index
            let right = s.count - index - 1
            
            guard left < right else {
                break
            }
            
            let temp = s[left]
            s[left] = s[right]
            s[right] = temp
        }
    }
}
