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
            let centerPoint = points[i]
            for j in 0 ..< points.count {
                guard i != j else {continue}
                let point1 = points[j]
                
                for k in 0 ..< points.count {
                    guard k != i && k != j else {continue}
                    let point2 = points[k]
                    
                    if (centerPoint[0] - point1[0]) * (centerPoint[0] - point1[0]) + (centerPoint[1] - point1[1]) * (centerPoint[1] - point1[1]) == (centerPoint[0] - point2[0]) * (centerPoint[0] - point2[0]) + (centerPoint[1] - point2[1]) * (centerPoint[1] - point2[1]) {
                        res += 1
                    }
                }
            }
        }
        
        return res
    }
}
