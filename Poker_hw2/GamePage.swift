//
//  GamePage.swift
//  Poker_hw2
//
//  Created by 朱冠儒 on 2021/3/25.
//

import SwiftUI

struct ComCardShow: View {
    var body:some View{
        Image("card_back")
            .resizable()
            .background(Color.white)
            .frame(width:70, height:130)
            .scaledToFit()
    }
}

var cards = [Card]() //牌庫初始化
var computerCard = [Card]() //電腦1
var playerCard = [Card]() //玩家
var count = 10 //已發了幾張
let suits = ["club","diamond","heart","spade"]
let ranks = ["1","2","3","4","5","6","7","8","9","10","11","12","13"]
func createCards() -> [Card] { //建牌 洗牌
    for suit in suits{
        for rank in ranks{
            var card = Card()
            card.suit = suit
            card.rank = rank
            cards.append(card)
        }
    }
    cards.shuffle()
    return cards
}

func creatPlayerCards()->[Card]{
    playerCard.append(contentsOf: cards[0...10])
    //0~4player 5~9computer
    count = 10
    return playerCard
}

func shuffleCard()->[Card]{
    cards.shuffle()
    for index in 0...10 {
        playerCard[index] = cards[index]
    }
    return playerCard
}


struct GamePage: View {
    @Binding var showContentView:Bool
    @State private var showWinView = false
    @State private var showLoseView = false
    @State private var showGameOverView = false
    @State private var coin = 1
    @State private var win = 0
    @State private var result = 0
    @State private var round = 0
    @State private var point = 0 //99的點數
    
    @State private var choose20 = true
    @State private var choose10 = true
    @State private var gameStart = false
    
