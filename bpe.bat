@echo off

rem
rem �u���b�N�v���O���~���O���̋N��
rem

rem �ݒ莖��
rem set HOGE="�ϐ��̒l"

rem ���̃o�b�`��PID��ݒ肷��
set PID_VAL=0

rem ���̃o�b�`�����݂���t�H���_���J�����g��
cls

rem Run Board mangaer by background process
start /b "" ".\BoardManager.exe" ja

rem ���̃o�b�`�̃^�C�g����@@@�ɕύX����tasklist����@@@(����)��PID���擾����
for /f "tokens=2 delims=," %%i in ('title @@@^&tasklist /v /fo csv /nh /fi "windowtitle eq @@@"') do set PID_VAL=%%~i

rem echo %PID_VAL%

if "%1" == "" (
  start /b /wait .\Block.exe .\Block.image
) else (
  echo %1
  start /b /wait .\Block.exe %1
)
rem pause

rem �������g�Ǝq�v���Z�X(BoardManager, Block)�������A���kill����
taskkill /t /f /pid %PID_VAL%

exit /b
