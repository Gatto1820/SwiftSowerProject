//
//  RandomPickButton.swift
//  MiniChallengeApp
//
//  Created by Siria Facciolli on 24/10/22.
//

import SwiftUI




struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct RandomPickButton: View {
    
    @State var animatedButton : String = ""
    @State var timer = Timer.publish(every: 0.06, on: RunLoop.main, in: .common).autoconnect()
    @State var index = 0
    
    
    @State private var pulsate = false
    
    @State private var showwaves = false
    
    
    @State private var showCardModal = false
    
    var body: some View {
        ZStack(alignment: .center) {
            
            Button(action: {
                showCardModal = true
            })
            {
                
                
                ZStack(alignment: .center) {
                    
                    
                    
//
//                    Circle()
//                        .fill(/*@START_MENU_TOKEN@*/Color(red: 0.962, green: 0.695, blue: 0.031)/*@END_MENU_TOKEN@*/)
//                        .frame(width: 150, height: 150, alignment: .center)
//                        .opacity(0.5)
                    /*.scaleEffect(showwaves ?  0.8 : 1, anchor: .center)
                     //.hueRotation(.degrees (showwaves ? 260 : 9))
                     //.opacity(showwaves ? 2 : 1)
                     .animation(.easeInOut (duration:1.8).repeatForever(autoreverses: true) .speed(2))
                     . onAppear() {
                     self.showwaves.toggle()
                     
                     }*/
                    
//
//                    Circle()
//                        .fill(/*@START_MENU_TOKEN@*/Color(red: 0.962, green: 0.695, blue: 0.031)/*@END_MENU_TOKEN@*/)
//                        .frame(width: 150, height: 150)
//                        .opacity(0.5)


                    Circle()
                        .fill(.blue.gradient)
                        .frame(width: 170, height: 170)
                        .shadow(radius: 1)
                        .opacity(0.5)

                    
                    Image(animatedButton)
                                        .resizable()
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .mask(Circle().frame(width: 150, height: 150, alignment: .center))
                                        .shadow(radius: 1)
                                        .onReceive(timer) { _ in
                                            
                                            if index<10{
                                                animatedButton = "ezgif-frame-00\(index)"
                                            }else
                                            {
                                                animatedButton = "ezgif-frame-0\(index)"
                                            }
                                            
                                            
                                            index += 1
                                            
                                            if (index > 24){
                                                index = 0
                                                
                                            }
                                        }
                    
                }
                
                
            }
            
            
            
            
            CardModal(isShowing: $showCardModal).offset(y: -260)
        }
    }
}

struct RandomPickButton_Previews: PreviewProvider {
    static var previews: some View {
        RandomPickButton()
    }
}

