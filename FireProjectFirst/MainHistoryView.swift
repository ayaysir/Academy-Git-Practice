//
//  MainHistoryView.swift
//  FireProjectFirst
//
//  Created by Kimjaekyeong on 2023/05/04.
//

import SwiftUI

struct MainHistoryView: View {
    var body: some View {
        ZStack{
            List{
                GroupBox(label: Text("1").font(.title3)) {
                    Text("불태운 내용")
                }
                GroupBox(label: Text("2").font(.title3)) {
                    Text("불태운 내용")
                }
                GroupBox(label: Text("2").font(.title3)) {
                    Text("불태운 내용")
                }
            }.foregroundColor(.gray)
        }

    }
}

struct MainHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MainHistoryView()
    }
}
