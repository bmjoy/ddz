------------------------------------------------------------------
-- BroadcastLayer.lua
-- Author     : Zonglin Liu
-- Version    : 1.0
-- Date       :   
-- DescriCCPointion: ������㲥
------------------------------------------------------------------

module("BroadcastLayer", package.seeall)


mScene = nil 		-- ����
_count = 0
--�㲥����
--ϵͳ�㲥>��Ϸ�ڲ��㲥>��ҹ㲥

function close()
	if mLayer then
		mLayer:stopAllActions()
	end
	if mList then
		mList:clear()
		mList = nil
	end	
end


function releaseResource()
	mLayer=nil
	mList=nil
	isfresh=nil
  --  CCScheduler:sharedScheduler():unscheduleScriCCPointFunc("BroadcastLayer.refresh")
	isHide=nil
end;

function initResource()
	isfresh = false
end;
function refresh()
	--[[_count = _count+1
	if isfresh and _count%20 == 0 then
		sendAction(9202)
	end]]
end;
function init(scene,type,mtable)
	mScene = scene
	mLayer = CCLayer:create()
	mLayer:setVisible(false)
	mScene:addChild(mLayer,5)
	mDataTable=mtable
  -- CCScheduler:sharedScheduler():scheduleScriCCPointFunc("BroadcastLayer.refresh",1,false)	
	creatBg(type)
	------
			currentIndex = 0
			if #mDataTable > 0 then
				isfresh = false
				show()
			else
				isfresh = true
			end
end



function creatBg(PosType)
	
	local bgBox=SZ(pWinSize.width*0.48,pWinSize.height*0.1)
	--����
	local bgSprite = CCSprite:create(P("common/panle_1068.9.png"))
	bgSprite:setScaleX(bgBox.width/bgSprite:getContentSize().width)
	bgSprite:setScaleY(bgBox.height/bgSprite:getContentSize().height)
	bgSprite:setContentSize(bgBox)
	bgSprite:setAnchorPoint(CCPoint(0,0))
	bgSprite:setPosition(CCPoint(0,SY(5)))
	mLayer:addChild(bgSprite, 0)
	
	mLayer:setAnchorPoint(CCPoint(0,0))
	mLayer:setPosition(CCPoint(pWinSize.width*0.93-bgBox.width,pWinSize.height*0.98-bgBox.height))
	if PosType then
		mLayer:setPosition(CCPoint(pWinSize.width*0.5-bgBox.width/2,pWinSize.height*0.8-bgBox.height))
	end
	--���������С
	mLayer:setContentSize(bgBox)	
	--���ΰ�ť
	--[[local unTouchBtn =  ZyButton:new(P("common/panle_1026_1.9.png"))
	unTouchBtn:setScaleX(bgBox.width/unTouchBtn:getContentSize().width)
	unTouchBtn:setScaleY(bgBox.height/unTouchBtn:getContentSize().height)
	unTouchBtn:setAnchorPoint(CCPoint(0,0))
	unTouchBtn:setPosition(CCPoint(0,0))
	unTouchBtn:addto(mLayer, 0)]]
    -----͸����ť��Ӧ�¼�  
    if not PosType and #mDataTable>0 then
        local listsize = CCSize(bgBox.width,bgBox.height)
        local unTouchBtn=UIHelper.createActionRect(listsize,"BroadcastLayer.ActivityNoticLayerBtnAction")
        unTouchBtn:setAnchorPoint(CCPoint(0,0))
        unTouchBtn:setPosition(CCPoint(0,0))
        bgSprite:addChild(unTouchBtn,1)
    end


	--����list����������ʾ��
	local label=CCLabelTTF:create(Language.IDS_NONE,FONT_NAME,FONT_SM_SIZE)
	local height=label:getContentSize().height
	listSize = SZ(bgBox.width*0.9, height)
	local startX = bgBox.width*0.5-listSize.width*0.5
	local startY =bgSprite:getPosition().y+bgBox.height*0.5-listSize.height*0.65
	
	local list = ScutCxList:node(listSize.width, ccc4(24, 24, 24, 0), listSize)
	list:setPosition(CCPoint(startX, startY))
	list:setHorizontal(true)
	list:SetSilence(true)
	mLayer:addChild(list, 0)
	mList = list	
	
	--������ʾ��
	listItem = ScutCxListItem:itemWithColor(ccc3(24,24,24))
	listItem:setOpacity(90)
	list:addListItem(listItem, false)	
	list:disableAllCtrlEvent()		
	currentIndex = 0
	isFirst = 1--�Ƿ��һ���㲥
  --  sendAction(9202)
   -- show()
end
--�����
function ActivityNoticLayerBtnAction()
    ActivityNoticLayer.createScene(mScene);--����
end
--
function show()
	mLayer:setIsVisible(true)
	currentIndex = currentIndex+1
