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
//        print(findPeakElement([1,2,3,4]))
//
//        print(searchRange([5,7,7,8,8,10], 8))
        
//        print(findClosestElements([1,1,1,10,10,10], 1, 9))
        
//        print(myPow(2, -10))
        print(findMin([10, 1, 10, 10, 10]))
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

//MARK: 在排序数组中查找元素的第一个和最后一个位置
extension SolutionTwoPointSearch {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return search(nums, 0, nums.count - 1, target)
    }
    
    func search(_ nums: [Int], _ left: Int, _ right: Int, _ target: Int) -> [Int] {
        
        if left > right {
            return [-1, -1]
        }
        
        var result = [-1, -1]
        
        let middle = (left + right) / 2
        
        if nums[middle] > target {
            return search(nums, left, middle - 1, target)
        } else if nums[middle] < target {
            return search(nums, middle + 1, right, target)
        } else {
            result = [middle, middle]
            let leftResult: [Int] = search(nums, left, middle - 1, target)
            if leftResult[0] != -1 {
                result[0] = min(result[0], leftResult[0])
            }
            let rightResult: [Int] = search(nums, middle + 1, right, target)
            if rightResult[1] != -1 {
                result[1] = max(result[1], rightResult[1])
            }
        }
        
        return result
    }
}
//        [1, 1, 1, 10, 10, 10]
//               1
//               9

//MARK: 找到K个最接近的元素
extension SolutionTwoPointSearch {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        
        guard !arr.isEmpty else {return []}
        
        var minIndex = Int.max
        var minVal = Int.max
        
        var left = 0
        var right = arr.count - 1
        
        while left <= right {
            if right - left <= 1 {
                if abs(arr[left] - x) <= abs(arr[right] - x) {
                    minIndex = left
                } else {
                    minIndex = right
                }
                break
            } else {
                let middle = (left + right) / 2
                if arr[middle] == x {
                    minIndex = middle
                    minVal = 0
                    break
                } else {
                    let val = abs(arr[middle] - x)
                    if val < minVal {
                        minVal = val
                        minIndex = left
                    }
                    if arr[middle] > x {
                        right = middle
                    } else {
                        left = middle
                    }
                }
            }
        }
        
        var result = [arr[minIndex]]
        
        left = minIndex
        right = minIndex
        
        while result.count < k {
            var leftVal = Int.max
            if left - 1 >= 0 {
                leftVal = abs(arr[left - 1] - x)
            }
            var rightVal = Int.max
            if right + 1 < arr.count {
                rightVal = abs(arr[right + 1] - x)
            }
            
            if leftVal <= rightVal { // 取左
                left -= 1
                result.insert(arr[left], at: 0)
            } else { // 取右
                right += 1
                result.append(arr[right])
            }
        }
        
        return result
    }
}

//Pow(x, n) 实现幂运算, 下面有种方法，一种递归，一种不是递归
extension SolutionTwoPointSearch {
//    func myPow(_ x: Double, _ n: Int) -> Double {
//        guard n != 0 else {
//            return 1
//        }
//        var result: Double = 1
//        var x = x
//        var i = n
//        while i != 0 {
//            if i % 2 != 0 {
//                result *= x
//            }
//            x *= x
//
//            i /= 2
//        }
//
//        return n > 0 ? result : 1 / result
//    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        return powNum(x, n)
    }
    
    func powNum(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else {
            return 1
        }
        guard abs(n) > 1 else {
            return n > 0 ? x : 1 / x
        }
        if n % 2 == 0 {
            return powNum(x * x, n / 2)
        } else {
            return (n > 0 ? x : 1 / x) * powNum(x * x, n / 2)
        }
    }
}

//MARK: 有效的完全平方数
extension SolutionTwoPointSearch {
    func isPerfectSquare(_ num: Int) -> Bool {
        guard num >= 0 else {
            return false
        }
        
        var left = 0
        var right = num
        
        while left <= right {
            let middle = (left + right) / 2
            let middlePow = middle * middle
            if middlePow == num {
                return true
            } else if middlePow < num {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        return false
    }
}

//MARK: 寻找比目标字母大的最小字母
extension SolutionTwoPointSearch {
//    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
//
//    }
}

// 寻找重复的数
extension SolutionTwoPointSearch {
    func findDuplicate(_ nums: [Int]) -> Int {
        var fast = 0
        var slow = 0
        let numCount = nums.count
        
        while true {
            if fast == numCount - 2 {
                fast = numCount - 1
            } else {
                fast = (fast + 2) % numCount
            }
            
            if fast != slow && nums[fast] == nums[slow] {
                return nums[fast]
            }
            
            slow = (slow + 1) % numCount
            
            if fast != slow && nums[fast] == nums[slow] {
                return nums[fast]
            }
        }
    }
}

extension SolutionTwoPointSearch {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        var distances = [Int]()
        for i in 0 ..< nums.count {
            for j in i+1 ..< nums.count {
                let val = abs(nums[j] - nums[i])
//                if !distances.contains(val) {
//                    distances.append(val)
//                }
                distances.append(val)

            }
        }
        
        guard distances.count >= k else {
            return -1
        }
        
        distances.sort()
        return distances[k - 1]
    }
}
