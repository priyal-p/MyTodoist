//
//  Task.swift
//  MyTodoist
//
//  Created by Priyal PORWAL on 03/07/21.
//

import Foundation
struct Task: Equatable, Identifiable, Codable {
    var id: UUID
    
    let title: String
    init(title: String) {
        self.title = title
        self.id = UUID()
    }
}
