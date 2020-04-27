//
//  LeetCode20.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 有效的括号
class LeetCode20 {
    func test() {
        print(isValid("()"))
    }
    
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty || s.count % 2 != 0 else { return true }
        
        let sArr = Array<Character>(s)
        var stack = Stack<Character>()
        for index in 0 ..< sArr.count {
            
            let character = sArr[index]
            
            guard let stackTop = stack.peek() else {
                stack.push(character)
                continue
            }
            
            var isMatch = false
            
            switch character {
            case ")":
                isMatch = stackTop == "("
            case "}":
                isMatch = stackTop == "{"
            case "]":
                isMatch = stackTop == "["
            default:
                break
            }
            
            if isMatch {
                _ = stack.pop()
            } else {
                stack.push(character)
            }
        }
        
        return stack.isEmpty()
    }
}
