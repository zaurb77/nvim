#!/usr/bin/env python3
import random

#for word in word_list:
#    print(word)


word_list = ["aardvark", "baboon", "camel"]
chosen_word =random.choice(word_list)

print("Welcome to Hangman game!")
print("The chosen word is:")
print(chosen_word)

placeholder = []

placeholder_string = ""
for l in range(len(chosen_word)):
    placeholder.append("-")
    placeholder_string += "-"

print(placeholder_string)

# TODO-1: - Use a while loop to let the user guess again.
game_over = False

while not game_over:
    guess = input("Try to guess a letter: ").lower()

# TODO-2: Change the for loop so that you keep the previous correct letters in display.

    for i in range(len(chosen_word)):
        if chosen_word[i] == guess:
            placeholder[i] = guess
            guess=""

    if "-" not in placeholder:
        game_over = True
    print("".join(placeholder))

print("You win!")

