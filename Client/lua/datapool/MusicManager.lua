
-- MusicManager.lua
-- Author     :Lysong
-- Version    : 1.0.0.0
-- Date       :
-- Description:
------------------------------------------------------------------
require("datapool.SettingData")

EnumMusicType = {
	bgMusic 		= "sound/backgroundmusic.mp3",
	button 		= "sound/Button.mp3",
	buyao 		= "sound/buyao.mp3",--��Ҫ
	dani1  		= "sound/dani1.mp3",--����1 ��
	dani2  		= "sound/dani2.mp3",--����2   ��
	dani3  		= "sound/dani3.mp3",--����3   ��
	bujiao 		= "sound/fold.mp3",--����
	feiji   		= "sound/feiji.mp3",--�ɻ�   ��
	liandui 	= "sound/liandui.mp3",--����   ��
	lose 	= "sound/lose.mp3",--��   ��
	menu 	= "sound/menu.mp3",--
	one 	= "sound/one.mp3",--һ��
	pass 	= "sound/pass.mp3",--��   ��
	rechoose 	= "sound/rechoose.mp3",--ѡ��  ��
	sandaiyi 	= "sound/sandaiyi.mp3",--����һ  ��
	sandaiyidui 	= "sound/sandaiyidui.mp3",--����һ��  ��
	shunzi 	= "sound/shunzi.mp3",--˳��  ��
	sidaier 	= "sound/sidaier.mp3",--�Ĵ���
	sidailiangdui 	= "sound/sidailiangdui.mp3",--�Ĵ�����
	start 	= "sound/start.mp3",--��ʼ    ��
	three 	= "sound/three.mp3",--����
	two 	= "sound/two.mp3",--����
	wangzha 	= "sound/wangzha.mp3",--��ը  ��
	win 	= "sound/win.mp3",--Ӯ  ��
	xiaowang 	= "sound/xiaowang.mp3",--С��  ��
	yaobuqi 	= "sound/yaobuqi.mp3",--Ҫ����
	zhadan 	= "sound/zhadan.mp3",--ը��  ��
	chupai  = "sound/givecard.mp3",--����    ��
}
local bInit = false
local mState={}
function resetMusicInit()
	stopMusic()
	bInit = false
end

function init()
	mState={}
	mState[2]={}
	mState[2].IsInUse=tonumber(accountInfo.getConfig("sys/config.ini", "SETTING2", "musicState2"))
	bInit = true
end

function playMusic(musicType)
	if  not bInit then
		init()
	end
	local setData = mState
	if setData[2].IsInUse == 1 then
--		CocosDenshion.SimpleAudioEngine:sharedEngine():playBackgroundMusic(P(musicType),true)
	end
end

function stopMusic()
--	CocosDenshion.SimpleAudioEngine:sharedEngine():stopBackgroundMusic(true)
end

function playEffect(effectType)
	if bInit == false then
		init()
	end
--	local setData = SettingData.getLocalData()
	local musicState1=tonumber(accountInfo.getConfig("sys/config.ini", "SETTING1", "musicState1"))
--	if setData[1].IsInUse == 1 then
	if  musicState1 ==nil or musicState1 == 1 then
--		CocosDenshion.SimpleAudioEngine:sharedEngine():playEffect(P(effectType), false);
	end
end
