# IvnKor_infra
IvnKor Infra repository
# Выполнено ДЗ №

 - [ ] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Пункт 1
 - Пункт 2

## Как запустить проект:
Для подключения к виртуальной машине someinternalhost через ssh прописываем изменения в файл 
```shell
vim ~/.ssh/config
```
если файла нет, то создаем его.
Вносим алиас виртуальных машин
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
 - Например, перейти по ссылке http://localhost:8080

## PR checklist
 - [ ] Выставил label с номером домашнего задания
 - [ ] Выставил label с темой домашнего задания
