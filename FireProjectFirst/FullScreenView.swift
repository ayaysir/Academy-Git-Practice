//
//  FullscreenPage.swift
//  FireProjectFirst
//
//  Created by Kimjaekyeong on 2023/04/30.
//

import SwiftUI

struct FullScreenView: View {
    
    @Binding var isPresented: Bool
    @State var emotionField2: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                TextField("여기에 감정을 써내려가 보세요.", text: $emotionField2)
                          
                Button("Dismiss") {
                    isPresented.toggle()
                }
            }
        }
    }
}


struct FullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenView()
    }
}
