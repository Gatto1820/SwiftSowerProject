//
//  MemoryList.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 31/10/22.
//

import SwiftUI
import CoreData

struct MemoryList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title, order: .reverse)]) var memories: FetchedResults<MemoryEntity>
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(memories) {
                    memory in
                    NavigationLink {
                        //CardViewPush(currentMemoryTitle: "")
                        CardViewPush(currMemoTitle: "Forza Napoli")
                    } label: {
                        Text(memory.title ?? "No Title")
                            .swipeActions {
                                Button {
                                    print("bla")
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }

                            }.tint(.red)
                            .swipeActions {
                                Button {
                                    print("boh")
                                } label: {
                                    Label("Edit", systemImage: "square.and.pencil")
                                }.tint(.blue)
                            }
                    }
                }
            }.navigationTitle("All memories")
        }    }
}

struct MemoryList_Previews: PreviewProvider {
    static var previews: some View {
        MemoryList()
    }
}
