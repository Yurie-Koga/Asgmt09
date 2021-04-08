//
//  TopologicalSortQ207.swift
//  Algorithms
//
//  Created by Uji Saori on 2021-04-07.
//

import Foundation

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adj = [[Int]](repeating: [Int](), count: numCourses)
        var indegree = [Int](repeating: 0, count: numCourses)
        var count = 0

        for edge in prerequisites {
            let u = edge[1]
            let v = edge[0]
            if u == v {
                return false    // cycle itself
            }
            adj[u].append(v)
            indegree[v] += 1
        }

        // Topological Sort using array as queue
        var queue = [Int]()
        for i in 0..<numCourses {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }

        // BFS
        while !queue.isEmpty {
            let u = queue.removeFirst()
            count += 1
            for v in adj[u] {
                indegree[v] -= 1
                if indegree[v] == 0 {
                    queue.append(v)
                }
            }
        }

        return count == numCourses
    }
}
