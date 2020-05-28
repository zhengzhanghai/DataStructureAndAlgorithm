//
//  LeetCode394.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/28.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 字符串解码
class LeetCode394 {
    func decodeString(_ s: String) -> String {
        var stack = Stack<String>()
        var strIndex = s.startIndex
        
        while strIndex < s.endIndex {
            let current = String(s[strIndex])
            
            if current == "[" {
                stack.push(current)
            } else if current == "]" {
                if let str = stack.pop() { // 要重复的串
                    _ = stack.pop()
                    if let countStr = stack.pop() { // 重复的次数
                        var allStr = ""
                        for _ in 0 ..< (Int(countStr) ?? 0) {
                            allStr += str
                        }
                        popSameFeatures(&stack, allStr) { (string) -> Bool in
                            isLetters(string)
                        }
                    }
                }
            } else if isNumber(current) { // 当前是数字
                popSameFeatures(&stack, current) { (str) -> Bool in
                    return isNumber(str)
                }
            } else { // 当前是字母
                popSameFeatures(&stack, current) { (str) -> Bool in
                    return isLetters(str)
                }
            }
            
            strIndex = s.index(after: strIndex)
        }
        
        return stack.peek() ?? ""
    }
    
    // 入栈相同特点的字符, 如果要入栈的元素和栈顶的元素是同一类型的元素，将合并
    func popSameFeatures(_ stack: inout Stack<String>, _ popChar: String, _ condition: (String) -> Bool) {
        var pop = ""
        var allPop = ""
        
        while !stack.isEmpty() {
            if let temp = stack.pop() {
                pop = temp
                let isContinue = condition(temp)
                if isContinue {
                    allPop = temp + allPop
                } else {
                    break
                }
            }
        }
        
        if pop != "" && !condition(pop) {
            stack.push(pop)
        }
        
        stack.push(allPop + popChar)
    }
    
    /// 是否是一个或多个数字
    func isNumber(_ s: String) -> Bool {
        // let numPredicate = "[0-9]+"
        // let predicate = NSPredicate(format: "SELF MATCHES %@", numPredicate)
        // return predicate.evaluate(with: s)
        
        // 想用正则的，但是使用正则在力扣上提交会编译报错
        return Int(s) != nil
    }
    
    /// 是否是一个或多个字母
    func isLetters(_ s: String) -> Bool {
        // let numPredicate = "[a-zA-Z]+"
        // let predicate = NSPredicate(format: "SELF MATCHES %@", numPredicate)
        // return predicate.evaluate(with: s)
        
        // 想用正则的，但是使用正则在力扣上提交会编译报错
        guard !isNumber(s) else {return false}
        guard s != "[" && s != "]" else {return false}
        return true
    }
}
