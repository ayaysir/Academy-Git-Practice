//
//  HistoryListView.swift
//  FireProjectFirst
//
//  Created by Kimjaekyeong on 2023/05/04.
//

import SwiftUI

struct MainHistoryListView: View {
    var body: some View {
        ZStack{
            
            List{
                GroupBox(label: Text("1").font(.title3)) {
                    Text("오늘은 어쩌구 ada저쩌구 힘들었다")
                }
                GroupBox(label: Text("2").font(.title3)) {
                    Text("오늘은 어쩌구 저쩌구 힘들었다")
                }
                GroupBox(label: Text("2").font(.title3)) {
                    Text("오늘은 어쩌구 저쩌구 힘들었다")
                }
            }.foregroundColor(.gray)
        }

    }
}

struct MainHistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        MainHistoryListView()
    }
}
