////
////  pageView.swift
////  FireProjectFirst
////
////  Created by Kimjaekyeong on 2023/04/30.
////
//
//import SwiftUI
//
//struct pageView: View {
//    
//    @State private var offsetY: CGFloat = UIScreen.main.bounds.height
//    @State private var isClicked: Bool = false
//    @State private var rowY: CGFloat = 0
//    //@State private var nextPage
//    @State var textfield:String = ""
//   // private var QuestionPages = []
//    
//    var body: some View {
//        ZStack{
//            Color.black
//                .ignoresSafeArea()
//            
//            Image("fire")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 500)
//                .zIndex(0)
//            
//            pageZStack().offset(y: rowY - 2000)
//                .animation(.easeOut(duration: 2), value: isClicked)
//            pageZStack().offset(y: rowY - 4000)
//                .animation(.easeOut(duration: 2), value: isClicked)
//            pageZStack().offset(y: rowY - 6000)
//                .animation(.easeOut(duration: 2), value: isClicked)
//            pageZStack().offset(y: rowY - 8000)
//                .animation(.easeOut(duration: 2), value: isClicked)
//            
//            HStack{
//                Button {
//                    takeNextPage()
//                    isClicked.toggle()
//                } label: {
//                    Text("이전")
//                        .padding(20)
//                        .font(.title3)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .cornerRadius(14)
//                        .offset(y: 300)
//                }
//                
//                Button {
//                    takePrePage()
//                    isClicked.toggle()
//                } label: {
//                    Text("다음")
//                        .padding(20)
//                        .font(.title3)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .cornerRadius(14)
//                        .offset(y: 300)
//                }
//            }
//            .zIndex(1)
//        }
//    }
//    
//    func takeNextPage() {
//        rowY += 2000
//    }
//    
//    func takePrePage() {
//        rowY -= 2000
//    }
//    
//    @ViewBuilder
//    func pageZStack() -> some View {
//        ZStack {
//            Image("noteImageYellow")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .opacity(0.8)
//            
//            TextEditor(text: $textfield)
//                .foregroundColor(Color("ggray"))
//                .scrollContentBackground(.hidden)
//                .background(Color.clear)
//                .padding()
//                .frame(width: 400, height: 560)
//                .font(.system(size: 11.0))
//                .lineSpacing(2.2)
//                .offset(y:-7)
//            
//            Text("Q1. 당신이 지금하고 있는 생각이 사실인가요?")
//                    .font(.title3)
//                    .foregroundColor(.white)
//                    .offset(y:-290)
//        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 400)
//    }
//}
//
//
//
//
//struct pageView_preview: PreviewProvider {
//    static var previews: some View {
//        pageView()
//    }
//}
