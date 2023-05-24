//
//  ContentView.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 24/10/22.
//

import SwiftUI
import CoreData
import WebKit

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var categories: FetchedResults<CategoryEntity>
    
    @State private var showingSheet = false
    
    
//    var categories: [Category] = [
//        Category(name: "Hobbies", color: .red, emoji: "🎮"),
//        Category(name: "Sports", color: .green, emoji: "⚽️"),
//        Category(name: "Food", color: .yellow, emoji: "🌮"),
//        Category(name: "Ubriacate", color: .purple, emoji: "🍹"),
//        Category(name: "Cacca", color: .brown, emoji: "💩")
//    ]
    
    var body: some View {
        NavigationStack {
            
            ZStack{
                VStack {
                    
                    VStack{
                        
                        HStack {
                            Spacer()
                            Button("Add a memory") {
                                showingSheet.toggle()
                            }.sheet(isPresented: $showingSheet) {
                                AddCardModal()
                                //.presentationDetents([.fraction(0.99)])
                            }
                        }.padding(.bottom,8)
                        Text("Hi, Roberta!😃")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom,24)
                        
                        
                        Text("Last Memory")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom,8)
                        LastMemoryView()
                            .padding(.bottom,16)
                        HStack {
                            Text("Memory boxes")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            NavigationLink {
                                CategoryList()
                            } label: {
                                Text("Show all")
                            }
//                            Button("Show all") {
//                                print("Show all premuto")
//                            }
                        }
                    }
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            CategoryRowAll()
                            ForEach(categories) { category in
                                NavigationLink {
                                    //CategoryView(category: category)
                                } label: {
                                    CategoryRow(category: category)
                                }
                            }
                        }.padding(.horizontal)
                    }
                    .padding(.bottom)

                    
                    
                    Text("Pick a card!")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //RandomPickButton()  //useful to align
                    Spacer()
                    
                }//VStack Grande
                
                /*.navigationTitle("Hi, Roberta!😃")
                .toolbar{
                    Button("Add a memory"){
                        
                    }
                }*/
                
                RandomPickButton().offset(y: 260)
                    
            }//ZStack
            
            //POSSIBILE MODO DI POSIZIONARE BOTTONE
            //.overlay(RandomPickButton(), alignment: .bottom)
            
        }//NavigationStack
    }//View
}//ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

