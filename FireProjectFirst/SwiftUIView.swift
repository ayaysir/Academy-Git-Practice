//
//  SwiftUIView.swift
//  FireProjectFirst
//
//  Created by Kimjaekyeong on 2023/05/03.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
       
        ZStack{
            VStack{
                List{
                    GroupBox(label: Text("1")) {
                        Text("dfdfdsafasdfdadasfdsakfjasd;fsdajfklajdsfkdjssadlfkjlsdakfjdlssf(n/)dsafaf")
                    }
                    GroupBox(label: Text("2")) {
                        Text("dfdfdsafasdfdadasfdsakfjasd;fsdajfklajdsfkdjssadlfkjlsdakfjdlssf(n/)dsafaf")
                    }
                    GroupBox(label: Text("2")) {
                        Text("dfdfdsafasdfdadasfdsakfjasd;fsdajfklajdsfkdjssadlfkjlsdakfjdlssf(n/)dsafaf")
                    }
                }.foregroundColor(.blue)
                
                List{
                    
                    Text("dfdfdsafasdfdadasfdsakfjasd;fsdajfklajdsfkdjssadlfkjlsdakfjdlssf(n/)dsafaf")
                    Text("dfdfdsafasdfdadasfdsakfjasd;fsdajfklajdsfkdjssadlfkjlsdakfjdlssf(n/)dsafaf")
                    Text("dfdfdsafasdfdadasfdsakfjasd;fsdajfklajdsfkdjssadlfkjlsdakfjdlssf(n/)dsafaf")
                
                }.background(Color.blue)
                
            }
        }
                    }
                }
        

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
