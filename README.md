# Windows_auto_deploy_software
Set of simple cmd's that allows to deploy software in local network w/o using remote services.
Alternative to WSUS, SCCM, WPKG.
Easy, lightweight and completely free of course.
Catch is, you need to make cmd's with install options for all your software.
Pros are:
1. You need to do it anyway at least once;
2. No borders like "only exe/msi", "only approved by someone";
3. Free!

Usage:
1. create shared folder like soft/deploy on server;
2. put scripts in folder like soft/deploy/cmd;
3. put all you last/need distrs in folders like soft/deploy/firefox;
4. do auto_deploy files and put them alongside distrs;
5. add deploy_center.cmd to GPO-Computers-Autorun;
6. Enjoy.

Install will proceed when PC is booting.
Known issues:
- remote disk not detaching and is show as "detached network device" after user logs on. Windows issue;

Will post sample deploy files if neccessary.


---------------------------------------------
Набор (ТРИ, Карл) простых cmd-файлов для автоматической установки софта в локальной сети. 
НЕ клиент-сервер система, клиенты типа psexec не нужны.
Всё происходит локально.
Альтернатива WSUS, SCCM, WPKG. Полностью бесплатно, легковесно и на стандартных возможностях Windows.

Подвох в том, что надо писать руками установочные команды. Но только один раз.

Использование:
1. создаём расшаренную папку на сервере;
2. кладём скрипты в подпапку cmd, например;
3. кладём дистрибутивы в подпапки;
4. делаем auto_deploy файлы по образцу из набора, кладём их рядом с дистрибутивами;
5. добавляем deploy_center.cmd в GPO-Компьютеры-Автозагрузка;
6. Радуемся!

Подробнее: https://automatize-it.blogspot.ru/2017/08/wsus-sccm.html

Установка происходит, соответственно, при загрузке ПК.
Косяки:
- сетевой диск не отключается, висит как "отключённое сетевое устройство". В общем и целом, баг Windows.

Если нужно будет, выложу конфиги для распространённого ПО, типа того же Firefox.
