//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by PiyushP on 6/6/25.
//

import SwiftUI
struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Italy", "Ireland", "Nigeria", "Spain", "Sweden", "UK", "US"].shuffled()
    @State private var randomized = Int.random(in: 0..<3)
    
    @State private var showAlert = false
    @State private var showMessage = ""
    
    @State private var score = 0
    
    var body: some View{
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: 30){
                VStack{
                    Text("Click the country of the ")
                        .foregroundStyle(.white)
                    Text(countries[randomized])
                        .foregroundStyle(.white)
                }
                ForEach(0..<3){number in
                    Button(){
                        buttonPressed(number)
                    } label:{
                        Image(countries[number])
                            
                    }
                }
            }
        }
        .alert(showMessage, isPresented: $showAlert){
            Button("Continue", action: askQuestion)
        } message:
        {
            Text("Your score is \(score)")
        }
        
    }
    func buttonPressed(_ number: Int){
        if(number == randomized){
            showMessage = "Correct"
            score += 1
        }
        else{
            showMessage = "Incorrect thats the flag of \(countries[number])"
        }
        showAlert = true
                
    }
    func askQuestion(){
        countries.shuffle()
        randomized = Int.random(in: 0..<3)
    }
    
}

#Preview {
    ContentView()
}
