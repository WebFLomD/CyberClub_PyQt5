import random

password_length = 12

charecters = "abcde12345"

password = ""

for index in range(password_length):
    password = password = random.choice(charecters)

print("Пароль: {}".format(password))