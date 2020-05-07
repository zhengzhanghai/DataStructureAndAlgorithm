//
//  LeetCode22.swift
//  DataStructureAndAlgorithm
//
//  Created by ZZH on 2020/4/27.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 括号生成
class LeetCode22 {
    
    func test() {
        print(generateParenthesis(2))
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            return []
        }
        var res = [String]()
        dfs("", 0, 0, n, &res)
        return res
    }
    
    func dfs(_ currStr: String, _ left: Int, _ right: Int, _ n: Int, _ res: inout [String]) {
        print(String(left) + "   " + String(left) + "  " + currStr)
        guard left != n || right != n else {
            res.append(currStr)
            return
        }
        
        guard left >= right else {
            return
        }
        
        if left < n {
            dfs(currStr + "(", left + 1, right, n, &res)
        }
        if right < n {
            dfs(currStr + ")", left, right + 1, n, &res)
        }
    }
}

// 1
// ((()))
// (()())
// (
