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
    func test() {
        var array = [5,7,3,1,9,2,4,6,8]
//        bubbleSort(&array)
//        selectSort(&array)
//        insertSort(&array)
//        shellSort(&array)
        quickSort(&array)
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
    
    /// 建立大项堆
    func buildMaxHeap(_ nums: [Int]) {
        
    }
    
    /// 堆调整
    func heapify(_ nums: inout [Int]) {
        
    }
    
    func heapSort(_ nums: inout [Int]) {
        
    }
}

