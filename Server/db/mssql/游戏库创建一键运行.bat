@echo off

cd %cd%

set dbServer=.
set dbAcount=sa
set dbPass=123
set gameuser=game_user
set gamepass=123
set gameName=Ddz
set dbpath=%cd%\Data

@echo ���ò������£�
@echo     [dbServer] ���ݿ������:%dbServer%
@echo     [dbAcount] �ɴ������ݿ���ʺ�(sa):%dbAcount%
@echo     [dbPass]   �ɴ������ݿ������(sa):%dbPass%
@echo     [gameuser] ��Ϸ��¼�ʺ�:%gameuser%
@echo     [gamepass] ��Ϸ��¼����:%gamepass%
@echo     [gameName] ��Ϸ��Ŀ����:%gameName%
@echo     [dbpath] ���ݿ�洢·��:%dbpath%
@echo ================================================================

MD %dbpath%

Sqlcmd -? 2>nul 1>nul
if errorlevel 1 (
echo �밲װsqlcmd֧�֡�&pause>nul
exit
)

Sqlcmd -S %dbServer% -U %dbAcount% -P %dbPass% -d master -i ������Ϸ�ʺ�.sql -v gameuser="%gameuser%" loginPass="%gamepass%"
@echo �������ݿ��¼�ʺųɹ�!

Sqlcmd -S %dbServer% -U %dbAcount% -P %dbPass% -d master -i �û����ı�ṹ.sql -v gameuser="%gameuser%" dbpath="%dbpath%" 
@echo ���ڴ����û��������ݿ�ɹ�!

Sqlcmd -S %dbServer% -U %dbAcount% -P %dbPass% -d master -i �ַ����ֵ���ı�ṹ.sql -v gameuser="%gameuser%" dbpath="%dbpath%" 
@echo �����ַ��������ݿ�ɹ�!

@echo ���ڴ�����Ϸ%4���ݿ�...
Sqlcmd -S %dbServer% -U %dbAcount% -P %dbPass% -d master -i ������Ϸ���ݿ�.sql -v gameuser="%gameuser%" gameName="%gameName%" dbpath="%dbpath%"


@echo ���ڳ�ʼ����Ϸ��������...
Sqlcmd -S %dbServer% -U %dbAcount% -P %dbPass% -d master -i ���ÿ��ʼ����.sql -v gameName="%gameName%"

@echo ִ�гɹ�

ECHO ���н�����& PAUSE

