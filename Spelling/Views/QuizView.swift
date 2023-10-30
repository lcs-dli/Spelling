//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI


struct QuizView: View {
    
    // MARK: Stored properties
    @State var currentItem = itemsToSpell.randomElement()!
    @State var userGuess = ""
    @State var currentOutcome : Outcome = .undertemined

    @State var history: [Result] = []
    // MARK: Computed properties
    var body: some View {
        
        HStack {
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
                        newWord()
                    }, label: {
                        Text("New word")
                    })
                    Button(action: {
                        print(checkGuess())
                    }, label: {
                        Text("Submit")
                    })
                }
            }
            List(filtering(originalList: history, on: .correct)){ currentResult in
                HStack{
                    Image(currentResult.item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    Text(currentResult.guessProvided)
                    
                    Spacer()
                    
                    Text(currentResult.outcome.rawValue)
                }
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
    
    func newWord() {
        //Add current result to the history
        history.insert(
            Result(
                item: currentItem,
                guessProvided: userGuess,
                outcome: currentOutcome
            ),
            at: 0
        )
        
        //Reset the page
        currentItem = itemsToSpell.randomElement()!
        userGuess = ""
        currentOutcome = .undertemined
    }
}

#Preview {
    QuizView()
}
