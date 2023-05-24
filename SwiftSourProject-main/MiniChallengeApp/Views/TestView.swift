//
//  TestView.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 31/10/22.
//

import SwiftUI
import CoreData

struct TestView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name, order: .reverse)]) var categories: FetchedResults<CategoryEntity>
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title, order: .reverse)]) var memories: FetchedResults<MemoryEntity>
    
    func addCategory(name: String, emoji: String, color: String) {
        let newCategory = CategoryEntity(context: managedObjectContext)
        newCategory.name = name
        newCategory.emoji = emoji
        newCategory.color = color
        
        try? managedObjectContext.save()
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(memories) {
                    memory in
                    if(memory.category?.name == "Sport") {
                        Text(memory.title ?? "No person")
                    }
                }
            }.navigationTitle("Categories")
            
        }
    }
}



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
