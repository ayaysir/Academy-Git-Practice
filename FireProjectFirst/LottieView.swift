//
//  LottieView.swift
//  FireProjectFirst
//
//  Created by Kimjaekyeong on 2023/05/04.
//
import Foundation
import Lottie
import SwiftUI
import UIKit


    
    struct LottieView: UIViewRepresentable {
        var name : String
        var loopMode: LottieLoopMode
        
        init(jsonName: String = "", loopMode : LottieLoopMode = .loop){
            self.name = jsonName
            self.loopMode = loopMode
        }
        
        func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
            let view = UIView(frame: .zero)
            
            let animationView = LottieAnimationView()
            let animation = LottieAnimation.named(name, bundle: Bundle.main)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = loopMode
            animationView.play()
            animationView.backgroundBehavior = .pauseAndRestore
            
            
            animationView.translatesAutoresizingMaskIntoConstraints = false
            
            view.addSubview(animationView)
            
            NSLayoutConstraint.activate([
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
            
            return view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
        }
        
    
}
