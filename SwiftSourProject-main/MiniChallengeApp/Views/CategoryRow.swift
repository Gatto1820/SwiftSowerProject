//
//  CategoryRow.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 24/10/22.
//

import SwiftUI
import CoreData

struct CategoryRow: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var categories: FetchedResults<CategoryEntity>
//
//    var categoryName: String
    
    var category: CategoryEntity
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: defaultRadius)
                .fill(stringToColor(color: category.color ?? "Red").gradient)
                .frame(width: defaultHeight, height: defaultHeight)
                .shadow(radius: 1)
                .overlay(
                    Text(category.name ?? "No name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxHeight: .infinity, alignment: .top)
                        //.font(.title3)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(16)
                )
                .overlay(
                    Text(category.emoji ?? "")
                        .font(.system(size: 72))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(x: -8, y: 20)
                        .rotationEffect(Angle(degrees: -15))
                        .mask(RoundedRectangle(cornerRadius: defaultRadius))
                    
                )
        }
    }
}

//struct CategoryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryRow(category: CategoryEntity.init())
//    }
//}
