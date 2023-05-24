//
//  LastMemoryView.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 24/10/22.
//

import SwiftUI
import CoreData

struct LastMemoryView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.timestamp)]) var memories: FetchedResults<MemoryEntity>
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: defaultRadius)
            .fill(.white)
            .frame(width: .infinity, height: 144)
            .shadow(radius: 2)
            .overlay(
                
                VStack (alignment: .leading, spacing: 16.0) {
                    
                    Text(memories.last?.title ?? "You have no memories added, add one now!")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.horizontal, 16.0)
                    .padding(.top, 16.0)
            )
            .overlay(
                Rectangle()
                    .fill(.red.gradient)
                    .frame(width: .infinity, height: 60)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .cornerRadius(defaultRadius, corners: [.bottomLeft, .bottomRight])
                    .mask({
                        Rectangle()
                            .frame(width: .infinity, height: 48)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .cornerRadius(defaultRadius, corners: [.bottomLeft, .bottomRight])
                    })
                    .overlay(
                        Text("🎮 Hobbies")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .padding([.leading, .bottom], 16.0)
                    )
            )
    }
}

struct LastMemoryView_Previews: PreviewProvider {
    static var previews: some View {
        LastMemoryView()
    }
}

