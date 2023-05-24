//
//  AddCardModal.swift
//  MiniChallengeApp
//
//  Created by Siria Facciolli on 29/10/22.
//

import SwiftUI
import Combine
import CoreData



struct AddCardModal: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var titleEntered = ""
    @State private var descriptionEntered = ""
    @State private var quoteEntered = ""
    @State private var dateEntered = ""
    @State private var locationEntered = ""
    @State private var categoryEntered = ""
    @State private var emojiEntered = ""
    
    
    @State private var categorySelection: String = ""
    @State private var colorSelection = "Red"
    
    
    private var maxTitle: Int = 40
    private var maxDescription: Int = 100
    private var maxQuote: Int = 40
    private var maxDate: Int = 12
    private var maxLocation: Int = 30
    private var maxCategory: Int = 20
    private var maxEmoji: Int = 1
    
    //Function to keep text length in limits
    func limitText() {
        if titleEntered.count > maxTitle {
            titleEntered = String(titleEntered.prefix(maxTitle))
        }
        if descriptionEntered.count > maxDescription {
            descriptionEntered = String(descriptionEntered.prefix(maxDescription))
        }
        if quoteEntered.count > maxQuote {
            quoteEntered = String(quoteEntered.prefix(maxQuote))
        }
        if dateEntered.count > maxDate {
            dateEntered = String(dateEntered.prefix(maxDate))
        }
        if locationEntered.count > maxLocation {
            locationEntered = String(locationEntered.prefix(maxLocation))
        }
        if categoryEntered.count > maxCategory {
            categoryEntered = String(categoryEntered.prefix(maxCategory))
        }
        if emojiEntered.count > maxEmoji {
            emojiEntered = String(emojiEntered.prefix(maxEmoji))
        }
    }
    
    func addCategory(name: String, emoji: String, color: String) {
        let newCategory = CategoryEntity(context: managedObjectContext)
        newCategory.name = name
        newCategory.emoji = emoji
        newCategory.color = color
        
        try? managedObjectContext.save()
    }
    
    func addMemory(title: String, descr: String, quote: String, date: String, location: String, category: CategoryEntity) {
        let newMemory = MemoryEntity(context: managedObjectContext)
        
        newMemory.title = title
        newMemory.descr = descr
        newMemory.quote = quote
        newMemory.date = date
        newMemory.location = location
        newMemory.timestamp = Date.now
        newMemory.category = category
        
        try? managedObjectContext.save()
    }
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var categories: FetchedResults<CategoryEntity>
    
    var body: some View {
        
        NavigationView {
            
            Form{
                
                //CATEGORY SECTION
                Section("Category") {
                    
                    Picker("Choose one", selection: $categorySelection) {
                        ForEach(categories) {
                            category in
                            
                            let categoryForPicker: String = category.name ?? "No name"
                            
                            Text(categoryForPicker).tag(categoryForPicker)
                        }
                        
//                        Text("Hobbies").tag("Hobbies")
//                        Text("Sport").tag("Sport")
                        Text("New category").tag("New category")
                    }
                    
                    if(categorySelection == "New category") {
                        TextField( "Category name", text: $categoryEntered, axis: .vertical)
                            .onReceive(Just(categoryEntered)) { _ in limitText() }
                            .lineLimit(1...2)
                            .cornerRadius(12)
                            .toolbar {
                                ToolbarItemGroup (placement: .keyboard) {
                                    Spacer()
                                }
                            } .textInputAutocapitalization (.never)
                        
                        TextField( "Emoji", text: $emojiEntered, axis: .vertical)
                            .onReceive(Just(emojiEntered)) { _ in limitText() }
                            .lineLimit(1...2)
                            .cornerRadius(12)
                            .toolbar {
                                ToolbarItemGroup (placement: .keyboard) {
                                    Spacer()
                                }
                            } .textInputAutocapitalization (.never)
                        
                        Picker("Color Scheme", selection: $colorSelection) {
                            Text("Red").tag("Red")
                            Text("Green").tag("Green")
                        }
                    }
                }
                
                Section(header:
                            HStack{
                    Text("Title(*)")
                    Spacer()
                    Text(String(titleEntered.count)+"/"+String(maxTitle))
                        .foregroundColor(Color.secondary.opacity(0.8))
                }
                        
                ){
                    TextField( "Give a title to your memory", text: $titleEntered, axis: .vertical)
                        .onReceive(Just(titleEntered)) { _ in limitText() }
                        .lineLimit(1...7)
                        .cornerRadius(12)
                        .toolbar {
                            ToolbarItemGroup (placement: .keyboard) {
                                Spacer()
                            }
                        }
                }
                
                
                Section(header:
                            HStack{
                    Text("Description")
                    Spacer()
                    Text(String(descriptionEntered.count)+"/"+String(maxDescription))
                        .foregroundColor(Color.secondary.opacity(0.8))
                }
                )
                {
                    TextField( "What happened?", text: $descriptionEntered, axis: .vertical)
                        .onReceive(Just(descriptionEntered)) { _ in limitText() }
                        .lineLimit(3...7)
                        .cornerRadius(12)
                        .toolbar {
                            ToolbarItemGroup (placement: .keyboard) {
                                Spacer()
                            }
                        } .textInputAutocapitalization (.never)
                    
                }
                
                
                Section(header:
                            HStack{
                    Text("Quote")
                    Spacer()
                    Text(String(quoteEntered.count)+"/"+String(maxQuote))
                        .foregroundColor(Color.secondary.opacity(0.8))
                }
                )
                {
                    TextField( "Has someone said anything funny?", text: $quoteEntered, axis: .vertical)
                        .onReceive(Just(quoteEntered)) { _ in limitText() }
                        .lineLimit(3...7)
                        .cornerRadius(12)
                        .toolbar {
                            ToolbarItemGroup (placement: .keyboard) {
                                Spacer()
                            }
                        } .textInputAutocapitalization (.never)
                    
                }
                Section(header:
                            HStack{
                    Text("Date")
                    Spacer()
                    Text(String(dateEntered.count)+"/"+String(maxDate))
                        .foregroundColor(Color.secondary.opacity(0.8))
                }
                ){
                    TextField( "When did it happen?", text: $dateEntered, axis: .vertical)
                        .onReceive(Just(dateEntered)) { _ in limitText() }
                        .lineLimit(1...2)
                        .cornerRadius(12)
                        .toolbar {
                            ToolbarItemGroup (placement: .keyboard) {
                                Spacer()
                            }
                        } .textInputAutocapitalization (.never)
                    
                }
                Section(header:
                            HStack{
                    Text("Location")
                    Spacer()
                    Text(String(locationEntered.count)+"/"+String(maxLocation))
                        .foregroundColor(Color.secondary.opacity(0.8))
                }
                )
                {
                    TextField( "Where did it happen?", text: $locationEntered, axis: .vertical)
                        .onReceive(Just(locationEntered)) { _ in limitText() }
                        .lineLimit(1...2)
                        .cornerRadius(12)
                        .toolbar {
                            ToolbarItemGroup (placement: .keyboard) {
                                Spacer()
                            }
                        } .textInputAutocapitalization (.never)
                }
            }
            .navigationBarItems(leading: Button("Cancel",action: {
                presentationMode.wrappedValue.dismiss()
            }))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add a memory")
            .navigationBarItems(trailing: Button("Save",action: {
                
                let currCat: CategoryEntity
                
                if(categorySelection == "New category") {
                    addCategory(name: categoryEntered, emoji: emojiEntered, color: colorSelection)
                    
                    currCat = categories.last ?? categories[0]
                } else {
                    
                    currCat = categories.first(where: { category in
                        category.name == categorySelection
                    }) ?? categories.first!
                }
                
                
                addMemory(title: titleEntered, descr: descriptionEntered, quote: quoteEntered, date: dateEntered, location: locationEntered, category: currCat)
                //
                //                vm.saveData()
                //if(categorySelection)
                presentationMode.wrappedValue.dismiss()
            }))
            
        }
        
        
    }
}

//func takeCategories() {
//    var categoriesForPicker: [String] = []
//
//    ForEach(vm.savedCategories) {
//        category in
//
//        categoriesForPicker.append(category.name)
//    }
//}

struct AddCardModal_Previews: PreviewProvider {
    static var previews: some View {
        AddCardModal()
    }
}
