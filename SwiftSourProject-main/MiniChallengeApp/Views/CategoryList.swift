//
//  CategoryList.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 31/10/22.
//

import SwiftUI
import CoreData

struct CategoryList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name, order: .reverse)]) var categories: FetchedResults<CategoryEntity>

    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) {
                    category in
                    NavigationLink {
                        MemoryList()
                    } label: {
                        HStack {
                            Image(systemName: "folder.fill")
                                .foregroundColor(stringToColor(color: category.color ?? "Red"))
                            Text(category.name ?? "No Name")
                        }
                    }
                }
            }.navigationTitle("Categories")
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
