//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ferid on 06.05.25.
//

import SwiftUI



struct SimplifedVersionsOfModifiers: ViewModifier{
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 80, maxHeight: 30)
            .background(.green)
            .clipShape(.capsule)
            .foregroundStyle(.black)
            .shadow(radius: 10)
    }
}

extension View {
    func modifier() -> some View{
        modifier(SimplifedVersionsOfModifiers())
    }
}



struct ContentView: View {

    @State private var choices = ["Rock", "Paper", "Scissors"]
    @State private var winningMoves = ["Paper", "Scissors", "Rock"]

    @State private var random = Int.random(in: 0...2)

    @State private var userScore = 0
    @State private var num = 0

    var body: some View {
        ZStack{
            LinearGradient(
            colors: [.brown, .cyan],
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
            VStack(spacing: 30){
                VStack{

                    Text("One of stuff: \(choices[random])")
                }.frame(maxWidth: 200, maxHeight: 40)
                    .background(.yellow)
                    .clipShape(.capsule)
                    .foregroundStyle(.black)

                VStack {

                    ForEach(0...2, id: \.self){ num in
                        Button(winningMoves[num]){
                            buttonTapped(num)
                        }
                    }.modifier()

                }
                VStack{
                    Text("Current score: \(userScore)")
                }
            }
        }.ignoresSafeArea()
    }

    func buttonTapped(_ choiceIndex: Int){

        if choiceIndex == random{
            userScore += 1
        }else{
            userScore -= 1
        }

        random = Int.random(in: 0...2)

        num += 1
        if num == 10{
            userScore = 0
        }
    }

}


#Preview {
    ContentView()
}
