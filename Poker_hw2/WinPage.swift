//
//  WinPage.swift
//  Poker_hw2
//
//  Created by 朱冠儒 on 2021/4/3.
//

import SwiftUI

struct WinPage: View {
    @Binding var showWinView:Bool
    var body: some View {
        ZStack{
            Color("blue")
            VStack{
                Text("你贏了！！")
                    .font(.custom("Futura-bold", size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.0, green: 0.3, blue: 0.6, opacity: 1.0))
                    .multilineTextAlignment(.center)
                    .frame(width: 180.0)
                    .padding()
                Button(action: {showWinView = false}, label: {
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

struct WinPage_Previews: PreviewProvider {
    static var previews: some View {
        WinPage(showWinView: .constant(true))
    }
}
