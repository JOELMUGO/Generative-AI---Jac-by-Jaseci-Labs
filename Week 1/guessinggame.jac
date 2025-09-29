"""A Number Guessing Game"""

import random;
import from byllm.llm { Model }

# Initialize the LLM model
glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False)

# Provide a fun hint if guess is incorrect
def give_hint(guess: int, correct_number: int) -> str by llm {
    """Give the player a playful hint comparing their guess with the correct number."""
    return f"My guess was {guess}, but the secret number is different. Give me a hint!"
}

walker GuessGame {
    has guess: int;

    can start with entry;
    can process_guess with entry;
}

node turn {
    has correct_number: int = random.randint(1, 10);
}

impl GuessGame {
    can start with entry {
        print("🎮 Welcome to the Number Guessing Game!")
        print("Your guess is: " + str(this.guess))
        take -> turn
    }

    can process_guess with entry {
        if this.guess == here.correct_number {
            print("✅ Correct! The number was " + str(here.correct_number))
        } else {
            print("❌ Wrong guess!")
            print("💡 Hint: " + give_hint(this.guess, here.correct_number))
        }
    }
}

with entry:__main__ {
    root spawn GuessGame(3)
    root spawn GuessGame(7)
}