--[[	mDataTable={
	{Content="DSFA111111111111111111111111111111111111111111111111111111111111SD"},
	{Content="111sdasdasdasdsadsadasdasdasdasdasd11"},
	{Content="22asdsadsadadadsadsadsadas222"}
	}]]
	if currentIndex > #mDataTable then
		isHide = true
		return
	end
	
	local layer = CCLayer:create()
	local layout = CxLayout()
	layout.val_x.t = ABS_WITH_PIXEL
	layout.val_y.t = ABS_WITH_PIXEL
	layout.val_x.t = 0
	layout.val_y.t = 0
	listItem:addChildItem(layer, layout)
	local currentInfo = mDataTable[currentIndex]
	local msg = ""
	local isSys = nil
	if currentInfo.BroadcastType == 1 then
		isSys = true
	elseif currentInfo.BroadcastType == 3 then
		if currentInfo.UserName then
			msg = string.format(Language.NOTICE_NAME, currentInfo.UserName)
		end
	end
	msg = msg..currentInfo.Content
	msg = string.gsub(msg, "\r\n", "")
	msg = string.gsub(msg, "\n", "")
	---	
	local startX = layer:getContentSize().width*0.9
	if isFirst == 1 then
		startX = 0
	end
	
	local sysLabel = nil
	if isSys then
		local sysStr = string.format(Language.NOTICE_NAME, Language.NOTICE_SYSTEM)
		sysLabel = CCLabelTTF:create(sysStr, FONT_NAME, FONT_SM_SIZE)
		sysLabel:setAnchorPoint(CCPoint(0, 0))
		sysLabel:setPosition(CCPoint(startX, 0))		
		layer:addChild(sysLabel, 0)
		sysLabel:setColor(ZyColor:colorYellow())	
		startX = startX+sysLabel:getContentSize().width
	end
	
	local label = CCLabelTTF:create(msg, FONT_NAME, FONT_SM_SIZE)
	label:setAnchorPoint(CCPoint(0, 0))
	label:setPosition(CCPoint(startX, 0))		
	layer:addChild(label, 0)

	--�ƶ�����
	local nDistance = label:getContentSize().width+listSize.width
	if isFirst == 1 then
		nDistance = label:getContentSize().width
	end
	if sysLabel then
		nDistance = nDistance+sysLabel:getContentSize().width
	end	
	local speed = 2--һ���ƶ����ٸ����ֵľ���
	--�����ƶ����붼Ϊ���ֳ���
	--�����ƶ���Ӧʱ��  Ϊ distance/speed,  ����һ��ʱ   Ϊ ��dostamce-listSize.width��
	--���ֳ��ֺ�ͣ��ʱ��
	local waitTime = 2	
	--�����ƶ�����ʧ������ʱ��
	local nTime = math.floor(nDistance/ZyFont.wideWordWidth(FONT_NAME, FONT_SM_SIZE)/speed)	
	--����β����ʾʱ��
	local mTime = math.floor((nDistance-listSize.width)/ZyFont.wideWordWidth(FONT_NAME, FONT_SM_SIZE)/speed)	
	if mTime <= 0 then
		mTime = 0.01
	end
	--�����ƶ�
	local action = CCMoveTo:actionWithDuration(nTime, CCPoint(0-nDistance, layer:getPosition().y) )
	--�ȴ����ƶ�����
	local sequence1 = CCSequence:actionOneTwo(CCDelayTime:actionWithDuration(waitTime), action )
	local sequence2 = CCSequence:actionOneTwo(sequence1, CCCallFuncN:actionWithScriCCPointFuncName("BroadcastLayer.removeCurrent") )
	
	--����β������ʾʱ��Ӧ
	local actionFuncCall = CCCallFuncN:actionWithScriCCPointFuncName("BroadcastLayer.runOver")
	local sequence3 = CCSequence:actionOneTwo( CCDelayTime:actionWithDuration(waitTime+mTime), actionFuncCall)
	layer:stopAllActions()
	layer:runAction(sequence2)
	label:runAction(sequence3)
	isFirst = 0	
end

--һ���㲥�������
function runOver()
	show()
end

function removeCurrent(layer)
	if layer ~= nil then
		layer:getParent():removeChild(layer, true)
		layer = nil
	end
	if isHide then
		isHide = nil
		hide()
	end
end;


function getNewMessage()
--	sendAction(9202)
end;

function hide()
	mLayer:setIsVisible(false)
end;

--��������
function sendAction(actionId)
	if actionId == 9202 then
		isfresh = false
		actionLayer.Action9202(mScene, false,1,20)
	end
end
-- ����ص�
function networkCallback(pScutScene, lpExternalData)
	local actionId = ZyReader:getActionID()
	local userData = ZyRequestParam:getParamData(lpExternalData)
	if actionId == 9202 then
		local serverInfo = actionLayer._9202Callback(pScutScene, lpExternalData)
		if serverInfo ~= nil then
			mDataTable = serverInfo.RecordTabel
			currentIndex = 0
			if #mDataTable > 0 then
				isfresh = false
				show()
			else
				isfresh = true
			end
		else
			isfresh = true	
		end
	end
end

