//
//  LeetCode447.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/9.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

class LeetCode447 {
    
    func test() {
        print(numberOfBoomerangs([[0,0],[1,0],[2,0]]))
    }
    
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        guard points.count >= 3 else {
            return 0
        }
        var res = 0
        
        for i in 0 ..< points.count {
            
            let point1 = points[i]
            var hash = [Int: Int]()
            
            for j in 0 ..< points.count {
                guard i != j else {
                     continue
                }
                let point2 = points[j]
                let distance = (point1[0] - point2[0]) * (point1[0] - point2[0]) + (point1[1] - point2[1]) * (point1[1] - point2[1])
                
                if let count = hash[distance] {
                    hash[distance] = count + 1
                } else {
                    hash[distance] = 1
                }
            }
            
            for (_, count) in hash {
                if count > 1 {
                    res += count * (count - 1)
                }
            }
        }
        
        return res
    }
}
