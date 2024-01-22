import sys

from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import (QCoreApplication, QPropertyAnimation, QDate,
                          QDateTime, QMetaObject, QObject, QPoint, QRect,
                          QSize, QTime, QTimer, QUrl, Qt, QEvent, QRegExp)
from PyQt5.QtGui import (QBrush, QColor, QConicalGradient, QCursor, QFont,
                         QFontDatabase, QIcon, QKeySequence, QLinearGradient,
                         QPalette, QPainter, QPixmap, QRadialGradient, QRegExpValidator)
from PyQt5.QtWidgets import *   

from login import Ui_LoginWindow # Подключение к файлу login.py

import mysql.connector as mc
from main_director import Ui_DirectorMainWindow
from main_staff import Ui_StaffMainWindow

mydb = mc.connect(
    host="localhost",
    user="root",
    password="",
    database="club"
)

mycursor = mydb.cursor()

class MainWindow(QMainWindow):

    def __init__(self, parent=None):
        QMainWindow.__init__(self)
        self.ui = Ui_LoginWindow()
        self.ui.setupUi(self)

        self.ui.enter.clicked.connect(self.BDLogin)
        self.ui.login.textChanged.connect(self.login_ogr)
        self.ui.password.textChanged.connect(self.password_ogr)

    
    def BDLogin(self):
        
        login = self.ui.login.text()
        password = self.ui.password.text()
 
        query = "SELECT login, password from admin where login like '"+ login + "'and password like '" + password + "'"
        mycursor.execute(query)
        result = mycursor.fetchone()
        mydb.commit()
            
        if len(login) == 0:
            self.ui.label.setText("Введите логин")
            return
                
        if len(password) == 0:
            self.ui.label.setText("Введите пароль")
            return

        if result == None:
            self.ui.label.setText("Вы не правильно ввели логин или пароль!")
                
        elif login == "admin" and password == "admin666":
            self.window1 = QtWidgets.QMainWindow()
            self.ui = Ui_DirectorMainWindow()
            self.ui.setupUi(self.window1)
            self.window1.show()
            self.close()     

        else:
            self.window1 = QtWidgets.QMainWindow()
            self.ui = Ui_StaffMainWindow()
            self.ui.setupUi(self.window1)
            self.window1.show()
            self.close()

    def login_ogr(self):
        reg_ex = QRegExp("[a-zA-Z_0-9]{20}")
        input_validator = QRegExpValidator(reg_ex, self.ui.login)
        self.ui.login.setValidator(input_validator)

    def password_ogr(self):
        reg_ex = QRegExp("[a-zA-Z_0-9]{15}")
        input_validator = QRegExpValidator(reg_ex, self.ui.password)
        self.ui.password.setValidator(input_validator)
        
# END
if __name__ == "__main__":
    app = QApplication(sys.argv)

    id = QFontDatabase.addApplicationFont('fonts\Montserrat-VariableFont_wght.ttf')
    
    # Если id равен -1, то шрифт не установлен
    if id == -1:
        print('Шрифт Montserrat не установлен')
    else:
        print("Шрифт Montserrat установлен")

    window = MainWindow()
    window.show()
    sys.exit(app.exec_())