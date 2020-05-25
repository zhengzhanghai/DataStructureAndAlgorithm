//
//  LeetCode146.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/25.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// LRU 缓存机制
class LeetCode146 {
    func test() {
        let LRU = LRUCache(3)
        LRU.put(1, 1)
        LRU.put(2, 2)
        LRU.put(3, 3)
        LRU.put(4, 4)
        print(LRU.get(4))
        print(LRU.get(3))
        print(LRU.get(2))
        print(LRU.get(1))
        LRU.put(5, 5)
        print(LRU.get(1))
        print(LRU.get(2))
        print(LRU.get(3))
        print(LRU.get(4))
        print(LRU.get(5))
    }
}

extension LRUCache {
    class ListNode {
        var next: ListNode? = nil
        var pre: ListNode? = nil
        var key: Int
        var value: Int
        
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
}

/// LRU 缓存机制
class LRUCache {
    /// 缓存总容量
    var capacity: Int
    /// 当前的数的量
    var count = 0
    
    /// 双向链表头
    var listHead: ListNode? = nil
    /// 双向链表尾
    var listTail: ListNode? = nil
    /// 存储key对应的节点
    var indexMap: [Int: ListNode] = [:]

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let node = indexMap[key] { // 用到一个节点，需要将这个节点移动到尾部
            moveToListTail(node)
            return node.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = indexMap[key] { // 如果之前存在这个Key，更新node，并将这个节点移动到链表尾部
            node.value = value
            moveToListTail(node)
        } else { // 不存在这个key
            if isFull { // 如果缓存满了，删掉头结点
                indexMap.removeValue(forKey: listHead?.key ?? Int.max)
                let node = listHead?.next
                listHead?.next = nil
                node?.pre = nil
                listHead = node
                
            } else {
                count += 1
            }
            
            let node = ListNode(key, value)
            indexMap[key] = node
            addToListTail(node)
        }
    }
    
    private var isFull: Bool {
        return count >= capacity
    }
    
    private var isEmpty: Bool {
        return false
    }
    
    /// 将节点移动到链表尾部，这儿要注意，node可能是head，
    private func moveToListTail(_ node: ListNode?) {
        guard node !== listTail else {
            return
        }
        
        node?.pre?.next = node?.next
        node?.next?.pre = node?.pre
        // 有可能是移动的head
        if node === listHead {
            listHead = node?.next
        }
        addToListTail(node)
    }
    
    // 将节点添加到链表尾部
    private func addToListTail(_ node: ListNode?) {
        guard listHead != nil else {
            listHead = node
            listTail = node
            return
        }
        node?.pre = listTail
        node?.next = nil
        listTail?.next = node
        listTail = node
    }
}

