//
//  LeetCode1371.swift
//  DataStructureAndAlgorithm
//
//  Created by 郑章海 on 2020/5/20.
//  Copyright © 2020 zzh. All rights reserved.
//

import UIKit

/// 每个元音包含偶数次的最长子串
class LeetCode1371 {
    
    func test() {
        print(findTheLongestSubstring("eleetminicoworoep"))
    }
    
    func findTheLongestSubstring(_ s: String) -> Int {
        var m = [Int](repeating: -2, count: 32)
        m[0] = -1
        var state = 0
        var ans = 0
        
        let endIndex = s.endIndex
        var sIndex = s.startIndex
        var index = 0
        
        while sIndex < endIndex {
            
            let char = s[sIndex]
            
            if char == "a" {
                state ^= 1 << 0
            } else if char == "e" {
                state ^= 1 << 1
            } else if char == "i" {
                state ^= 1 << 2
            } else if char == "o" {
                state ^= 1 << 3
            } else if char == "u" {
                state ^= 1 << 4
            }
            
            if m[state] != -2 {
                ans = max(ans, index - m[state])
            } else {
                m[state] = index
            }
            
            index += 1
            sIndex = s.index(after: sIndex)
        }
        
        return ans
    }
}


//class Solution {
//public:
//    const char vowel[5] = {'a', 'e', 'i', 'o', 'u'};
//    int findTheLongestSubstring(string s)
//    {
//        int m[32];
//        int state=0;
//        int ans=0;
//        for (int i=0;i<32;i++)
//            m[i]=-2;
//        m[0]=-1;
//        for (int j=0;j<s.size();j++)
//        {
//            for (int i=0;i<5;i++)
//            {
//                if (s[j]==vowel[i])
//                {
//                    state^=(1<<i);
//                    break;
//                }
//            }
//            if (m[state]!=-2)
//                ans=max(ans,j-m[state]);
//            else
//                m[state]=j;
//        }
//        return ans;
//    }
//};
