//
//  CategoryRowAll.swift
//  MiniChallengeApp
//
//  Created by Siria Facciolli on 01/11/22.
//

import SwiftUI

struct CategoryRowAll: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: defaultRadius)
                .fill(.green.gradient)
                .frame(width: defaultHeight, height: defaultHeight)
                .shadow(radius: 1)
                .overlay(
                    Text("All your memories")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(maxHeight: .infinity, alignment: .top)
                        //.font(.title3)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(16)
                )
                .overlay(
                    Text("💾")
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

struct CategoryRowAll_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowAll()
    }
}
