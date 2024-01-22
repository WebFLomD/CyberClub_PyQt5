from PyQt5.QtCore import QDateTime,QDate, QTime, Qt

datetime = QDateTime.currentDateTime()

print(datetime.toString())

date = QDate.currentDate()

print(date.toString(Qt.ISODate))

time = QTime.currentTime()

print(time.toString())