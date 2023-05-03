//
//  ContentView.swift
//  FireProjectFirst
//
//  Created by Kimjaekyeong on 2023/04/30.
//

import Foundation
import SwiftUI
import Lottie
import Charts
import UIKit

//로티뷰 밖으로 뺴고 싶은데 계속 오류남 어케하지??
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

struct ContentView: View {
    
    @State private var offsetY: CGFloat = UIScreen.main.bounds.height
    @State private var isClicked: Bool = false
    @State private var rowY: CGFloat = 0
    //@State private var nextPage
    @State var textfield1:String = ""
    @State var textfield2:String = ""
    @State var textfield3:String = ""
    // private var QuestionPages = []
    
    //배경&페이지 위아래 조절
    @State var ZindexFire: Int = 1
    @State var ZindexPages: Int = 0
    
    //버튼들 투명도 조절
    @State private var PencilbuttonOpacity: Bool = true
    @State private var chevronOpacity: CGFloat = 0.0
    
    //임시저장 페이지 FullscreenView
    @State private var temporaryStoragePagePop: Bool = false
    
    //메인저장 페이지 FullscreenView
    @State private var mainStoragePagePop: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                ZStack{
                    Color.black
                        .ignoresSafeArea()
                    
//                    작업중에는 LottieView 켜두면 느려지니깐 아래 fire 이미지로 바꾸기
                    
                    LottieView(jsonName: "Comp2")
                        .onTapGesture {
                            PencilbuttonOpacity.toggle()

//                    Image("fire")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 500)
//                        .onTapGesture {
//                            PencilbuttonOpacity.toggle()
                        }
//
                    VStack{
                          Button {
                            popPages()
                        } label: {
                            Pencilbutton()
                        }.offset(x: UIScreen.main.bounds.width/2 - 80, y: UIScreen.main.bounds.height/2 - 160)
                       
                }
                }
                .zIndex(Double(ZindexFire))
                
