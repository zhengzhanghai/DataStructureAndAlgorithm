//
//  SolutionNAryTree.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/24.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionNAryTree {
    func test() {
        
    }
    
    public class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int) {
            self.val = val
            self.children = []
        }
    }
}

//MARK: N叉树的前序遍历遍历
extension SolutionNAryTree {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var array = [Int]()
        array.append(root.val)
        
        for node in root.children {
            let subArr = preorder(node)
            for num in subArr {
                array.append(num)
            }
        }
        
        return array
    }
}

//MARK:N叉树的后序遍历
extension SolutionNAryTree {
    func postorder(_ root: Node?) -> [Int] {
        guard let root = root else {
            return []
        }
        var array = [Int]()
        for node in root.children {
            let subArr = postorder(node)
            for num in subArr {
                array.append(num)
            }
        }
        array.append(root.val)
        return array
    }
}

//MARK: N叉树的层次遍历
extension SolutionNAryTree {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var array = [[Int]]()
        
        var queue = Queue<Node>()
        queue.enqueue(root)
        
        while !queue.isEmpty() {
            let count = queue.count
            var subArr = [Int]()
            for _ in 0 ..< count {
                let node = queue.dequeue()!
                subArr.append(node.val)
                for subNode in node.children {
                    queue.enqueue(subNode)
                }
            }
            array.append(subArr)
        }
        
        return array
    }
}

//MARK: N叉树的额最大深度
extension SolutionNAryTree {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else {return 0}
        var subMaxDepth = 0
        for node in root.children {
            subMaxDepth = max(subMaxDepth, maxDepth(node))
        }
        return subMaxDepth + 1
    }
}
