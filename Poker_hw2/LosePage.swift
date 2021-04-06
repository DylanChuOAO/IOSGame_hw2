//
//  LosePage.swift
//  Poker_hw2
//
//  Created by 朱冠儒 on 2021/4/2.
//

import SwiftUI

struct LosePage: View {
    @Binding var showLoseView:Bool
    var body: some View {
        ZStack{
            Color.yellow
            VStack{
                Text("你輸了！！")
                    .font(.custom("Futura-bold", size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .frame(width: 180.0)
                    .padding()
                Button(action: {showLoseView = false}, label: {
                    Text("再來一場")
                        .font(.custom("Futura-bold", size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .frame(width: 180.0)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.red), style: StrokeStyle(lineWidth: 2)))
                })
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct LosePage_Previews: PreviewProvider {
    static var previews: some View {
        LosePage(showLoseView: .constant(true))
    }
}
