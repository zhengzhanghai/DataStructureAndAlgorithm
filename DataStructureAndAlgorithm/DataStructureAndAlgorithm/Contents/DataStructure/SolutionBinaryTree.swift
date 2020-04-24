//
//  SloutionBinaryTree.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/23.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionBinaryTree: NSObject {
    func test() {
        let node1 = TreeNode(7)
        let node2 = TreeNode(3)
        let node3 = TreeNode(15)
        let node4 = TreeNode(9)
        let node5 = TreeNode(20)
        
        node1.left = node2
        node1.right = node3
        node3.left = node4
        node3.right = node5
        
        let bst = BSTIterator(node1)
        
        print(bst.next())
        print(bst.next())
        print(bst.hasNext())
        print(bst.next())
        print(bst.hasNext())
        print(bst.next())
        print(bst.hasNext())
        print(bst.next())
        print(bst.hasNext())
    }
}

//MARK:二叉树的前序遍历
extension SolutionBinaryTree {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {return []}
        var result = [Int]()
        result.append(root.val)
        if let left = root.left {
            let leftArray = preorderTraversal(left)
            for element in leftArray {
                result.append(element)
            }
        }
        if let right = root.right {
            let rightArray = preorderTraversal(right)
            for element in rightArray {
                result.append(element)
            }
        }
        return result
    }
}

//MARK: 二叉树的中序遍历
extension SolutionBinaryTree {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var results = [Int]()
        
        guard let root = root else {
            return results
        }
        
        if let left = root.left {
            for val in inorderTraversal(left) {
                results.append(val)
            }
        }
        
        results.append(root.val)
        
        if let right = root.right {
            for val in inorderTraversal(right) {
                results.append(val)
            }
        }
        
        return results
    }
}

//MARK: 二叉树的后序遍历
extension SolutionBinaryTree {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var results = [Int]()
        
        guard let root = root else {
            return results
        }
        
        if let left = root.left {
            for val in postorderTraversal(left) {
                results.append(val)
            }
        }
                
        if let right = root.right {
            for val in postorderTraversal(right) {
                results.append(val)
            }
        }
        
        results.append(root.val)
        
        return results
    }
}

//MARK: 二叉树的层次遍历
extension SolutionBinaryTree {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var queue = Queue<TreeNode>()
        queue.enqueue(root)
        var result = [[Int]]()
        
        while !queue.isEmpty() {
            let count = queue.count
            var array = [Int]()
            for _ in 0 ..< count {
                guard let node = queue.dequeue() else {
                    continue
                }
                array.append(node.val)
                
                if let left = node.left {
                    queue.enqueue(left)
                }
                if let right = node.right {
                    queue.enqueue(right)
                }
            }
            result.append(array)
        }
        
        return result
    }
}

//MARK:二叉树的最大深度
extension SolutionBinaryTree {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var leftDepth = 0
        var rightDepth = 0
        if let left = root.left {
            leftDepth = maxDepth(left)
        }
        if let right = root.right {
            rightDepth = maxDepth(right)
        }
        
        return max(leftDepth, rightDepth) + 1
    }
}

//MARK：对称二叉树，
extension SolutionBinaryTree {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {return true}
        return isSymmetric(root.left, root.right)
    }
    
    func isSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        if left!.val != right!.val {
            return false
        }
        return isSymmetric(left?.left, right?.right) && isSymmetric(left?.right, right?.left)
    }
}

//MARK: 路径总和
extension SolutionBinaryTree {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        
        let t = sum - root.val
        
        if root.left == nil && root.right == nil {
            return t == 0
        }
        
        return hasPathSum(root.left, t) || hasPathSum(root.right, t)
    }
}


//MARK:从中序与后序遍历序列构造二叉树
extension SolutionBinaryTree {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard !inorder.isEmpty else {return nil}
        
        let rootVal = postorder.last!
        let root = TreeNode(rootVal)
        var inorderLeftArr = [Int]()
        
        var inorderIndex = 0
        for index in 0 ..< inorder.count {
            if inorder[index] == rootVal {
                inorderIndex = index
                break
            } else {
                inorderLeftArr.append(inorder[index])
            }
        }
        
        var postorderLeftArr = [Int]()
        for index in 0 ..< inorderLeftArr.count {
            postorderLeftArr.append(postorder[index])
        }
        
        var inorderRightArr = [Int]()
        for index in inorderIndex + 1 ..< inorder.count {
            inorderRightArr.append(inorder[index])
        }
        
        var postorderRightArr = [Int]()
        for index in inorderLeftArr.count ..< postorder.count - 1 {
            postorderRightArr.append(postorder[index])
        }
        
        root.left = buildTree(inorderLeftArr, postorderLeftArr)
        root.right = buildTree(inorderRightArr, postorderRightArr)
        
        return root
    }
}

//MARK:从前序与中序遍历序列构造二叉树
extension SolutionBinaryTree {
    func buildTree1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else {
            return nil
        }
        
        let rootVal = preorder.first!
        var rootIndex = 0
        
        var inorderLeftArr = [Int]()
        
        for index in 0 ..< inorder.count {
            if inorder[index] == rootVal {
                rootIndex = index
                break
            } else {
                inorderLeftArr.append(inorder[index])
            }
        }
        
        var preorderLeftArr = [Int]()
        for index in 1 ..< 1 + inorderLeftArr.count {
            preorderLeftArr.append(preorder[index])
        }
        
        var preorderRightArr = [Int]()
        for index in preorderLeftArr.count + 1 ..< preorder.count {
            preorderRightArr.append(preorder[index])
        }
        
        var inorderRightArr = [Int]()
        for index in rootIndex + 1 ..< inorder.count {
            inorderRightArr.append(inorder[index])
        }
        
