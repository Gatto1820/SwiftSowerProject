//
//  CardModal.swift
//  MiniChallengeApp
//
//  Created by Siria Facciolli on 25/10/22.
//

import SwiftUI




struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}


struct CardModal: View {
    
    @Binding var isShowing: Bool
    @State private var draggedOffset = CGSize.zero
    
    
    
    var body: some View {
        ZStack (alignment: .bottom){
            
            if isShowing{
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                CardView()
                    //for the dragging capsule
                    .overlay(
                        ZStack{
                            Capsule().frame(width: 40, height: 6)
                                .opacity(0.50)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .padding(.top,8)
                        .background(Color.white.opacity(0.00001)) //important for dragging???
                        .gesture(dragGesture)
                    )
                    .padding(16)
                    .transition(.move(edge: .bottom)) //transtion when it appears and goes away
                    .animation(.spring(), value: draggedOffset==CGSize.zero) //smooth movement when you let go of dragging gesture
                    .offset(y:self.draggedOffset.height) //for the gesture
                
            }
            
        }
        .animation(.easeInOut, value: isShowing) //smooths the animation when modal appears
    }
    
    
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged{ value in
                self.draggedOffset = value.translation
            }
        
            .onEnded{ value in
                //below a certain point the modal goes away
                if self.draggedOffset.height > 200{
                    self.isShowing = false
                    self.draggedOffset = CGSize.zero    //to avoid bug: without it it stays low when recalled by the button
                }
                else{
                    //to make the modal go back in position when gesture stops
                    self.draggedOffset = CGSize.zero
                }
            }
        
    }
}

struct CardModal_Previews: PreviewProvider {
    static var previews: some View {
        CardModal(isShowing: .constant(true))
    }
}
