YD.CheckDirectories
===================

Сравнивает содержимое двух папок по хэшам (MD5+SHA256) и сообщает каких файлов нет в каждой из них. 
Скрипт может быть полезен для проверки работы папки Фотокамера на клиентах Яндекс.Диска. 

Для настройки необходимо указать папки для сравнения в переменных path_1 и path_2.

Результат работы выглядит следующим образом:

```
Looking into from_w directory..
	Warning! '2013-11-29 14-59-56_1385724631.JPG' is duplicate to '2013-11-29 14-59-56_1385724565.JPG'
	Warning! '2013-11-29 15-00-01_1385723587.JPG' is duplicate to '2013-11-29 15-00-01_1385723522.JPG'
Have found (153) unique files

Looking into from_s directory..
	Warning! 'IMG_0002.JPG' is duplicate to 'IMG_0001.JPG'
Have found (154) unique files

---------------------------------

Comparing from_w with from_s
Comparing completed!

Comparing from_s with from_w
	IMG_0155.MOV not found in from_s
Comparing completed!

---------------------------------

Work completed in 0.594885 seconds

```