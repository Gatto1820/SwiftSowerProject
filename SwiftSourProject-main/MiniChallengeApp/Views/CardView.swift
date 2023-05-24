//
//  CardView.swift
//  MiniChallengeApp
//
//  Created by Walter Galiano on 25/10/22.
//

import SwiftUI
import CoreData
import WebKit

//roba per fare corner smussati solo sopra al rettangolo
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}





struct CardView: View {
    var body: some View {
        
        RoundedRectangle(cornerRadius: defaultRadius)
            .fill(.white)
            .frame(width: .infinity, height: 544)
            .shadow(radius: 2)
            .overlay(
                
                VStack (alignment: .leading, spacing: 16.0) {
                    
                    Text("That time when my playstation 5 exploded")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    //.padding(.top, 32.0)
                    
                    Text("ciao stavo all'academy, mi sono fatto cacca sotto , poi giselle mi ha salvato ")
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
                        Text("ciao fratm comm si fort")
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
                        Text("ciao")
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
                        Text("ciao")
                        //.font(.title2)
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                            .opacity(0.55)
                        
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
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
