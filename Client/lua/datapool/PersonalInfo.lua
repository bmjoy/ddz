------------------------------------------------------------------
-- PersonalInfo.lua
-- Author     : ChenJM
-- Version    : 1.15
-- Date       :   
-- Description: ��ɫ��Ϣ��,
------------------------------------------------------------------
---�����û�������������Ϣ---
require("lib.lib")
module("PersonalInfo", package.seeall)
my_ID=10000

local mPersonalInfo = {
-----��ɫ��Ϣ
	_UserType=nil, --�û�״̬
	_Pid=nil,--ͨ��֤ID
	_HeadIcon=nil,--���icon
	_NickName=nil,--����ǳ�
	_GameCoin      = 0,            --��
       _Gold=0,--Ԫ��
       _VipLv=0,           --VIP�ȼ�
        _WinNum       =0,               --ʤ������
     	 _FailNum=0,--ʧ�ܾ���
    	_TitleName   =nil,     --�ƺ�
    	_ScoreNum     =0,               --����
    	_WinRate=0,                    --ʤ��
	_roomTabel={},--������Ϣ
	_userID=nil,
_chatTable=nil;--���9001�����б���Ϣ
}

npc_state_={}

function getPersonalInfo()
	return mPersonalInfo
end

function setPersonalInfo(info)
	mPersonalInfo._Pid=info.Pid
	mPersonalInfo._HeadIcon=info.HeadIcon
	mPersonalInfo._NickName=info.NickName
	mPersonalInfo._GameCoin=info.GameCoin
	mPersonalInfo._Gold=info.Gold
	mPersonalInfo._VipLv=info.VipLv
	mPersonalInfo._WinNum=info.WinNum
	mPersonalInfo._FailNum=info.FailNum
	mPersonalInfo._TitleName=info.TitleName
	mPersonalInfo._ScoreNum=info.ScoreNum
	mPersonalInfo._WinRate=info.WinRate
	mPersonalInfo._roomTabel=info.roomTabel
	mPersonalInfo._RoomId =info.RoomId 
end

