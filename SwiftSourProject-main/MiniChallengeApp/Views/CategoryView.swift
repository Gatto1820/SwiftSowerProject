//
//  CategoryView.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 24/10/22.
//

import SwiftUI

struct CategoryView: View {
    
    var category: Category
    
    var body: some View {
        HStack {
            Text(category.name)
                .foregroundColor(.black)
                .bold()
            Spacer()
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(category.color)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(name: "test", color: .orange, emoji: "🐸"))
    }
}