                //PagesView
                //tiggle by popPages()
                HStack {
                    TabView {
                        //반복되는 Z스택 따로 배열로 만들어빼기!!!
                        ZStack{
                            pageZStack1()
                                .scaledToFit()
                                .opacity(0.6)
                            VStack{
                                Text("Q1.")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .offset(y:-290)
                                
                            }}.padding(20)
                    
                        ZStack{
                            pageZStack2()
                                .scaledToFit()
                                .opacity(0.6)
                            VStack{
                                Text("Q2.")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .offset(y:-290)
                            }}.padding(20)
                   
                        ZStack{
                            pageZStack3()
                                .scaledToFit()
                                .opacity(0.6)
                            VStack{
                                Text("Q3.")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .offset(y:-290)
                            }}.padding(20)
                    }.tabViewStyle(.page(indexDisplayMode: .always))
                }.toolbar {
                    //반복되는 ToolbarItem 따로 배열로 만들어 뺴기!!!
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            hidePages()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .opacity(chevronOpacity)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            temporaryStoragePagePop = true
                        }) {
                            Image(systemName: "list.bullet.rectangle.portrait")
                                .foregroundColor(.white)
                                .opacity(chevronOpacity)
                        }
                       .fullScreenCover(isPresented: $temporaryStoragePagePop) {
                           temporaryStorage()
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            hidePages()
                        }) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                                .opacity(chevronOpacity)
                        }
                    }
                }
                .zIndex(Double(ZindexPages))
            }
        }
    }
    

    
    
    //페이지 팝업 버튼
    func popPages() {
        ZindexFire = 0
        ZindexPages = 1
        PencilbuttonOpacity = false
        chevronOpacity = 1.0
    }
    func hidePages() {
        ZindexFire = 1
        ZindexPages = 0
        PencilbuttonOpacity = true
        chevronOpacity = 0.0
    }
    
    
    


    @ViewBuilder
    func Pencilbutton() -> some View{
        Image(systemName: "pencil.circle")
            .resizable()
            .scaledToFit()
            .frame(width: 90)
            .foregroundColor(.gray)
            .opacity(PencilbuttonOpacity == true ? 1.0 : 0.0)
    }
    
    @ViewBuilder
    func pageZStack1() -> some View {
        ZStack {
            Color(.black)
            Image("noteImageYellow")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.8)

            TextEditor(text: $textfield1)
                .foregroundColor(Color("ggray"))
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .padding()
                .frame(width: 400, height: 560)
                .font(.system(size: 11.0))
                .lineSpacing(2.2)
                .offset(y:-7)

            
        }.foregroundColor(.black)
            
    }
    
    @ViewBuilder
    func pageZStack2() -> some View {
        ZStack {
            Color(.black)
            Image("noteImageYellow")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.8)

            TextEditor(text: $textfield2)
                .foregroundColor(Color("ggray"))
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .padding()
                .frame(width: 400, height: 560)
                .font(.system(size: 11.0))
                .lineSpacing(2.2)
                .offset(y:-7)

            
        }.foregroundColor(.black)
            
    }

    @ViewBuilder
    func pageZStack3() -> some View {
        ZStack {
            Color(.black)
            Image("noteImageYellow")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.8)

            TextEditor(text: $textfield3)
                .foregroundColor(Color("ggray"))
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .padding()
                .frame(width: 400, height: 560)
                .font(.system(size: 11.0))
                .lineSpacing(2.2)
                .offset(y:-7)

            
        }.foregroundColor(.black)
            
    }

    @ViewBuilder
    func temporaryStorage() -> some View{
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                HStack{
                    Button(action: {
                        temporaryStoragePagePop = false
    
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .opacity(chevronOpacity)
    
                    }
                    Spacer()
                }
                Spacer()
            }
            VStack(spacing: 4) {
                Spacer()
                Image("chartImage")
                    .resizable()
                    .scaledToFit()
    
           //
    
                                   Divider()
    //                                        .background(Color.white)
    
                MainHistoryListView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                // Spacer()
            }.foregroundColor(.white)
    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//@ViewBuilder
//func temporaryStorage() -> some View{
//    ZStack{
//        Color.black.ignoresSafeArea()
//        VStack {
//            HStack{
//                Button(action: {
//                    temporaryStoragePagePop = false
//
//                }) {
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(.white)
//                        .opacity(chevronOpacity)
//
//                }
//                Spacer()
//            }
//            Spacer()
//        }
//        VStack(spacing: 4) {
//            Spacer()
//            Image("chartImage")
//                .resizable()
//                .scaledToFit()
//
//       //
//
//                               Divider()
////                                        .background(Color.white)
//
//            MainHistoryListView()
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
//            // Spacer()
//        }.foregroundColor(.white)
//
//    }
//}

//    pageZStack().offset(y: rowY + 1000)
//                .animation(.easeOut(duration: 2), value: isClicked)
//
//            pageZStack().offset(y: rowY + 2000)
//                .animation(.easeOut(duration: 2), value: isClicked)
//
//            pageZStack().offset(y: rowY + 3000)
//                .animation(.easeOut(duration: 2), value: isClicked)
//
//            pageZStack().offset(y: rowY + 4000)
//                .animation(.easeOut(duration: 2), value: isClicked)
//
//            HStack{
//                Button {
//                    takePrePage()
//                    isClicked.toggle()
//                } label: {
//                    Text("이전")
//                        .padding(20)
//                        .font(.title3)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .cornerRadius(14)
//                }
//
//                Button {
//                    takeNextPage()
//                    isClicked.toggle()
//                } label: {
//                    Text("다음")
//                        .padding(20)
//                        .font(.title3)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .cornerRadius(14)
//                }
//            }
//            .offset(y: 300)

//    func takePrePage() {
//        if rowY < 0 {
//            rowY += 1000}
//    }
//
//    func takeNextPage() {
//        if rowY > -4000 {
//            rowY -= 1000
//        }
//    }
