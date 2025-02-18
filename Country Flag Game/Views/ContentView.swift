//
//  ContentView.swift
//  Country Flag Game
//
//  Created by Devan Myers on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManager()
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 30) {
                    Text("CFG")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text("Ready To Test Your Skills?")
                }
                NavigationLink {
                    QuestionView()
                        .environmentObject(gameManager)
                } label: {
                    CustomButton(text: "Start")
                }
            }
            .foregroundColor(.yellow)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cyan)
        }
    }
}

#Preview {
    ContentView()
}
