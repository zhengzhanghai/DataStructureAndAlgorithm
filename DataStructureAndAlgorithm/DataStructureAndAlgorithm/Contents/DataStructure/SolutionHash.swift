//
//  SolutionHash.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/17.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionHash {
    func test() {
        
    }
}

//MARK: hash查重
extension SolutionHash {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return true
            }
            set.insert(num)
        }
        return false
    }
}

//MARK: 只出现过一次的数字
extension SolutionHash {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result = result ^ num
        }
        return result
    }
}

//MARK: 两个数组的交集
extension SolutionHash {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let set = Set<Int>(nums1)
        var array = [Int]()
        for num in nums2 {
            if set.contains(num) && !array.contains(num) {
                array.append(num)
            }
        }
        return array
    }
}

//MARK: 快乐数
extension SolutionHash {
    func isHappy(_ n: Int) -> Bool {
        var hash = Set<[Int]>()
        
        var nums = separateNum(n)
        
        while true {
            if hash.contains(nums) {
                return false
            } else {
                hash.insert(nums)
            }
            
            var sum = 0
            for num in nums {
                sum += num * num
            }
            
            if sum == 1 {
                return true
            }
            
            nums = separateNum(sum)
        }
    }
    
    func separateNum(_ num: Int) -> [Int] {
        var nums = [Int]()
        var num = num
        while num != 0 {
            nums.append(num % 10)
            num /= 10
        }
        if nums.count == 0 {
            nums.append(0)
        }
        return nums.sorted()
    }
}


//MARK: 两数之和
extension SolutionHash {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hash = [Int: Int]()
        for index in 0 ..< nums.count {
            hash[nums[index]] = index
        }
        for index in 0 ..< nums.count {
            if let index1 = hash[target - nums[index]], index != index1 {
                return [index1, index].sorted()
            }
        }
        return []
    }
}

//MARK: 同构字符串
extension SolutionHash {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        print(Date())
        guard s.count == t.count else {
            return false
        }
        
        var hash1 = [Character: Int]()
        var hash2 = [Character: Int]()
        
        for index in 0 ..< s.count {
            let strIndex1 = s.index(s.startIndex, offsetBy: index)
            let strIndex2 = t.index(t.startIndex, offsetBy: index)
            let char1 = s[strIndex1]
            let char2 = t[strIndex2]

            let index1 = hash1[char1]
            let index2 = hash2[char2]
            
            if index1 == index2 {
                hash1[char1] = index
                hash2[char2] = index
            } else {
                return false
            }
        }
        print(Date())

        return true
    }
}

//MARK:两个列表的最小索引总和
extension SolutionHash {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var minLength = Int.max
        var hash = [String: Int]()
        for i in 0 ..< list1.count {
            for j in 0 ..< list2.count {
                if list1[i] == list2[j] {
                    minLength = min(minLength, i + j)
                    hash[list1[i]] = i + j
                }
            }
        }
        
        var result = [String]()
        for (key, vlaue) in hash {
            if vlaue == minLength {
                result.append(key)
            }
        }
        
        return result
    }
}

//MARK: 字符串中的第一个唯一字符
extension SolutionHash {
    func firstUniqChar(_ s: String) -> Int {
        var removeSet = Set<Character>()
        var set = Set<Character>()
        var hash = [Character: Int]()
        for index in 0 ..< s.count {
            let strIndex = s.index(s.startIndex, offsetBy: index)
            let char = s[strIndex]
            if !removeSet.contains(char) {
                if set.contains(char) {
                    removeSet.insert(char)
                    set.remove(char)
                    hash.removeValue(forKey: char)
                } else {
                    set.insert(char)
                    hash[char] = index
                }
            }
        }
        
        guard !hash.isEmpty else {
            return -1
        }
        
        var minIndex = Int.max
        minIndex = hash.reduce(minIndex) { (minIndex, arg1) -> Int in
            return min(minIndex, arg1.value)
        }
        
        return minIndex
    }
}

//MARK: 两个数组的交集2
extension SolutionHash {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = [Int]()
        var usedSet = Set<Int>()
        for i in 0 ..< nums1.count {
            for j in 0 ..< nums2.count {
                if !usedSet.contains(j) && nums1[i] == nums2[j] {
                    result.append(nums1[i])
                    usedSet.insert(j)
                    break
                }
            }
        }
        return result
    }
}

//MARK: 存在重复的元素2
extension SolutionHash {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var hash = [Int: Int]()
        for index in 0 ..< nums.count {
            let num = nums[index]
            if let index1 = hash[num], index - index1 <= k {
                return true
            } else {
                hash[num] = index
            }
        }
        return false
    }
}