        let root = TreeNode(rootVal)
        root.left = buildTree1(preorderLeftArr, inorderLeftArr)
        root.right = buildTree1(preorderRightArr, inorderRightArr)
        
        return root
    }
}

//MARK: 填充每个节点的下一个右侧节点指针
extension SolutionBinaryTree {
    
    public class Node {
        public var val: Int
        public var left: Node?
        public var right: Node?
        public var next: Node?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.next = nil
        }
    }
    
    /// 完全二叉树连接方法
    func connect(_ root: Node?) -> Node? {
        connect(root?.left, root?.right)
        return root
    }
    
    func connect(_ left: Node?, _ right: Node?) {
        guard left != nil && right != nil else {
            return
        }
        left?.next = right
        connect(left?.left, left?.right)
        connect(left?.right, right?.left)
        connect(right?.left, right?.right)
    }
    
    ///普通二叉树连接方法
    func connect1(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        var queue = Queue<Node>()
        queue.enqueue(root)
        
        while !queue.isEmpty() {
            var previousNode: Node? = nil
            
            let count = queue.count
            for _ in 0 ..< count {
                let node = queue.dequeue()!
                previousNode?.next = node
                previousNode = node
                
                if let left = node.left {
                    queue.enqueue(left)
                }
                if let right = node.right {
                    queue.enqueue(right)
                }
            }
        }
        
        return root
    }
}

//MARK: 二叉树的最近公共祖先
extension SolutionBinaryTree {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        return lowestCommon(root: root, p, q: q).2
    }
    
    func lowestCommon(root: TreeNode?, _ p: TreeNode?, q: TreeNode?) -> (Bool, Bool, TreeNode?) {
        guard root != nil else {return (false, false, nil)}
        var hasP = root === p
        var hasQ = root === q
        
        let left = lowestCommon(root: root?.left, p, q: q)
        if left.2 != nil {
            return left
        }
        let right = lowestCommon(root: root?.right, p, q: q)
        if right.2 != nil {
            return right
        }
        
        hasP = hasP || left.0 || right.0
        hasQ = hasQ || left.1 || right.1
        
        return (hasP, hasQ, (hasP && hasQ) ? root : nil)
    }
}

//MARK: 二叉树序列化和反序列化
class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return ""
        }
        print("serialize")
        print(Date())
        var result = ""
        
        var queue = Queue<TreeNode?>()
        queue.enqueue(root)
        
        while true {
            var isAllNil = true
            let count = queue.count
            for _ in 0 ..< count {
                let node = queue.dequeue()!
                if let node = node {
                    queue.enqueue(node.left)
                    queue.enqueue(node.right)
                    result += String(node.val) + ","
                    if node.left != nil || node.right != nil  {
                        isAllNil = false
                    }
                } else {
                    queue.enqueue(nil)
                    queue.enqueue(nil)
                    result += "null,"
                }
            }
            
            if isAllNil { break }
        }
        
        result = "[" + result
        result.removeLast()
        result += "]"
        print(Date())
        return result
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        guard data.count > 2 else {
            return nil
        }
        print("deserialize")
        print(Date())
        
        var str = data
        str.removeLast()
        str.removeFirst()
        
        let array = str.split(separator: ",")
        var nodes = [TreeNode?]()

        for (index, str) in array.enumerated() {
            let node = str == "null" ? nil : TreeNode(Int(str) ?? 0)
            let fatherIndex = (index - 1) / 2
            if index > 0 {
                if index % 2 == 0 {
                    nodes[fatherIndex]?.right = node
                } else {
                    nodes[fatherIndex]?.left = node
                }
            }
            nodes.append(node)
        }
        print(Date())
        return nodes.first ?? nil
    }
}

//判断是否是搜索二叉树
extension SolutionBinaryTree {
    func isValidBST(_ root: TreeNode?) -> Bool {
        let array = inorderTraversal(root)
        guard array.count > 1 else {
            return true
        }
        for index in 0 ..< array.count - 1 {
            if array[index] >= array[index + 1] {
                return false
            }
        }
        
        return true
    }
}

extension SolutionBinaryTree {
    
}


//MARK:搜索二叉树的迭代器
class BSTIterator {
    var root: TreeNode? = nil
    var currentNode: TreeNode? = nil
    var rightNode: TreeNode? = nil
    var stack: Stack<TreeNode>
    
    init(_ root: TreeNode?) {
        self.root = root
        self.stack = Stack<TreeNode>()
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        guard hasNext() else {
            return 0
        }
        var node: TreeNode? = nil
        if currentNode == nil {
            node = root
        } else {
            node = currentNode?.right
        }
        
        while node != nil {
            stack.push(node!)
            if node?.left != nil {
                node = node?.left
            } else {
                break
            }
        }

        guard node == nil || node === currentNode else {
            currentNode = node
            return node?.val ?? 0
        }
                
        while currentNode != nil {
            _ = stack.pop()
            if stack.peek()?.left === currentNode {
                currentNode = stack.peek()
                break
            }
            currentNode = stack.peek()
        }
        
        return currentNode?.val ?? 0
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        if currentNode == nil {
            return root != nil
        } else {
            if self.rightNode == nil {
                var rightNode: TreeNode? = root
                while rightNode?.right != nil {
                    rightNode = rightNode?.right
                }
                self.rightNode = rightNode
            }
            return currentNode !== rightNode
        }
    }
}


//MARK: 在二叉树中搜索 Search in a Binary Search Tree
extension SolutionBinaryTree {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        guard root.val != val else {
            return root
        }
        return searchBST(root.val > val ? root.left : root.right, val)
    }
}

//MARK: 二叉树中插入一个值
extension SolutionBinaryTree {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        
        return root
    }
}

//MARK:
extension SolutionBinaryTree {

}

