//
//  TemporaryStorageView.swift
//  FireProjectFirst
//
//  Created by Kimjaekyeong on 2023/05/04.
//

import SwiftUI

struct TemporaryStorageView: View {
    
    @State private var temporaryStoragePagePop: Bool = false
    @State private var chevronOpacity: CGFloat = 0.0
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                HStack{
                    Button(action: {
                        temporaryStoragePagePop = false
                        
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 60)
                            .foregroundColor(.white)
                            .opacity(chevronOpacity)
                            
                    }
//                    Spacer()
                }
//                Spacer()
            }
//            VStack(spacing: 4) {
//                Spacer()
//                Image("chartImage")
//                    .resizable()
//                    .scaledToFit()
//
//           //
//
//                                   Divider()
////                                        .background(Color.white)
//
//                MainHistoryListView()
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
//                // Spacer()
//            }.foregroundColor(.white)
               
        }
    }
}

struct TemporaryStorageView_Previews: PreviewProvider {
    static var previews: some View {
        TemporaryStorageView()
    }
}
