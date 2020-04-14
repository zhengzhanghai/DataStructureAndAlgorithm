//
//  SolutionString.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/4/14.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class SolutionString: NSObject {
    func test() {
        print(addBinary("1010", "1011"))
    }
    
    //MARK: 二进制字符串求和
    /// 二进制字符串求和
    func addBinary(_ a: String, _ b: String) -> String {
        let aCount = a.count
        let bCount = b.count
        let count = max(aCount, bCount)
        var result = ""
        var extra = 0
        
        for index in 0 ..< count {
            let aIndex = aCount - index - 1
            let bIndex = bCount - index - 1
            
            var aNumber = 0
            var bNumber = 0
            
            if aIndex >= 0 {
                let aStrIndex = a.index(a.startIndex, offsetBy: aIndex)
                aNumber = Int(String(a[aStrIndex ... aStrIndex])) ?? 0
            }
            if bIndex >= 0 {
                let bStrIndex = b.index(b.startIndex, offsetBy: bIndex)
                bNumber = Int(String(b[bStrIndex ... bStrIndex])) ?? 0
            }
            
            let sum = aNumber + bNumber + extra
            if sum >= 2 {
                extra = 1
                result = String(sum - 2) + result
            } else {
                extra = 0
                result = String(sum) + result
            }
        }
        
        if extra == 1 {
            result = "1" + result
        }
        
        return result
    }
}
