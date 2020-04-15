//
//  Stack.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/15.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

public struct Stack<T> {
    
    // 声明一个泛型数组，用于存储栈里面的元素
    fileprivate var elements = [T]()
        
    /// 计算属性：获取栈中元素的个数
    public var count: Int {
        // 返回数组elements中的元素个数
        return elements.count
    }
        
    /// 构造函数：创建一个空的栈
    public init() {}
        
    /// 出栈操作：删除并返回栈顶元素
    /// - returns:
    /// - 如果栈不为空，则返回第一个类型为T的元素
    /// - 如果栈为空，则返回nil
    mutating public func pop() -> T? {
        // 删除数组中的最后一个元素
        return elements.popLast()
    }
    
    /// 入栈操作：将元素压入栈顶
    /// - 复杂度: O(1)
    /// - 参数element: 一个类型为T的元素
    public mutating func push(_ element: T){
        elements.append(element)
    }
        
    /// 返回栈顶元素(不删除)
    /// - returns:
    /// - 如果栈不为空，则返回第一个类型为T的元素
    /// - 如果栈为空，则返回nil
    public func peek() -> T? {
        return elements.last
    }
        
    /// 检查栈是否为空
    /// - returns: 如果栈为空，则返回True，否则返回False
    public func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
}
