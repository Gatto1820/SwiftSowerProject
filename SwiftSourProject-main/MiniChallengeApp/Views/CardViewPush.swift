//
//  CardViewPush.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 31/10/22.
//

import SwiftUI
import CoreData

struct CardViewPush: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.timestamp)]) var memories: FetchedResults<MemoryEntity>
    
    var currMemoTitle: String
    
    var body: some View {
        NavigationView {
            RoundedRectangle(cornerRadius: defaultRadius)
                .fill(.white)
                .frame(width: .infinity, height: 544)
                .shadow(radius: 2)
                .overlay(
                    
                    VStack (alignment: .leading, spacing: 16.0) {
                        
                        ForEach(memories) {
                            memory in
                            if(memory.title == currMemoTitle){
                                Text(memory.title ?? "no title")
                                    .font(.system(size: 28))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                //.padding(.top, 32.0)
                                
                                Text(memory.descr ?? "no descr")
                                //.font(.title2)
                                    .font(.system(size: 20))
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                    .opacity(0.55)
                                
                                HStack(spacing: 0.0){
                                    Text("\" ")
                                    //.font(.title2)
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .opacity(0.80)
                                        .italic()
                                    Text(memory.quote ?? "No quote")
                                    //.font(.title2)
                                        .italic()
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .opacity(0.55)
                                    
                                    Text(" \"")
                                    //.font(.title2)
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .opacity(0.80)
                                        .italic()
                                }
                                
                                
                                //questo va in un if per non sfanculare
                                HStack{
                                    
                                    Image(systemName: "calendar")
                                    //.font(.title2)
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .opacity(0.80)
                                    Text(memory.date ?? "no date")
                                    //.font(.title2)
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .opacity(0.55)
                                    
                                }
                                
                                HStack{
                                    Image(systemName: "location")
                                    //.font(.title2)
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .opacity(0.80)
                                    Text(memory.location ?? "no location")
                                    //.font(.title2)
                                        .font(.system(size: 20))
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                        .opacity(0.55)
                                    
                                }
                            }
                        }
                        
                        
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.horizontal, 20.0)
                        .padding(.top, 32.0)
                    
                )
                .overlay(
                    
                    Rectangle()
                        .fill(.red.gradient)
                        .frame(width: .infinity, height: 75)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .cornerRadius(defaultRadius, corners: [.bottomLeft, .bottomRight])
                        .mask({
                            Rectangle()
                                .frame(width: .infinity, height: 60)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                                .cornerRadius(defaultRadius, corners: [.bottomLeft, .bottomRight])
                        })
                        .overlay(
                            Text("🎮 Hobbies")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                                .padding([.leading, .bottom], 20.0)
                        )
                )
        }.navigationTitle("Card")
            .toolbar() {
                Button {
                    print("ue")
                } label: {
                    Text("Edit")
                }
            }
    }
}

struct CardViewPush_Previews: PreviewProvider {
    static var previews: some View {
        CardViewPush(currMemoTitle: "")
    }
}
