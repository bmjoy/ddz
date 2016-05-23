
-- SetScene.lua.lua
-- Author     :Lysong
-- Version    : 1.0.0.0
-- Date       :
-- Description:
------------------------------------------------------------------

module("SetScene", package.seeall)

-- �������õ��ĳ�Ա����Ҫ���ļ�ͷ���������������ӱ�Ҫ��˵��
-- ��Ա����ͳһ���»��߿�ʼ�����ӵ�����ĸҪСд

local mScene = nil 		-- ����
local mLayer = nil
local layoutLayer=nil;--ͨ�ò�
local setLayer=nil
local mClassTable={}
local type1=nil
local type2=nil
local type3=nil

--
---------------���нӿ�(�������������̶����øı�)--------
--

-- ��������Сд��ĸ��ʼ��ÿ��������Ӧע��

-- �������
function pushScene()
	initResource()
	createScene()
--	CCDirector:sharedDirector():pushScene(_scene)
end
-- �˳�����
function popScene()
	releaseResource()
	CCDirector:sharedDirector():popScene()
end

function musicAction1()
	if  mSetState.musicState1==1 then
		mSetState.musicState1=0
		accountInfo.saveConfig("sys/config.ini", "SETTING1", "musicState1"  , mSetState.musicState1)
--		 resetMusicInit() 	
		 gou:setIsVisible(false)
	else	 
		mSetState.musicState1=1	
		accountInfo.saveConfig("sys/config.ini", "SETTING1", "musicState1"  , mSetState.musicState1)
--		local index=EnumMusicType.yaobuqi
--		resetMusicInit()
--	    	playEffect(index)
	    	gou:setIsVisible(true)
	end	
end;

function musicAction2()
	if  mSetState.musicState2==1 then
		mSetState.musicState2=0
		accountInfo.saveConfig("sys/config.ini", "SETTING2", "musicState2"  , mSetState.musicState2)
		 resetMusicInit() 	
		 gou2:setIsVisible(false)
	else	 
		mSetState.musicState2=1	
		accountInfo.saveConfig("sys/config.ini", "SETTING2", "musicState2"  , mSetState.musicState2)
		local index=EnumMusicType.bgMusic
		resetMusicInit()
	    	MainDesk.playmusic()

	    	gou2:setIsVisible(true)
	end	
end;
--]]
function releseset()
	removeset()
end;
--
-------------------------˽�нӿ�------------------------
--
-- ��ʼ����Դ����Ա����
function initResource()
	
end
-- �ͷ���Դ
function releaseResource()
    
end
-- ��������
function createScene()
	-- �˴���ӳ�����ʼ����
	mLayer = CCLayer:create()
	setBtnAction()
	return mLayer
	----
end

function removeset()
    if setLayer ~= nil then
        setLayer:getParent():removeChild(setLayer,true)
        setLayer = nil
    end
end

function initset()
    removeset()
    setLayer=CCLayer:create()
    setLayer:setAnchorPoint(PT(0,0));
    setLayer:setPosition(PT(0,0));
    mLayer:addChild(setLayer,0)
end

function setBtnAction()

	initset()
	
	local bgLayer = UIHelper.createActionRect(pWinSize);
	bgLayer:setPosition(PT(0,0))
	setLayer:addChild(bgLayer);
	
	mSetState={}
	local musicState1=accountInfo.getConfig("sys/config.ini", "SETTING1", "musicState1")
	musicState1=tonumber(musicState1)
	mSetState.musicState1=musicState1
	
	local musicState2=accountInfo.getConfig("sys/config.ini", "SETTING2", "musicState2")
	musicState2=tonumber(musicState2)
	mSetState.musicState2=musicState2
	--]]
	local kuang= CCSprite:create(P("common/panle_1021_6.png"));
	kuang:setAnchorPoint(PT(0,0))
	kuang:setPosition(PT((pWinSize.width-kuang:getContentSize().width)/2,(pWinSize.height-kuang:getContentSize().height)/2))
	setLayer:addChild(kuang,0)
	
	local logo= CCSprite:create(P("Image/logo2.png"));
	logo:setAnchorPoint(PT(0,0))
	logo:setPosition(PT(kuang:getPosition().x+(kuang:getContentSize().width-logo:getContentSize().width)/2,kuang:getPosition().y+kuang:getContentSize().height-logo:getContentSize().height-SY(20)))
	setLayer:addChild(logo,0)
	
	local closeBtn=ZyButton:new(P("button/panle_1014_3.png"));
	closeBtn:setAnchorPoint(PT(0,0));
	closeBtn:setPosition(PT(kuang:getPosition().x+kuang:getContentSize().width-closeBtn:getContentSize().width*1.5,kuang:getPosition().y+kuang:getContentSize().height-closeBtn:getContentSize().height*1.5));
	closeBtn:registerScriptTapHandler(releseset);
	closeBtn:addto(setLayer);
	
	--2�����ð�ť
	--��Ϸ��Ч
