//
//  QuestionView.swift
//  Country Flag Game
//
//  Created by Devan Myers on 1/8/25.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        VStack(spacing: 20) {
            if gameManager.playingGame
            {
                HStack {
                    Text("Country Flag Game")
                        .foregroundColor(.yellow)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("\(gameManager.index) out of \(gameManager.questions.count)")
                        .foregroundColor(.yellow)
                }
                ProgressBar(progress: gameManager.progress)
                VStack(spacing: 10) {
                    Text("Which country's flag is this?")
                    Image(gameManager.country)
                        .resizable()
                        .frame(width: 300, height: 200)
                    ForEach(gameManager.answerChoices) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(gameManager)
                    }
                }
                Button {
                    gameManager.goToNextQuestion()
                }
                label: {
                    CustomButton(text: "Next", background: gameManager.answerSelected ? .yellow : .gray)
                }
                .disabled(!gameManager.answerSelected)
                
                Spacer()
            }
            else {
                Text("Country Flag Game")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("Congratulations! Youve completed the game!")
                Text("You scored \(gameManager.score) out of \(gameManager.questions.count)")
                Button {
                    gameManager.reset()
                }
                label: {
                    CustomButton(text: "Play Again")
                }
            }
        }
    }
}

#Preview {
    QuestionView()
}
