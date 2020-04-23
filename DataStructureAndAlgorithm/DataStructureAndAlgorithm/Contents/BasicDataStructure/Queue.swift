//
//  Queue.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/23.
//  Copyright © 2020 zzh. All rights reserved.
//

import Foundation

public struct Queue<T> {
    // 泛型数组：用于存储数据元素
    fileprivate var data = [T]()
    
    /// 构造函数：创建一个空的队列
    public init() {}
        
    /// 入队列操作：将元素添加到队列的末尾
    /// -复杂度: O(1)
    /// -参数element: 一个类型为T的元素
    public mutating func enqueue(_ element: T) {
        data.append(element)
    }
        
    /// 出队列操作：删除并返回队列中的第一个元素
    /// -returns:
    /// -如果队列不为空，则返回第一个类型为T的元素
    /// -如果队列为空，则返回nil
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    /// 返回队列中的第一个元素(不删除)
    /// -returns:
    /// -如果队列不为空，则返回第一个类型为T的元素
    /// -如果队列为空，则返回nil
    public func peek() -> T? {
        return data.first
    }
        
    /// 将队列重置为空状态
    public mutating func clear() {
        data.removeAll()
    }
    
    /// 返回队列中元素的个数
    public var count: Int {
        return data.count
    }
    
    /// 计算属性：返回队列的存储容量
    /// - get：获取队列的存储空间，但不会分配新的存储空间
    /// - set：分配足够的空间来存储指定数量的元素
    public var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
        
    /// 检查队列是否已满
    /// -returns: 如果队列已满，则返回true，否则返回false
    public func isFull() -> Bool {
        return count == data.capacity
    }
        
    /// 检查队列是否为空
    /// - returns: 如果队列为空，则返回true，否则返回false
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    /// 检查队列中的索引是否合法
    fileprivate func checkIndex(_ index: Int) {
        if index < 0 || index > count {
            fatalError("Index out of range")
        }
    }
}
