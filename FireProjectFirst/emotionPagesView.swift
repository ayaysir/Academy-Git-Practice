//
//  emotionPagesView.swift
//  FireProjectFirst
//
//  Created by Kimjaekyeong on 2023/05/03.
//

import SwiftUI


struct emotionPagesView: View {
    
    @State private var offsetY: CGFloat = UIScreen.main.bounds.height
    @State private var isClicked: Bool = false
    @State private var rowY: CGFloat = 0
  
    @State var textfield:String = ""
    // private var QuestionPages = []
    
    var body: some View {
        pageZStack()
    }
}

@ViewBuilder
func pageZStack() -> some View {
    ZStack {
        Image("noteImageYellow")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(0.8)
        
        TextEditor(text: $textfield)
            .foregroundColor(Color("ggray"))
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .padding()
            .frame(width: 400, height: 560)
            .font(.system(size: 11.0))
            .lineSpacing(2.2)
            .offset(y:-7)
        
        Text("Q1. 당신이 지금하고 있는 생각이 사실인가요?")
            .font(.title3)
            .foregroundColor(.white)
            .offset(y:-290)
    }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 400)
}

struct emotionPagesView_Previews: PreviewProvider {
    static var previews: some View {
        emotionPagesView(textfield: "ds")
    }
}