    func addCard(count:inout Int, x:Int)->(Card){
        playerCard[x] = cards[count]
        count += 1
        return (playerCard[x])
    }
    func check(count: inout Int, point: inout Int,x:Int)->([Card],Int){
        if count == 51 {
            count = 0
            cards.shuffle()
        }
        if x != 5{
            if point > 99{ //99爆了
                coin-=100
                if coin == 0{
                    showGameOverView = true
                }
                else{
                    point = 0
                    count = 10
                    shuffleCard()
                    showLoseView = true
                    gameStart = false //重新開始
                }
            }
        }
        else{
            if point > 99{
                coin+=100
                point = 0
                count = 10
                shuffleCard()
                gameStart = false
                showWinView = true //贏了
            }
        }
        return(cards,win)
    }
    func game_ninenine(x:Int){ //判定數字
        playerCard[10] = playerCard[x]
        gameStart = true
        switch playerCard[x].rank {
        case "1":
            if playerCard[x].suit == "spade"{//黑桃A 歸零
                point = 0
            }
            else{
                point += 1
            }
        case "2":
            point += 2
        case "3":
            point += 3
        case "4":
            break
        case "5":
            break
        case "6":
            point += 6
        case "7":
            point += 7
        case "8":
            point += 8
        case "9":
            point += 9
        case "10":
            if x == 5 {
                point += 10
            }
            else{
                choose10 = false
            }
        case "11":
            break
        case "12":
            if x == 5 {
                point+=20
            }
            else{
                choose20 = false
            }
        case "13":
            point = 99
        default:
            point += 0
        }
    }
    func computerAdd() {
        game_ninenine(x: 5)
        addCard(count: &count, x: 5)
    }
    func overCard(x: Int) -> Card {
        playerCard[10] = playerCard[x]
        return playerCard[10]
    }
    var body: some View {
        if coin == 1{
            ZStack{
                Image("snow")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.7)
                VStack{
                    Text("Choose Your Coin")
                        .font(.custom("Futura-bold", size: 35))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .overlay(
                            Rectangle()
                                .stroke(Color.black, lineWidth: 5))
                        .padding()
                    Button(action: {coin = 100
                        createCards()
                        creatPlayerCards()
                    }, label: {
                        Text("100")
                            .font(.custom("Futura-bold", size: 45))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: 100.0)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: 2)))
                            .padding()
                    })
                    Button(action: {coin = 300
                        createCards()
                        creatPlayerCards()
                    }, label: {
                        Text("300")
                            .font(.custom("Futura-bold", size: 45))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: 100.0)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: 2)))
                            .padding()
                    })
                    Button(action: {coin = 500
                        createCards()
                        creatPlayerCards()
                    }, label: {
                        Text("500")
                            .font(.custom("Futura-bold", size: 45))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .frame(width: 100.0)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, style: StrokeStyle(lineWidth: 2)))
                            .padding()
                    })
                }
            }
        }
        else{
            ZStack{
                Image("snow")
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.7)
                VStack{
                    Text("Com 1")
                        .font(.custom("Futura-bold", size: 45))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                        .frame(width: 200.0)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.purple, style: StrokeStyle(lineWidth: 2)))
                    .padding()
                    HStack{
                        ComCardShow()
                        ComCardShow()
                        ComCardShow()
                        ComCardShow()
                        ComCardShow()
                    }
                    Text("剩\(52-count)張牌")
                        .font(.custom("Futura-bold", size: 35))
                    Text("Your coin:\(coin)")
                        .font(.custom("Futura-bold", size: 35))
                    Text("Point:\(point)")
                        .font(.custom("Futura-bold", size: 35))
                    HStack(){
                        ComCardShow()      //公共牌
                        if gameStart {
                            Image(playerCard[10].suit+"_"+playerCard[10].rank)
                                .resizable()
                                .background(Color.white)
                                .frame(width: 70, height:130)
                                .scaledToFit()
                        }      //最後打出的牌
                    }
                    Spacer()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Text("Player 1")
                        .font(.custom("Futura-bold", size: 45))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.purple)
                        .multilineTextAlignment(.center)
                        .frame(width: 250.0)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.purple, style: StrokeStyle(lineWidth: 2)))
                    HStack{
                        Button(action: {game_ninenine(x: 0)
                            addCard(count: &count, x: 0)
                            check(count: &count, point: &point, x: 0)
                            if choose10 && choose20 {
                                computerAdd()
                                check(count: &count,point: &point,x: 5)
                            }
                        },label: {
                            Image(playerCard[0].suit+"_"+playerCard[0].rank)
                                .resizable()
                                .background(Color.white)
                                .frame(width: 70, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                        })
                        Button(action: {game_ninenine(x: 1)
                            addCard(count: &count, x: 1)
                            check(count: &count, point: &point, x: 1)
                            if choose10 && choose20 {
                                computerAdd()
                                check(count: &count,point: &point,x: 5)
                            }
                        },label: {
                            Image(playerCard[1].suit+"_"+playerCard[1].rank)
                                .resizable()
                                .background(Color.white)
                                .frame(width: 70, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                        })
                        Button(action: {game_ninenine(x: 2)
                            addCard(count: &count, x: 2)
                            check(count: &count, point: &point, x: 2)
                            if choose10 && choose20 {
                                computerAdd()
                                check(count: &count,point: &point,x: 5)
                            }
                        },label: {
                            Image(playerCard[2].suit+"_"+playerCard[2].rank)
                                .resizable()
                                .background(Color.white)
                                .frame(width: 70, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                        })
                        Button(action: {game_ninenine(x: 3)
                            addCard(count: &count, x: 3)
                            check(count: &count, point: &point, x: 5)
                            if choose10 && choose20 {
                                computerAdd()
                                check(count: &count,point: &point,x: 3)
                            }
                        },label: {
                            Image(playerCard[3].suit+"_"+playerCard[3].rank)
                                .resizable()
                                .background(Color.white)
                                .frame(width: 70, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                        })
                        Button(action: {game_ninenine(x: 4)
                            addCard(count: &count, x: 4)
                            check(count: &count, point: &point, x: 4)
                            if choose10 && choose20 {
                                computerAdd()
                                check(count: &count,point: &point,x: 5)
                            }
                        },label: {
                            Image(playerCard[4].suit+"_"+playerCard[4].rank)
                                .resizable()
                                .background(Color.white)
                                .frame(width: 70, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .scaledToFit()
                        })
                    }
                    .padding()
                }
                if choose20 == false{
                    HStack{
                        Button(action: {choose20 = true
                            point+=20
                            check(count: &count, point: &point, x: 0)
                            computerAdd()
                            check(count: &count,point: &point,x: 5)
                        }, label: {
                            Text("+20")
                                .font(.custom("Futura-bold", size: 55))
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                                .multilineTextAlignment(.center)
                                .frame(width: 150.0)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.systemPink), style: StrokeStyle(lineWidth: 2)))
                        })
                        Button(action: {choose20 = true
                            point-=20
                            if point < 0{
                                point = 0
                            }
                            check(count: &count, point: &point, x: 0)
                            computerAdd()
                            check(count: &count,point: &point,x: 5)
                        }, label: {
                            Text("-20")
                                .font(.custom("Futura-bold", size: 55))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .multilineTextAlignment(.center)
                                .frame(width: 150.0)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.blue), style: StrokeStyle(lineWidth: 2)))
                        })
                    }
                }
                if choose10 == false{
                    HStack{
                        Button(action: {choose10 = true
                            point+=10
                            check(count: &count, point: &point, x: 0)
                            computerAdd()
                            check(count: &count,point: &point,x: 5)
                        }, label: {
                            Text("+10")
                                .font(.custom("Futura-bold", size: 55))
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                                .multilineTextAlignment(.center)
                                .frame(width: 150.0)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.systemPink), style: StrokeStyle(lineWidth: 2)))
                        })
                        Button(action: {choose10 = true
                            point-=10
                            if point < 0{
                                point = 0
                            }
                            check(count: &count, point: &point, x: 0)
                            computerAdd()
                            check(count: &count,point: &point,x: 5)
                        }, label: {
                            Text("-10")
                                .font(.custom("Futura-bold", size: 55))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .multilineTextAlignment(.center)
                                .frame(width: 150.0)
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(.blue), style: StrokeStyle(lineWidth: 2)))
                        })
                    }
                }
                EmptyView().sheet(isPresented: $showLoseView, content: {LosePage(showLoseView: $showLoseView)})
                EmptyView().sheet(isPresented: $showWinView, content: {WinPage(showWinView: $showWinView)})
                EmptyView().sheet(isPresented: $showGameOverView, content: {GameOverPage(showGameOverView: $showGameOverView)})
            }
        }
    }
}
struct GamePage_Previews: PreviewProvider {
    static var previews: some View {
        GamePage(showContentView: .constant(true))
    }
}

