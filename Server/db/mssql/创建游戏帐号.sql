/*
����:
$loginPass ��Ϸ��ʹ�����ݿ��¼�˺�(game_user)������
*/

IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = N'$(gameuser)')
BEGIN
    CREATE LOGIN [$(gameuser)] WITH PASSWORD=N'$(loginPass)', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
END
go