//
//  Constants.swift
//  MiniChallengeApp
//
//  Created by Siria Facciolli on 24/10/22.
//

import Foundation
import SwiftUI


let defaultRadius: CGFloat = 12
let defaultHeight: CGFloat = 128


func stringToColor(color: String) -> Color {
    switch(color){
    case "Red":
        return .red
    case "Blue":
        return .blue
    case "Yellow":
        return .yellow
    case "Cyan":
        return .cyan
    case "Brown":
        return .brown
    case "Pink":
        return .pink
    case "Orange":
        return .orange
    case "Mint":
        return .mint
    case "Green":
        return .green
    case "Gray":
        return .gray
    case "Indigo":
        return .indigo
    case "Purple":
        return .purple
    default:
        return .red
    }
}
