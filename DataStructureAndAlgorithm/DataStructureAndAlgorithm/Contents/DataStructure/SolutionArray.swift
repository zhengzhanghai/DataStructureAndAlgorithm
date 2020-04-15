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
        
//        var array: [Character] = ["1", "2", "3", "4", "5"]
//        reverseString(&array)
//        print(array)
        
//        print(arrayPairSum([7,3,1,0,0,6]))
//        print(twoSum([2, 7, 11, 15], 9))
        
        print(findMaxConsecutiveOnes([1,1,0,1,1,1]))
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
    
    //MARK: 数组拆分
    /// 数组拆分，这个题主要在于排序，可以直接用系统的方法直接排序
    /// 下面采用了一种排序，效率较高(选取一个key，把这个key放到排序正确的位置，并使它左边的元素都比它小，右边的元素都比它大，然后递归子串排序)
    func arrayPairSum(_ nums: [Int]) -> Int {
        var newNums = nums
        let numCount = newNums.count
        sort(&newNums, left: 0, right: numCount - 1)
        
        var sum = 0
        for i in 0 ..< numCount {
            if i % 2 == 0 {
                sum += newNums[i]
            }
        }
        
        return sum
    }
    
    func sort(_ arr: inout [Int], left: Int, right: Int) {
        if left >= right {
            return
        }
        
        var i = left
        var j = right
        let key = arr[left]
        
        while i < j {
            while i < j && arr[j] >= key {
                j -= 1
            }
            arr[i] = arr[j]
            
            while i < j && arr[i] <= key {
                i += 1
            }
            arr[j] = arr[i]
        }
        
        arr[i] = key
        
        sort(&arr, left: left, right: i - 1)
        sort(&arr, left: i + 1, right: right)
    }
    
}

extension SolutionArray {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count >= 2 else {
            return []
        }
        
        for i in 0 ... numbers.count {
            for j in i+1 ..< numbers.count {
                if numbers[i] + numbers[j] == target {
                    return [i+1, j+1]
                }
            }
        }
        
        return []
    }
}

extension SolutionArray {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        let count = nums.count
        
        for index in 0 ..< count {
            if nums[count - index - 1] == val {
                nums.remove(at: count - index - 1)
            }
        }
        
        return nums.count
    }
}

extension SolutionArray {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxCount = 0
        
        var count = 0
        
        for num in nums {
            if num == 1 {
                count += 1
            } else {
                maxCount = max(maxCount, count)
                count = 0
            }
        }
        
        maxCount = max(maxCount, count)
        
        return maxCount
    }
}

//MARK: 长度最小的子数组
extension SolutionArray {
    /// 长度最小的子数组，使用滑动窗口解，时间复杂度O(n)
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var sum = 0
        let numCount = nums.count
        var minLength = numCount + 1
        
        while left < numCount {
            if right < numCount && sum < s {
                sum += nums[right]
                right += 1
            } else {
                sum -= nums[left]
                left += 1
            }
            
            if sum >= s {
                minLength = min(minLength, right - left)
            }
        }
        
        if minLength == numCount + 1 {
            return 0
        }
        
        return minLength
    }
    
    
}
