pianobar for Windows - portable binaries
========

![pianobar](https://github.com/thedmd/pianobar-windows-binaries/blob/master/screenshots/pianobar.png)

pianobar is a console client for the personalized web radio pandora
(http://www.pandora.com). Source code of the original project can be found at
at http://github.com/PromyLOPh/pianobar/ or http://6xq.net/projects/pianobar/

This project contains binaries for Windows build using Microsoft
Visual Studio 2015.

json-c, vtparse are used to prepare this distributtion.

Source code of this binary can be found at:
https://github.com/thedmd/pianobar-windows-build


QUICK START

1. Copy pianobar.cfg.example to pianobar.cfg and set "user".
2. Optional: run set-password.ps1 once and uncomment password_command,
   so the password is stored encrypted for your Windows account.
3. Optional: uncomment event_command for song notifications and a play
   history in history.txt (see eventcmd.ps1).
4. Run pianobar.exe. Media keys play/pause and skip.

When you upgrade, unzip over the old folder; pianobar.cfg, pianobar.pw and
history.txt are not in the zip, so they are kept.


CONFIGURATION

Pianobar use configuration file. Under Windows this file is named pianobar.cfg
and should be placed next to pianobar.exe.
On reporitory there is an example configuration file, you may copy or rename it.
Then edit it and fill marked fields relevant to you and remove remaining.

Note that non-US users have to have configuration file with control proxy
details set.


GLOBALPANDORA.COM

If you're behind proxy please look into pianobar.cfg.example and copy necessary
settings to your own configuration file. This are necessary, because
globalpandora.com does not support server used in by pianobar.
