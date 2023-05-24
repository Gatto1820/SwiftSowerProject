//
//  Category.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 24/10/22.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    var id = UUID()
    
    var name: String
    var color: Color
    var emoji: String
}
