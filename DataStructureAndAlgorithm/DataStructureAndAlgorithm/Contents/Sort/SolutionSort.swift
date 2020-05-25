//
//  SolutionSort.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/12.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 排序
class SolutionSort {
    var len: Int = 0
    
    func test() {
        var array = [5,25,7,1,93,2,4,6,8,7,20]
//        bubbleSort(&array)
//        selectSort(&array)
//        insertSort(&array)
//        shellSort(&array)
//        quickSort(&array)
//        heapSort(&array)
//        countSort(&array)
//        bucketSort(&array)
        radixSort(&array)
        print(array)
    }
}

/// 冒泡排序
extension SolutionSort {
    func bubbleSort(_ nums: inout [Int]) {
        for i in 0 ..< nums.count {
            for j in 0 ..< nums.count - i - 1 {
                if nums[j] > nums[j + 1] {
                    (nums[j], nums[j + 1]) = (nums[j + 1], nums[j])
                }
            }
        }
    }
}

/// 选中排序
extension SolutionSort {
    func selectSort(_ nums: inout [Int]) {
        for i in 0 ..< nums.count {
            var minIndex = i
            for j in i + 1 ..< nums.count {
                if nums[j] < nums[minIndex] {
                    minIndex = j
                }
            }
            if i != minIndex {
                (nums[i], nums[minIndex]) = (nums[minIndex], nums[i])
            }
        }
    }
}

/// 插入排序
extension SolutionSort {
    func insertSort(_ nums: inout [Int]) {
        guard !nums.isEmpty else {
            return
        }
        for i in 1 ..< nums.count {
            var index = -1
            for j in 0 ..< i {
                if nums[i] < nums[j] {
                    index = j
                    break
                }
            }
            if index < 0 {
                continue
            }
            let temp = nums[i]
            for k in 0 ..< i - index  {
                nums[i - k] = nums[i - k - 1]
            }
            nums[index] = temp
        }
    }
}

/// 希尔排序
extension SolutionSort {
    func shellSort(_ nums: inout [Int]) {
        let count = nums.count
        var gap = count / 2
        while gap > 0 {
            
            for i in gap ..< count {
                var j = i
                let curr = nums[i]
                while j - gap >= 0 && curr < nums[j - gap] {
                    nums[j] = nums[j - gap]
                    j -= gap
                }
                nums[j] = curr
            }
            gap = gap / 2
        }
    }
}

/// 归并排序
extension SolutionSort {
    func mergeSort(_ nums: inout [Int]) {
        
    }
}

/// 快速排序
extension SolutionSort {
    func quickSort(_ nums: inout [Int]) {
        quickSort(&nums, 0, nums.count - 1)
    }
    
    func quickSort(_ nums: inout [Int], _ start: Int, _ end: Int) {
        guard start < end else {
            return
        }
        
        // 将起始点作为基准点
        var index = start + 1
        var i = index
        
        while i <= end {
            if nums[i] < nums[start]{
                (nums[i], nums[index]) = (nums[index], nums[i])
                index += 1
            }
            i += 1
        }
        (nums[start], nums[index - 1]) = (nums[index - 1], nums[start])
        
        quickSort(&nums, start, index - 2)
        quickSort(&nums, index + 1, end)
    }
}

/// 堆排序
extension SolutionSort {
    
    /// 建立小根堆
    func buildMaxHeap(_ nums: inout [Int]) {
        len = nums.count
        var i = Int(floor(Double(nums.count) / 2))
        while i >= 0 {
            heapify(&nums, i)
            i -= 1
        }
    }
    
    /// 堆调整
    func heapify(_ nums: inout [Int], _ i: Int) {
        let leftIndex = 2 * i + 1
        let rightIndex = 2 * i + 2
        var maxIndex = i
        
        if leftIndex < len && nums[leftIndex] > nums[maxIndex] {
            maxIndex = leftIndex
        }
        if rightIndex < len && nums[rightIndex] > nums[maxIndex] {
            maxIndex = rightIndex
        }
        
        if i != maxIndex {
            swap(&nums, i, maxIndex)
            // 单纯建堆来说，这个递归是没必要的，这儿是为了后面，交换元素后的堆调整
            heapify(&nums, maxIndex)
        }
    }
    
    /// 交换
    func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        (nums[i], nums[j]) = (nums[j], nums[i])
    }
    
    func heapSort(_ nums: inout [Int]) {
        buildMaxHeap(&nums)
        var index = nums.count - 1
        while index > 0 {
            swap(&nums, 0, index)
            len -= 1
            heapify(&nums, 0)
            index -= 1
        }
    }
}

extension SolutionSort {
    func countSort(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        var maxNum = Int.min
        var hash = [Int: Int]()
        
        for num in nums {
            maxNum = max(maxNum, num)
            if let count = hash[num] {
                hash[num] = count + 1
            } else {
                hash[num] = 1
            }
        }
                        
        var i = 0
        for index in 0 ... maxNum {
            guard let count = hash[index] else {
                continue
            }
            for _ in 0 ..< count {
                nums[i] = index
                i += 1
            }
        }
    }
}

/// 桶排序
extension SolutionSort {
    func bucketSort(_ nums: inout [Int]) {
        guard !nums.isEmpty else {
            return
        }
        
        var maxValue = nums[0]
        var minVlaue = nums[0]
        
        for num in nums {
            maxValue = max(maxValue, num)
            minVlaue = min(minVlaue, num)
        }
        
        let bucketSize = 30
        let bucketCount = (maxValue - minVlaue) / bucketSize + 1
        
        var buckets = [[Int]](repeating: [], count: bucketCount)
        
        // 将数分配到桶里
        for index in 0 ..< nums.count {
            buckets[(nums[index] - minVlaue) / bucketSize].append(nums[index])
        }
        
        /// 把桶内部的元素进行排序
        bucketSortInside(&buckets)
        
        var index = 0
        for i in 0 ..< buckets.count {
            for j in 0 ..< buckets[i].count {
                nums[index] = buckets[i][j]
                index += 1
            }
        }
    }
    
    ///
    func bucketSortInside(_ buckets: inout [[Int]]) {
        for i in 0 ..< buckets.count {
            bubbleSort(&buckets[i])
        }
    }
}

/// 基数排序
extension SolutionSort {
    func radixSort(_ nums: inout [Int]) {
        guard !nums.isEmpty else {
            return
        }
        
        var maxValue = nums[0]
        for num in nums {
            maxValue = max(maxValue, num)
        }
        
        var maxDigit = 0
        while maxValue != 0 {
            maxDigit += 1
            maxValue /= 10
        }
        
        var mod = 10
        var dev = 1
        
        for _ in 0 ..< maxDigit {
            var containers = [Int: [Int]]()
            for j in 0 ..< nums.count {
                let bucket = (nums[j] % mod) / dev
                if containers[bucket] == nil {
                    containers[bucket] = [nums[j]]
                } else {
                    containers[bucket]?.append(nums[j])
                }
            }
            
            var index = 0
            
            for j in 0 ... 9 {
                if let array = containers[j] {
                    for item in array {
                        nums[index] = item
                        index += 1
                    }
                }
            }
            
            dev *= 10
            mod *= 10
        }
        
    }
}
