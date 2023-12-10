## Part 1. Настройка gitlab-runner  
#### Поднимаем виртуальную машину  
![Part_1_1.jpg](screenshots/1_1.png)  

#### Скачиваем и устанавливаем gitlab-runner  
![Part_1_2.jpg](screenshots/1_2.png)  
Получаем ошибку, которая показана на следующем скриншоте и переустаналиваем gitlab-runner с использованием команд:  
`sudo curl -L --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"`

`sudo chmod +x /usr/local/bin/gitlab-runner`

`sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash`

`sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner`

`sudo gitlab-runner start`

`sudo systemctl enable --now gitlab-runner`

#### Регистрируем gitlab-runner  
![Part_1_3.png](screenshots/1_3.png)  

## Part 2. Сборка  

#### Создаём файл `.gitlab-ci.yml` в корне проекта и вписываем туда следующее:  

![Part_2_1.jpg](screenshots/Part_2_1.jpg)  

#### Докидываем `s21_cat` и `s21_grep` из проекта `SimpleBash`, пушим и проверяем работу:  

![Part_2_2.jpg](screenshots/2_2.png)

![Part_2_2.jpg](screenshots/2_3.png)


## Part 3. Тест кодстайла  
#### Не забываем дописать этап в начало `.gitlab-ci.yml`  
![Part_3_1.jpg](screenshots/Part_3_1.jpg)  

#### Дописываем стадию кодстайла:  
![Part_3_2.jpg](screenshots/Part_3_2.jpg)  

#### Пушим, проверяем:  

![Part_3_3.jpg](screenshots/3_3.png)

![Part_3_3.jpg](screenshots/3_4.png)  

#### Теперь добавим ошибки по кодстайлу в файлы, запушим и посмотрим результат:  

![Part_3_4.jpg](screenshots/3_5.png)  

Замечательно, все работает

## Part 4. Интеграционные тесты  
#### Добавим этап в начало `.gitlab-ci.yml`  
![Part_4_1.jpg](screenshots/Part_4_1.jpg)  

#### Допишем стадию:  
![Part_4_2.jpg](screenshots/Part_4_2.jpg)  

#### Содержимое скрипта test.sh:  
![Part_4_3.jpg](screenshots/4_3.png)  

#### Пушим, смотрим результат:  
![Part_4_4.jpg](screenshots/4_4.png)  

#### Пайплайн выполнен успешно:  
![Part_4_5.jpg](screenshots/4_5.png)  

## Part 5. Этап деплоя  
#### Поднимаем вторую машину:  
![Part_5_1.jpg](screenshots/5_1.png)  

#### Изменяем файл /etc/netplan/00-installer-config.yaml на обеих машинах:  
![Part_5_2.jpg](screenshots/5_2.png)  

#### Изменяем настройки адаптеров:  
![Part_5_3.jpg](screenshots/Part_5_3.jpg)  

#### Пропингуем вторую машину с первой, чтобы убедиться, что соединение есть:  
![Part_5_4.jpg](screenshots/5_4.png)  

#### Содержимое скрипта deploy.sh:  
![Part_5_7.jpg](screenshots/5_7.png)  

#### Далее зайдём из-под пользователя gitlab-runner предварительно задав пароль командой `sudo passwd gitlab-runner`  
#### Затем добавим пользователя gitlab-runner в группу sudoers
#### Далее сгенерируем ssh ключ командой `ssh-keygen` и скопируем его на вторую машину командой `ssh-copy-id chaurodr@10.10.0.2`  
#### Теперь мы можем подключаться ко второй машине через ssh без необходимости ввода пароля  

#### На второй машине дадим права для папки `/usr/local/bin/` командой `sudo chmod -R 777 /usr/local/bin`  

#### Деплой прошёл успешно, файлы появились в нужной папке на второй машине:  

![Part_5_10.jpg](screenshots/5_10.png)

![Part_5_10.jpg](screenshots/5_11.png)


## Part 6. Дополнительно. Уведомления  

#### Напишем @botfather, чтобы создать бота и получить его токен:
![Part_6_3.jpg](screenshots/botfather.png)  

#### Добавим по вызову скрипта `notify.sh` после каждой стадии:

#### Содержимое скрипта `notify.sh`:  
![Part_6_2.jpg](screenshots/notify.png)  

#### Пушим, проверяем работу:  
![Part_6_4.jpg](screenshots/bot.png)  

