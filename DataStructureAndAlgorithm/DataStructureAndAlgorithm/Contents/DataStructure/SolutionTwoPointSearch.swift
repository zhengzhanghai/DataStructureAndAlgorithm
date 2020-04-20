//
//  SolutionTwoPointSearch.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/20.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionTwoPointSearch {
    func test() {
//        print(guessNumber(10))
//        print(search1([4,5,6,7,0,1,2], 6))
        print(findPeakElement([1,2,3,4]))
    }
}

//MARK: 二分查找
extension SolutionTwoPointSearch {
    // 有序数组二分查找
    func search(_ nums: [Int], _ target: Int) -> Int {
        return search(nums, 0, nums.count - 1, target)
    }
    
    func search(_ nums: [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
        guard left <= right else {
            return -1
        }
        guard left != right else {
            return nums[left] == target ? left : -1
        }
        let half = (left + right) / 2
        guard nums[half] != target else {
            return half
        }
        if nums[half] > target {
            return search(nums, left, half - 1, target)
        } else {
            return search(nums, half + 1, right, target)
        }
    }
}

//MARK: 平方根
extension SolutionTwoPointSearch {
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x
        while left <= right {
            let middle = (left + right) / 2
            let middle2 = middle * middle
            if left * left == x {
                return left
            } else if right * right == x {
                return right
            } else if middle2 == x {
                return middle
            } else if right - 1 == left && left * left < x && right * right > x {
                return left
            } else if middle * middle > x {
                right = middle
            } else {
                left = middle
            }
        }
        return -1
    }
}

//MARK: 猜数字大小
extension SolutionTwoPointSearch {
    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left <= right {
            let middle = (left + right) / 2
            let result = guess(middle)
            if result == 0 {
                return middle
            } else if result > 0 {
                right = middle - 1
            } else {
                left = middle + 1
            }
        }
        
        return -1
    }
    
    func guess(_ num: Int) -> Int {
        if num == 6 {
            return 0
        } else if num > 6 {
            return 1
        }
        return -1
    }
}

//MARK: 按照旋转排序数组
extension SolutionTwoPointSearch {
    func search1(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let middle = (left + right) / 2
            if nums[middle] == target {
                return middle
            }
            else if nums[left] <= nums[middle] || nums[left] <= nums[right] { // 左边肯定是有序的
                if nums[middle] > target {
                    if nums[left] > target {
                        left = middle + 1
                    } else {
                        right = middle - 1
                    }
                } else {
                    left = middle + 1
                }
            }
            else { // 右边肯定是有序的
                if nums[middle] < target {
                    if nums[right] < target {
                        right = middle - 1
                    } else {
                        left = middle + 1
                    }
                } else {
                    right = middle - 1
                }
            }
        }
        
        return -1
    }
}

//找出第一个错误的版本
extension SolutionTwoPointSearch {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 0
        var right = n
        
        while left <= right {
            if left == right {
                return isBadVersion(left) ? left : -1
            }
            
            let middle = (left + right) / 2
            if isBadVersion(middle) {
                right = middle
            } else {
                left = middle + 1
            }
            
        }
        
        return -1
    }
    
    func isBadVersion(_ version: Int) -> Bool{return true}
}

//MARK: 寻找峰值
extension SolutionTwoPointSearch {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.isEmpty ? -1 : 0
        }
        return findPead(nums, 0, nums.count - 1)
    }
    
    func findPead(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        guard left <= right else {return -1}
        let numCount = nums.count
        if left == right {
            if left - 1 >= 0 && nums[left] < nums[left - 1] {
                return -1
            }
            if left + 1 < numCount && nums[left] < nums[left + 1] {
                return -1
            }
            return left
        }
        let middle = (left + right) / 2
        
        var isFinded = true
        if middle - 1 >= 0 && nums[middle] < nums[middle - 1] {
            isFinded = false
        }
        if middle + 1 < numCount && nums[middle] < nums[middle + 1] {
            isFinded = false
        }
        if isFinded { // 中是的
            return middle
        } else { // 中不是
            let leftResult = findPead(nums, left, middle - 1)
            if leftResult >= 0 {
                return leftResult
            } else {
                return findPead(nums, middle + 1, right)
            }
        }
    }
}

//MARK: 寻找螺旋有序数组的最小值
extension SolutionTwoPointSearch {
    func findMin(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {return -1}
        
        var minNum = Int.max
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            if nums[left] <= nums[right] { // 已经是有序的
                minNum = min(minNum, nums[left])
                return minNum
            } else {
                let middle = (left + right) / 2
                minNum = min(minNum, nums[middle])
                if nums[left] <= nums[middle] { // 左有序
                    minNum = min(minNum, nums[left])
                    left = middle + 1
                } else {// 右有序
                    minNum = min(minNum, nums[middle])
                    right = middle - 1
                }
            }
        }
        
        return minNum
    }
}
