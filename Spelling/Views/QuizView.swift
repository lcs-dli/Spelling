//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

enum Outcome: String{
    case undertemined = " "
    case correct = "✅"
    case incorrect = "❌"
}

struct QuizView: View {
    
    // MARK: Stored properties
    @State var currentItem = itemsToSpell.randomElement()!
    @State var userGuess = ""
    @State var currentOutcome : Outcome = .undertemined
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            
            HStack {
                TextField("Enter the name of the item", text: $userGuess)
                    .padding()
                
                Text(currentOutcome.rawValue)
                
            }
            .padding(.horizontal)
            
            HStack{
                Spacer()
                Button(action: {
                    print(checkGuess())
                }, label: {
                    Text("Submit")
                })
            }
        }
        
    }
    //MARK: Function
    func checkGuess(){
        if(currentItem.word == userGuess){
            print("Correct")
            currentOutcome = .correct
        }else{
            print("Incorrect")
            currentOutcome = .incorrect
        }
    }
}

#Preview {
    QuizView()
}
