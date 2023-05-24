//
//  CoreDataRelationships.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 31/10/22.
//

import SwiftUI
import CoreData

class CoreDataRelationshipsViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var savedCategories: [CategoryEntity] = []
    @Published var savedMemories: [MemoryEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "ContainerMemories")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        
        fetchCategories()
        fetchMemories()
    }
    
    func fetchCategories() {
        let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
        
        do {
            savedCategories = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func fetchMemories() {
        let request = NSFetchRequest<MemoryEntity>(entityName: "MemoryEntity")
        
        do {
            savedMemories = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addCategory(name: String, emoji: String, color: String) {
        let newCategory = CategoryEntity(context: container.viewContext)
        newCategory.name = name
        newCategory.emoji = emoji
        newCategory.color = color
        
        saveData()
    }
    
    func addMemory(title: String, descr: String, quote: String, date: String, location: String, category: CategoryEntity) {
        let newMemory = MemoryEntity(context: container.viewContext)
        
        newMemory.title = title
        newMemory.descr = descr
        newMemory.quote = quote
        newMemory.date = date
        newMemory.location = location
        newMemory.timestamp = Date.now
        newMemory.category = category
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchCategories()
            fetchMemories()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    
    func deleteCategory(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedCategories[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func deleteMemory(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedMemories[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
}

struct CoreDataRelationships: View {
    @StateObject var vm = CoreDataRelationshipsViewModel()
    
    var body: some View {
        VStack {
            //            Button {
            //                showingSheet.toggle()
            //            } label: {
            //                Text("Add a memory")
            //            }.sheet(isPresented: $showingSheet) {
            //                AddCardModal()
            //            }
            
            Button {
                vm.addCategory(name: "Nuova cate", emoji: "p", color: "Red")
                let newCat: CategoryEntity = vm.savedCategories.last ?? vm.savedCategories[0]
                
                vm.addMemory(title: "NewMemo", descr: "blabla", quote: "xdxd", date: "oggi", location: "Napoli", category: newCat)
            } label: {
                Text("New memory (CD)")
            }
            
            
            Spacer()
            
            List {
                    ForEach(vm.savedCategories) { category in
                        HStack {
                            Text(category.name ?? "NO NAME")
                            Spacer()
                            Text(category.emoji ?? "NO EMOJI")
                            Spacer()
                            Text(category.color ?? "NO COLOR")
                        }
                    }.onDelete(perform: vm.deleteCategory)
                    
                    
                    
                    ForEach(vm.savedMemories) {
                        memory in
                        VStack {
                            Text(memory.title ?? "NO TITLE")
                            Text(memory.descr ?? "NO TITLE")
                            Text(memory.quote ?? "NO TITLE")
                            Text(memory.date ?? "NO TITLE")
                            Text(memory.location ?? "NO TITLE")
                            Text(memory.category?.name ?? "NO NAME")
                        }
                    }.onDelete(perform: vm.deleteMemory)
                
                
                //                ForEach(vm.savedMemories) {
                //                    memory in
                //                    VStack {
                //                        Text(memory.title ?? "no title")
                //                        Text(memory.descr ?? "no descr")
                //                        Text(memory.citation ?? "no cit")
                //                        Text(memory.date ?? "no date")
                //                        Text(memory.location ?? "no location")
                //                        Text(memory.category?.name ?? "no name")
                //                    }
                //                }.onDelete(perform: vm.deleteMemory)
                
                //            Button {
                //                showingSheet2.toggle()
                //            } label: {
                //                Text("Visualizza aggiornamenti")
                //            }.sheet(isPresented: $showingSheet2) {
                //                List {
                //                    ForEach(vm.savedCategories) { category in
                //                        HStack {
                //                            Text(category.name ?? "NO NAME")
                //                            Spacer()
                //                            Text(category.emoji ?? "NO EMOJI")
                //                            Spacer()
                //                            Text(category.color ?? "NO COLOR")
                //                        }
                //                    }.onDelete(perform: vm.deleteCategory)
                //
                //                    ForEach(vm.savedMemories) {
                //                        memory in
                //                        VStack {
                //                            Text(memory.title ?? "no title")
                //                            Text(memory.descr ?? "no descr")
                //                            Text(memory.citation ?? "no cit")
                //                            Text(memory.date ?? "no date")
                //                            Text(memory.location ?? "no location")
                //                            Text(memory.category?.name ?? "no name")
                //                        }
                //                    }.onDelete(perform: vm.deleteMemory)
                //                }.listStyle(PlainListStyle())
            }
            
            
            
        }
    }
}

struct CoreDataRelationships_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataRelationships()
    }
}
