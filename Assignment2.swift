// author Amin Zeina
// version 1.0
// since 2020-03-10
// This program is a rock, paper, scissors game between the user and the computer.

// Declare variables
var userChoiceWord:String? = nil
var computerChoiceWord:String? = nil
var playAgain:String? = nil
var userChoice:Int = 0
var computerChoice:Int = 0
var winCounter:Int = 0
var lossCounter:Int = 0
var tieCounter:Int = 0
var gameEnded = false


while gameEnded == false {

    // Generate computer's choice
    computerChoice = Int.random(in: 1 ... 3)
    // Get word equivalent to show user what the computer had 
    if computerChoice == 1 {
        computerChoiceWord = "rock"
    } else if computerChoice == 2 {
        computerChoiceWord = "paper"
    } else {
        // If not 1 or 2, must be 3 -> scissors
        computerChoiceWord = "scissors"
    }
    
    // Convert to lower case so any capitalization will be valid 
    print("Enter 'rock', 'paper', or 'scissors': ")
    // Forcing unwrap because checking input in next if else
    userChoiceWord = readLine()!.lowercased()
    
    // Convert user's word to a number value
    if userChoiceWord == "rock" {
        userChoice = 1
    } else if userChoiceWord == "paper" {
        userChoice = 2
    } else if userChoiceWord == "scissors" {
        userChoice = 3
    } else {
        print("Invalid input. Valid inputs are 'rock', 'paper', and 'scissors'.")
        // Restart the loop to get new input 
        continue
    }
    
    if userChoice == computerChoice {
        // User ties
        tieCounter += 1
        print("It's a tie. You chose", userChoiceWord!, "and the computer chose", computerChoiceWord!, ".")
    } else if userChoice - computerChoice == 1 || userChoice - computerChoice == -2 {
        /* 
        User win. The logic used to determine whether user wins or loses is to subtract user's # 
        by computer's #. The only winning cases = -2 and 1. EX: user wins as rock vs scissors 
        (1 - 3 = -2), as paper vs rock (2 - 1 =  1), and as scissors vs paper (3 - 2 = 1).
        */
        winCounter += 1 
        print("You win! You chose", userChoiceWord!, "and the computer chose", computerChoiceWord!, ".")
    } else {
        // User loses, no logic needed because if its not a tie or win, loss is only option
        lossCounter += 1
        print("You lose! You chose", userChoiceWord!, "and the computer chose", computerChoiceWord!, ".")
    }
      
    // Show user their current score
    print("You have", String(winCounter), "win(s),", String(lossCounter), "loss(es), and", String(tieCounter), "tie(s).")
    
    // Ask if user wants to play again
    print("Do you want to play again? (yes/no): ")
    // Convert to lower case so capital Y is valid 
    playAgain = readLine()!.lowercased()
      
    if playAgain == "yes" {
        // User wants to keep playing
        gameEnded = false
    } else {
        // User wants to end the game
        gameEnded = true
    }
} 

print("Program End.")