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

 - [ ] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Пункт 1
 - Пункт 2

## Как запустить проект:
 - Например, запустить команду X в директории Y

## Как проверить работоспособность:
 - Например, перейти по ссылке http://localhost:8080

## Testapp check
```
testapp_IP = 35.198.167.169
testapp_port = 9292
```
## PR checklist
 - [ ] Выставил label с номером домашнего задания
 - [ ] Выставил label с темой домашнего задания
