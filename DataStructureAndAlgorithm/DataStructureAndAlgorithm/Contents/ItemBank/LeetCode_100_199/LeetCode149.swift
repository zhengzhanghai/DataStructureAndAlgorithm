//
//  LeetCode149.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/11.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 直线上最多的点数
class LeetCode149 {
    func test() {
        print(maxPoints([[-54,-297],[-36,-222],[3,-2],[30,53],[-5,1],[-36,-222],[0,2],[1,3],[6,-47],[0,4],[2,3],[5,0],[48,128],[24,28],[0,-5],[48,128],[-12,-122],[-54,-297],[-42,-247],[-5,0],[2,4],[0,0],[54,153],[-30,-197],[4,5],[4,3],[-42,-247],[6,-47],[-60,-322],[-4,-2],[-18,-147],[6,-47],[60,178],[30,53],[-5,3],[-42,-247],[2,-2],[12,-22],[24,28],[0,-72],[3,-4],[-60,-322],[48,128],[0,-72],[-5,3],[5,5],[-24,-172],[-48,-272],[36,78],[-3,3]]))
    }
    
    func maxPoints(_ points: [[Int]]) -> Int {
        guard points.count > 2 else {
            return points.count
        }
        
        var set = Set<String>()
        var maxPoint = 0
        
        for i in 0 ..< points.count - 1 {
            let point1 = points[i]
            var samePointCount = 0
            for j in i + 1 ..< points.count {
                let point2 = points[j]
                guard point1 != point2 else { // 相同点
                    samePointCount += 1
                    continue
                }
                var isEqualX = false
                var abString = ""
                var a: Float = 0
                var b: Float = 0
                if point2[0] == point1[0] { // x相等，平行于Y轴
                    isEqualX = true
                    abString = "x" + String(Float(point1[0]))
                } else {
                    a = Float(point2[1] - point1[1])/Float(point2[0] - point1[0])
                    b = Float(point1[1]) - a * Float(point1[0])
                    abString = String(a) + "_" + String(b)
                }
                guard !set.contains(abString) else {
                    continue
                }
                set.insert(abString)
                print(abString)
                
                var pointCount = 2
                for k in j + 1 ..< points.count {
                    if isEqualX {
                        if points[k][0] == point1[0] {
                            pointCount += 1
                        }
                    } else if Float(points[k][0]) * a + b == Float(points[k][1]) {
                        pointCount += 1
                    }
                }
                
                maxPoint = max(maxPoint, pointCount + samePointCount)
            }
            maxPoint = max(maxPoint, samePointCount + 1)
        }
        
        return maxPoint
    }
}
