# IvnKor_infra
IvnKor Infra repository
# Выполнено ДЗ №3

 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Создана учетная запись в GCP
 - Созданы инстансы и произведено подключение по SSH
 - Реализованы варианты подключения к хостам через бастион-хост и VPN
 - Реализован валидный сертификат для Pritunl

## Подключение к someinternalhost в одну команду
Для подключения к виртуальной машине someinternalhost в одну
команду из вашего рабочего устройства, используем опцию ProxyJump. Вводим команду с ключом -J
```shell
ssh -J appuser@35.187.58.38 appuser@10.132.0.3
```
## Подключение по алиасу someinternalhost:
Для подключения к виртуальной машине someinternalhost по имени хоста, прописываем изменения в файл 
```shell
vim ~/.ssh/config
```
если файла нет, то создаем его.
Вносим данные виртуальных машин
```text
Host bastion
        HostName 35.187.58.38
        User appuser

Host someinternalhost
        HostName 10.132.0.3
        User appuser
        ProxyJump bastion
```
При первой попытке соединения получил следующую выдачу 
```shell
➜  ~ ssh someinternalhost 
Bad owner or permissions on /home/osboxes/.ssh/config
```
Правим права и пользователя
```shell
➜  ~ chmod 600 ~/.ssh/config
➜  ~ chown $USER ~/.ssh/config
```
## Как проверить работоспособность:
```shell
bastion_IP = 35.187.58.38
someinternalhost_IP = 10.132.0.3 
```
## Реализация валидного сертификата для панели управления VPN-сервера
В настройках сервера Pritunl, в поле Lets Encrypt Domain прописать адрес сервера bastion и добавить домен sslip.io
https://35.187.58.38.sslip.io

## PR checklist
 - [x] Выставил label с номером домашнего задания
 - [x] Выставил label с темой домашнего задания

# Выполнено ДЗ №4

 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Установили и настроили gcloud на локальной машине для работы с аккаунтом
 - Создали инстанс с помощью gcloud
 - Установили на нем ruby & mongoDB
 - Задеплоили тестовое приложение, запустили и проверили его
 - Открыли необходимый порт в файрволе и научились создавать правило для него через gcloud
 - Создали скрипты для установки ruby & mongoDB, деплоя приложения
 - Создали скрипт для создания инстанса с установкой ruby & mongoDB и деплоя приложения
 ## Testapp check
```
testapp_IP = 35.242.137.231
testapp_port = 9292
```
## Создание инстанса с деплоем приложения с помощью startup-script
gcloud compute instances create reddit-app \ 
```shell
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--metadata-from-file startup-script=startup_script.sh
```
## Создание правила брандмауэра для приложения puma-server
```shell
gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --source-ranges="0.0.0.0/0" --target-tags=puma-server
```
## PR checklist
 - [x] Выставил label с номером домашнего задания
 - [x] Выставил label с темой домашнего задания

# Выполнено ДЗ №5

 - [ ] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Пункт 1
 - Пункт 2
## В процессе столкнулся:
```shell
➜  ~ export PATH="$PATH:/usr/local/packer"
➜  ~ cd /usr/bin 
➜  bin sudo ln -s /usr/local/packer/packer packer
➜  bin packer
/usr/share/cracklib/pw_dict.pwd: Permission denied
/usr/share/cracklib/pw_dict: Permission denied
```
лечится
```shell
➜  cd /usr/sbin/ 
➜  sbin sudo mv packer packers
```
## Как запустить проект:
 - Например, запустить команду X в директории Y

## Как проверить работоспособность:
 - Например, перейти по ссылке http://localhost:8080

## PR checklist
 - [ ] Выставил label с номером домашнего задания
 - [ ] Выставил label с темой домашнего задания