--	buttona=ZyButton:new("common/panle_1021_2.png","common/panle_1021_2.png",nil,nil,FONT_NAME,FONT_SM_SIZE)
	buttona=ZyButton:new(P("common/panle_1021_2.png"))
	gou=CCSprite:create(P("common/panle_1021_1.png"));
	buttona:setAnchorPoint(PT(0,0.5));
	local posX=kuang:getPosition().x+kuang:getContentSize().width/4-buttona:getContentSize().width/2-gou:getContentSize().width/2
	buttona:setPosition(PT(posX,kuang:getPosition().y+pWinSize.height*0.1));
	buttona:registerScriptTapHandler(musicAction1);
	buttona:addto(setLayer,0);
	

	gou:setAnchorPoint(PT(0,0.5));
	gou:setPosition(PT(posX+SX(2),kuang:getPosition().y+pWinSize.height*0.1));
	mSetState.musicState1=tonumber(accountInfo.getConfig("sys/config.ini", "SETTING1", "musicState1"))
	if mSetState.musicState1==0 then
		gou:setVisible(false)
	else
		gou:setVisible(true)
	end
	setLayer:addChild(gou,0)
	
	local button1=ZyButton:new(P("title/panle_1050.png"))
	button1:setAnchorPoint(PT(0,0.5));
	button1:setPosition(PT(buttona:getPosition().x+buttona:getContentSize().width+SX(5),buttona:getPosition().y));
	button1:registerScriptTapHandler(musicAction1);
	button1:addto(setLayer,0)
	
	--��������
--	buttonb=ZyButton:new("common/panle_1021_2.png","common/panle_1021_2.png",nil,nil,FONT_NAME,FONT_SM_SIZE)
	buttonb=ZyButton:new(P("common/panle_1021_2.png"))
	buttonb:setAnchorPoint(PT(0,0.5));
	buttonb:setPosition(PT(button1:getPosition().x+button1:getContentSize().width+buttona:getContentSize().width*2,buttona:getPosition().y));
	buttonb:registerScriptTapHandler(musicAction2);
	buttonb:addto(setLayer,0);
	
	gou2=CCSprite:create(P("common/panle_1021_1.png"));
	gou2:setAnchorPoint(PT(0,0.5));
	gou2:setPosition(PT(button1:getPosition().x+button1:getContentSize().width+buttona:getContentSize().width*2+SX(2),buttona:getPosition().y));
	mSetState.musicState2=tonumber(accountInfo.getConfig("sys/config.ini", "SETTING2", "musicState2"))
	if mSetState.musicState2==0 then
		gou2:setVisible(false)
	else
		gou2:setVisible(true)
	end
	setLayer:addChild(gou2,0)
	
	local button1=ZyButton:new(P("title/panle_1031.png"))
	button1:setAnchorPoint(PT(0,0.5));
	button1:setPosition(PT(buttonb:getPosition().x+buttonb:getContentSize().width+SX(5),buttonb:getPosition().y));
	button1:registerScriptTapHandler(musicAction2);
	button1:addto(setLayer,0)
	
	return setLayer
	
end;



-- ����ص�
function networkCallback(pScutScene, lpExternalData)
	local actionID = ZyReader:getActionID()
	local userData = ZyRequestParam:getParamData(lpExternalData)
end
