//
//  ContentView.swift
//  Poker_hw2
//
//  Created by 朱冠儒 on 2021/3/25.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    Text("99")
                        .font(.custom("Nagurigaki-Crayon", size: 45))
                        .foregroundColor(.pink)
                        .multilineTextAlignment(.center)
                        .padding(.top, -70.0)
                    Text("Nine-Nine")
                        .font(.custom("Nagurigaki-Crayon", size: 45))
                        .offset(y:-30)
                        .foregroundColor(.pink)
                        .multilineTextAlignment(.center)
                        .padding()
                }.padding()
                Text("HI Player 1!")
                    .font(.custom("Nagurigaki-Crayon", size: 30))
                    .foregroundColor(Color.black)
                    .opacity(0.8)
                    .padding(.top, -55.0)
                Spacer()
                NavigationLink(
                    destination:GamePage(showContentView: .constant(true))){
                    Text("Start")
                        .font(.custom("Futura-bold", size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.center)
                        .frame(width: 100.0)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 100/255, green: 149/255, blue: 230/255), style: StrokeStyle(lineWidth: 2)))
                    
                }
                Link(destination: URL(string: "https://zh.wikipedia.org/wiki/九九_(撲克牌)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")!, label:
                        {
                            Text("Rule")
                                .font(.custom("Futura-bold",size:35))
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 233/255, green: 150/255, blue: 160/255, opacity: 1.0))
                                .multilineTextAlignment(.center)
                                .frame(width: 100, height: 45, alignment: .center)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(red: 233/255, green: 150/255, blue: 160/255), style: StrokeStyle(lineWidth: 2)))
                                .padding()
                        })
            }
            .background(Image("casino_chip").resizable()
                            .opacity(0.4)
                            .scaledToFit()
                            .edgesIgnoringSafeArea(.all))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
