import sys
import pymysql
from config import host, user, password, db_name
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import *
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtGui import QIcon

import ui_reg
import ui_login
from main import MainWindow
from mainu import MainWindowu



connection = pymysql.connect(
    host=host,
    port=3306,
    user=user,
    password=password,
    database=db_name,
    cursorclass=pymysql.cursors.DictCursor
)
print("Sucsess")
cursor = connection.cursor()


class Registration(QtWidgets.QMainWindow, ui_reg.Ui_MainWindow):

    def __init__(self):
        super(Registration, self).__init__()
        self.setupUi(self)

        self.Reg_Button.clicked.connect(self.reg)
        self.Back_button.clicked.connect(self.login)

    def login(self):
        self.login = Login()
        self.login.show()
        self.login.setWindowIcon(QIcon("JapanMaster.png"))
        self.login.setWindowTitle('JapanMaster - Вход')
        self.hide()


    def reg(self):
        user_name = self.Line_Fio.text()
        user_password = self.Line_Pass.text()
        user_email = self.Line_Email.text()

        if len(user_name) == 0:
            self.tryy.setText("")
            self.tryy.setText("Введите ФИО")
            return
            
        if len(user_password) == 0:
            self.tryy.setText("")
            self.tryy.setText("Введите пароль")
            return

        if len(user_email) == 0:
            self.tryy.setText("")
            self.tryy.setText("Введите почту")
            return
 
        cursor.execute(f'SELECT name FROM `users` WHERE name="{user_name}"')
        if cursor.fetchone() is None:
            cursor.execute(f'INSERT INTO `users` (name, password, email) VALUES ("{user_name}", "{user_password}", "{user_email}")')
            self.tryy.setText("")
            self.tryy.setText("Успешная регистрация")
            connection.commit()
        else:
            self.tryy.setText("")
            self.tryy.setText("Такая запись уже есть")

class Login(QtWidgets.QMainWindow, ui_login.Ui_MainWindow):
    def __init__(self):
        super(Login, self).__init__()
        self.setupUi(self)

        self.Log_Button.clicked.connect(self.login)
        self.Back_button_reg.clicked.connect(self.reg)
    
    def reg(self):
        self.reg = Registration()
        self.reg.show()
        self.reg.setWindowIcon(QIcon("JapanMaster.png"))
        self.reg.setWindowTitle('JapanMaster - Регистрация')
        self.close()
    
    def login(self):
        user_email = self.Line_Email_3.text()
        user_password = self.Line_Pass_3.text()

        
        if len(user_email) == 0:
            self.tryy_l.setText("")
            self.tryy_l.setText("Введите почту")
            return
            
        if len(user_password) == 0:
            self.tryy_l.setText("")
            self.tryy_l.setText("Введите пароль")
            return

        cursor.execute(f'SELECT * FROM `users`')
        check_name = cursor.fetchall()
        
        for row in check_name:
            if user_email == "admin@admin" and user_password == "Admin":
                self.login = MainWindow()
                self.login.setWindowTitle('JapanMaster')
                self.login.setWindowIcon(QIcon("JapanMaster.png"))
                self.login.show()
                self.close()
                break
            elif row["email"] == user_email and row["password"] == user_password:
                print('Успешная авторизация')
                self.login = MainWindowu()
                self.login.setWindowTitle('JapanMaster')
                self.login.setWindowIcon(QIcon("JapanMaster.png"))
                self.login.show()
                self.close()
                break
            else:
                self.tryy_l.setText("")
                self.tryy_l.setText("Неправильная почта или пароль")
        

App = QtWidgets.QApplication([])
window = Login()
window.show()
window.setWindowIcon(QIcon("JapanMaster.png"))
window.setWindowTitle('JapanMaster - Вход')
App.exec()



