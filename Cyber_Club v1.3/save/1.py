import sys

#ОБЯЗАТЕЛЬНОЕ ПОДКЛЮЧЕНИЕ
from PyQt5.QtWidgets import QApplication,  QLineEdit , QWidget ,  QFormLayout
from PyQt5.QtGui import QIntValidator, QDoubleValidator, QRegExpValidator 
from PyQt5.QtCore import QRegExp 

class LineEditDemo(QWidget):
    def __init__(self, parent=None):
        super(LineEditDemo, self).__init__(parent)
        self.setWindowTitle("Пример проверки QLineEdit в PyQt5")

        flo = QFormLayout()
        pIntLineEdit        = QLineEdit()
        pDoubleLineEdit     = QLineEdit()
        pValidatorLineEdit  = QLineEdit()

        flo.addRow("Цылые числа",         pIntLineEdit)
        flo.addRow("Тип плавающей точки", pDoubleLineEdit)
        flo.addRow("Буквы и цыфры",       pValidatorLineEdit)

        pIntLineEdit.setPlaceholderText("Цылые числа: `[1, 99]`");
        pDoubleLineEdit.setPlaceholderText("Тип плавающей точки: `123,12`");
        pValidatorLineEdit.setPlaceholderText("Буквы и цыфры: `[а-яА-Я0-9]{20}`");

        # QIntValidator предоставляет валидатор, который гарантирует, что строка содержит 
        # допустимое целое число в указанном диапазоне [1, 99].
        pIntValidator = QIntValidator(self)
        pIntValidator.setRange(1, 10000)

        # QDoubleValidator обеспечивает проверку диапазона чисел с плавающей запятой.
        pDoubleValidator = QDoubleValidator(self)
        pDoubleValidator.setRange(-360, 360)
        pDoubleValidator.setNotation(QDoubleValidator.StandardNotation)
        pDoubleValidator.setDecimals(2)

#############################

        # ВОТ ОНО ОГРАНИЧЕНИЕ СИМВОЛОВ НАШЕЛ 
        reg = QRegExp("[0-9:+.() ]{100}")
        pValidator = QRegExpValidator(self)
        pValidator.setRegExp(reg)
        
        #УСТАНОВКА ВАЛИДАТОР
        pValidatorLineEdit.setValidator(pValidator)   
        
#############################

        # Установить валидатор
        pIntLineEdit.setValidator(pIntValidator)
        pDoubleLineEdit.setValidator(pDoubleValidator)
        

        self.setLayout(flo)                        

if __name__ == "__main__":       
    app = QApplication(sys.argv)
    win = LineEditDemo()    
    win.show()  
    sys.exit(app.exec_())