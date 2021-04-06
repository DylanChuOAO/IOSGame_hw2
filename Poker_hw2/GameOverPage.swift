//
//  GameOverPage.swift
//  Poker_hw2
//
//  Created by 朱冠儒 on 2021/4/3.
//

import SwiftUI

struct GameOverPage: View {
    @State private var showContentView = false
    @Binding var showGameOverView:Bool
    var body: some View {
        ZStack{
            Image("card_joker")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.3)
            VStack{
                Text("GameOver 錢錢花光囉0.0")
                    .font(.custom("Futura-bold", size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .frame(width: 240.0)
                    .padding(.bottom, 300.0)
                Button(action: {showGameOverView = false}, label: {
                    Text("我要報仇👊👊")
                        .font(.custom("Futura-bold", size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .frame(width: 220.0)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.red), style: StrokeStyle(lineWidth: 2)))
                        .padding(.bottom, -40.0)
                })
            }
        }
        .fullScreenCover(isPresented: $showContentView, content: {
            ContentView()
        })
    }
}

struct GameOverPage_Previews: PreviewProvider {
    static var previews: some View {
        GameOverPage(showGameOverView: .constant(true))
    }
}
