import random

# Список слов из 5 букв (можно расширить)
words = ['книга', 'стол', 'окно', 'река', 'море', 'лес', 'город', 'яблоко', 'зима', 'лето', 
         'осень', 'весна', 'дверь', 'окно', 'часы', 'ночь', 'день', 'рука', 'нога', 'голова']

def play_wordle():
    # Выбираем случайное слово
    secret_word = random.choice(words).lower()
    attempts = 6
    
    print("Добро пожаловать в Wordle!")
    print("Угадайте слово из 5 букв")
    print("У вас есть 6 попыток")
    print("Для выхода введите 'выход'")
    print("-" * 30)
    
    for attempt in range(1, attempts + 1):
        while True:
            guess = input(f"Попытка {attempt}: ").lower()
            
            if guess == 'выход':
                print(f"Игра окончена. Загаданное слово: {secret_word}")
                return
            
            if len(guess) != 5:
                print("Слово должно содержать 5 букв!")
                continue
            
            if not guess.isalpha():
                print("Используйте только буквы!")
                continue
            
            break
        
        # Проверяем буквы
        result = []
        for i in range(5):
            if guess[i] == secret_word[i]:
                result.append(f"[{guess[i]}]")  # Буква на правильном месте
            elif guess[i] in secret_word:
                result.append(f"({guess[i]})")  # Буква есть в слове, но не на своем месте
            else:
                result.append(f" {guess[i]} ")  # Буквы нет в слове
        
        # Выводим результат попытки
        print("Результат: " + " ".join(result))
        print("-" * 30)
        
        # Проверяем победу
        if guess == secret_word:
            print(f"Поздравляем! Вы угадали слово '{secret_word}' за {attempt} попыток!")
            return
    
    print(f"Вы проиграли! Загаданное слово было: {secret_word}")

# Запуск игры
if __name__ == "__main__":
    play_wordle()
