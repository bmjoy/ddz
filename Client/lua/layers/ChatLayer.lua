--
-- ChatLayer.lua
-- Author     :chensy
-- Version    : 1.0
-- Date       :
-- Description: ����ϵͳ

module("ChatLayer", package.seeall)
require("layers.PrivateChatLayer")
-- �������õ��ĳ�Ա����Ҫ���ļ�ͷ���������������ӱ�Ҫ��˵��
-- ��Ա����ͳһ���»��߿�ʼ�����ӵ�����ĸҪСд
local mScene=nil;
local mLayer=nil;
local mCurrentTab=nil;--tab
local isClick=nil;--����״̬
local isClick2=nil;--�����ж��Ƿ����л�Tab��ʱ�������¼�Ǳ�
--
---------------���нӿ�(�������������̶����øı�)--------
--

-- ��������Сд��ĸ��ʼ��ÿ��������Ӧע��

-- �������
function pushScene()
	initResource()
	createScene()
	CCDirector:sharedDirector():pushScene(_scene)
end
-- �˳�����
function popScene()
	releaseResource()
	CCDirector:sharedDirector():popScene()
end

function close2()
   --[[ if mLayer then
    local action = CCMoveTo:actionWithDuration(0.2, PT(0, -pWinSize.height))
    mLayer:runAction(action)
    releaseResource();
    ---
    local action1 = CCSequence:actionOneTwo(CCDelayTime:actionWithDuration(0.2),CCCallFunc:actionWithScriptFuncName("ChatLayer.close3"))
    mScene:runAction(action1)
    end--]]
end
--�ر���Ӧ�¼�
function closeBtnActon()    
       if mScene then
    timerClose();--�ر�ʱ����Ӧ�¼�
 	local action = CCSequence:createWithTwoActions(CCDelayTime:create(0),CCCallFunc:create(close2))
	mScene:runAction(action)
    releaseResource()
    if mLayer then --�㻹û���ͷŵ�
        mScene:removeChild(mLayer,true)
        mLayer=nil;
    end
    mScene=nil;
    end
end
--
-------------------------˽�нӿ�------------------------
--
-- ��ʼ����Դ����Ա����
function initResource()
    personalInfo=PersonalInfo.getPersonalInfo()--��ȡ�����Ϣ
end
-- �ͷ���Դ
function releaseResource()
    isClick=nil;--����״̬
    isClick2=nil;--�����ж��Ƿ����л�Tab��ʱ�������¼�Ǳ�
    if mlist then
        mlist:clear();
        mlist=nil;
    end
    MainHelper.ChatState();
end
-- ��������
function createScene(parent)
  if parent then
    mScene=parent;
  end
  initResource()
  mLayer=CCLayer:create();
    mScene:addChild(mLayer,10);
	-- �˴���ӳ�����ʼ����
    --͸������
    local transparentBg=Image.tou_ming;--����ͼƬ
    local menuItem =CCMenuItemImage:create(P(transparentBg),P(transparentBg));
    local menuBg=CCMenu:createWithItem(menuItem);
    menuBg:setContentSize(menuItem:getContentSize());
    menuBg:setAnchorPoint(CCPoint(0,0));
    menuBg:setScaleX(pWinSize.width/menuBg:getContentSize().width*2)
    menuBg:setScaleY(pWinSize.height/menuBg:getContentSize().height*2);
    menuBg:setPosition(CCPoint(0,0));
    mLayer:addChild(menuBg,0);
	----
    local bgLayer = UIHelper.createUIBg(nil,nil,ZyColor:colorWhite(),nil,true);--û�б�����
    mLayer:addChild(bgLayer);
    ---
    
    --���ذ�ť
    local closeBtn=ZyButton:new(P(Image.image_exit));
    closeBtn:setAnchorPoint(PT(1,0.5));
    closeBtn:setPosition(PT(pWinSize.width-closeBtn:getContentSize().width/2,pWinSize.height-closeBtn:getContentSize().height*0.8));
    closeBtn:registerScriptTapHandler(closeBtnActon);
    closeBtn:addto(mLayer);
    --����
    if not mCurrentTab then
        mCurrentTab=1;
    end
    --Tab --��ʱ����,�����¼
  --  local tabName={Language.CHAT_JISHICHAT,Language.CHAT_LIAOTIANRECORD}
    local tabName={Image.button_1022,Image.button_1023}
   -- createTabBar(tabName);--�������ⰴť
    showLayer(mCurrentTab);
    ----
    --CCScheduler:sharedScheduler():scheduleScriptFunc("ChatLayer.timer", 10, false);--10�����һ��
   -- timer();
    --
   --[[ mLayer:setPosition(PT(0, -pWinSize.height))
	local action = CCMoveTo:actionWithDuration(0.2, PT(0,0));
	action = CCSequence:actionOneTwo(action ,CCCallFuncN:actionWithScriptFuncName("ChatLayer.editVisible"));
	mLayer:runAction(action);]]
	--
	  isClick=true;--����״̬
    MainDesk.setSendState(true);--
end
function timer()
    PrivateChatLayer.getMessage(mScene);
end
--Tab
function createTabBar(tabName)
    tabBar = ZyTabBar:new(Image.image_shop,Image.image_shop_1,tabName, FONT_NAME, FONT_SM_SIZE,2);
    tabBar:addto(mLayer)
    tabBar:setCallbackFun(callbackTabBar);  --�����Ӧ���¼�
    tabBar:selectItem(mCurrentTab);           --����ĸ���ť
    tabBar:setPosition(PT(SX(20),pWinSize.height*0.845))   
end
--tabbar
function callbackTabBar(bar,pNode,tag)
	local index=pNode:getTag();
	if index ~=mCurrentTab then
		mCurrentTab=index;
		showLayer(mCurrentTab);
	end
end
--����list
function setList()
    --mlist
    if mlist~=nil then
        mlist:clear();
        mLayer:removeChild(mlist,true);
        mlist = nil
    end
    listSize=SZ(pWinSize.width*0.86,pWinSize.height*0.73)
    mlist = ScutCxList:node(listSize.height/7,ccc4(124, 124, 124, 255),listSize);
	mlist:setPosition(PT(pWinSize.width*0.07,pWinSize.height*0.1));
	mlist:setHorizontal(false);  --����list����
    mlist:setRecodeNumPerPage(1);    --����ҳ��
	--[[if mCurrentTab==1 then 
	    mlist:registerItemClickListener("ChatLayer.sendUpdateAction")
	end]]
    mlist:setSelectedItemColor(ccc3(0, 70, 65), ccc3(0, 70, 65))
	------------------------------------------
    mLayer:addChild(mlist,0)
end
--��ʱ���췢����Ӧ�¼�
function sendUpdateAction(tag)
   -- local index=tonumber(tag)+1;
    local index=tag;
    if index then
        if isClick then
            isClick=false
            PrivateChatLayer.sendMessage(mScene,index)
         --   actionLayer.Action9002(mScene,nil,index)
         --   closeBtnActon();
        end
    end
end
function setIsClick(state) --�����������ʱ��
    if state then
        isClick=state;
    end
end
--�����ж��Ƿ����л�Tab��ʱ�������¼�Ǳ�
function getIsClick2()
  return  isClick2
end
function setIsClick2(state) --�����������ʱ��
    if state then
        isClick2=state;
    end
end

function showLayer(index)
    if index then
        mCurrentTab =index
    end
    if mCurrentTab==1 then
	   --[[ local action = CCSequence:actionOneTwo(CCDelayTime:actionWithDuration(0.2),CCCallFunc:actionWithScriptFuncName("ChatLayer.cc"))
	    mScene:runAction(action);]]
	    isClick2=nil
        setList();
      -- actionLayer.Action9001(mScene,false)
        updateChatTypeLayer(ChatListConfigInfo.RecordInfos);
    elseif mCurrentTab==2 then
        isClick2=true;
        setList();
        actionLayer.Action9003(mScene,nil)
      --  PrivateChatLayer.getMessage(mScene)
       -- updateChatTypeLayer();
    end
end
--[[function cc()
        setList();
       actionLayer.Actio   n9001(mScene,false)
end]]
--���������б�
function updateChatTypeLayer(table)
    local mtable=table
   if mCurrentTab==1 then
    elseif mCurrentTab==2 then
        local table=PrivateChatLayer.getChatMessage();
        mtable=table[1]
    end
    mlist:clear();
	local layout = CxLayout()
	layout.val_x.t = ABS_WITH_PIXEL
	layout.val_y.t = ABS_WITH_PIXEL
	layout.val_x.val.pixel_val = 0
	layout.val_y.val.pixel_val = 0
	for k,v in ipairs(mtable) do 
	    local layer=CCLayer:create();
        local listItem=ScutCxListItem:itemWithColor(ccc3(0,0,0))
        listItem:setDrawTopLine(false)
        listItem:setOpacity(0)
        --
        local content=nil;
        if mCurrentTab ==1 then
            content=JiShiChatLayout(v);
        elseif mCurrentTab ==2 then
            content=JchatRecordLayout(1,k)
        end
        --
        mlist:setRowHeight(content:getContentSize().height+SY(5));
        -----
        if mCurrentTab ==1 then
            local listsize = CCSize(mlist:getContentSize().width,content:getContentSize().height+SY(5))
            local btn=UIHelper.createActionRect(listsize,ChatLayer.sendUpdateAction,v.ChatID )
            btn:setScaleX(listsize.width/btn:getContentSize().width)
            btn:setScaleY(listsize.height/btn:getContentSize().height)
            btn:setAnchorPoint(PT(0,0))
            btn:setPosition(PT(0,0))
            layer:addChild(btn, 1)
        end
        layer:addChild(content,1)
        listItem:addChildItem(layer,layout);
        if mCurrentTab ==2 then
            mlist:addListItem(listItem,true)
        else
         mlist:addListItem(listItem,false)
        end
	end
end
----�����Ϣ
function addMsg(ChatType,index)
    if ChatType and index then
    local listItem = ScutCxListItem:itemWithColor(ccc3(0,0,0))
    listItem:setOpacity(0);

    local record = JchatRecordLayout(ChatType,index)

    local layout = CxLayout()
    layout.val_x.t = ABS_WITH_PIXEL
    layout.val_y.t = ABS_WITH_PIXEL
    layout.val_x.val.pixel_val = 0
    layout.val_y.val.pixel_val = 0
    mlist:setRowHeight(record:getContentSize().height + SY(5))
    listItem:addChildItem(record, layout)
    mlist:addListItem(listItem, true)
    end
end
--
--�ر�ʱ����Ӧ�¼�
function timerClose()
--	CCScheduler:sharedScheduler():unscheduleScriptFunc("ChatLayer.timer")
end


--��ʱ����ͨ�ý���
function JiShiChatLayout(v)
		local layer = CCLayer:create()
        ----
        local str=string.format("<label color='%d,%d,%d'>%s</label>",86,26,0,v.ChatContent)
        local content=ZyMultiLabel:new(str,mlist:getContentSize().width,FONT_NAME,FONT_SM_SIZE);
        content:addto(layer,1);
	    layer:setContentSize(SZ(mlist:getContentSize().width, content:getContentSize().height+SY(5)));
        content:setPosition(PT(0,layer:getContentSize().height-content:getContentSize().height))
        --�»���
         local bgEmpty= CCSprite:create(P(Image.panle_1016_1));
        bgEmpty:setScaleX(mlist:getContentSize().width/bgEmpty:getContentSize().width)--�������ű���
        bgEmpty:setScaleY(0.5)--�������ű���
        bgEmpty:setAnchorPoint(PT(0,0))--���ö�������
        bgEmpty:setPosition(PT(0,0))--����ͼƬ����
        layer:addChild(bgEmpty,0)
        ---
        return layer
end
--�����¼
function JchatRecordLayout(type,index)
	local layer = CCLayer:create()
    local mtable=PrivateChatLayer.getLocalMessage(type)[index]
    if mtable.UserID==nil then
        return layer;
    end
    local xmlContent="";
	local myselfContent=string.format("<label color='%d,%d,%d' >%s</label>",86,26,0,Language.CHAT_ME);--��
	local sayPoint=string.format("<label color='%d,%d,%d' >%s</label>",86,26,0,Language.CHAT_SAY);--˵��
	local forPoint=string.format("<label color='%d,%d,%d' >%s</label>",86,26,0,Language.CHAT_FOR);--��
	----
    if mtable.UserName ==personalInfo._NickName then  --�������Լ���ʱ��
        xmlContent=xmlContent.. myselfContent;--��
    else
        if index then
                xmlContent=xmlContent.. string.format("<label color='%d,%d,%d' >%s</label>",86,26,0,mtable.UserName);--����˵
        end
    end
		xmlContent=xmlContent..  sayPoint;--��˵,���߱���˵
    -----
	--��Ϣ����
	if string.sub(mtable.Content,1,1) == "<" then --����ҶԻ�ʱ��
		xmlContent=xmlContent..mtable.Content;
	else
		xmlContent=xmlContent..string.format("<label color='%d,%d,%d' >%s</label>",86,26,0,mtable.Content);
	end
	xmlContent=xmlContent..string.format("<label color='%d,%d,%d'>%s</label>",86,26,0,"("..mtable.SendDate..")")	--ʱ����ɫ
	xmlContent = string.gsub(xmlContent,"<label >%s*</label>","")
	local ndMultiLabe=ZyMultiLabel:new(xmlContent,mlist:getContentSize().width,FONT_NAME,FONT_SM_SIZE,nil,nil);
	layer:setContentSize(SZ(mlist:getContentSize().width, ndMultiLabe:getContentSize().height+SY(5)));
    ndMultiLabe:setPosition(PT(SX(0),layer:getContentSize().height-ndMultiLabe:getContentSize().height))
    ndMultiLabe:addto(layer);
    --�»���
	 local bgEmpty= CCSprite:create(P(Image.panle_1016_1));
	bgEmpty:setScaleX(mlist:getContentSize().width/bgEmpty:getContentSize().width)--�������ű���
    bgEmpty:setScaleY(0.5)--�������ű���
	bgEmpty:setAnchorPoint(PT(0,0))--���ö�������
	bgEmpty:setPosition(PT(0,0))--����ͼƬ����
	layer:addChild(bgEmpty,0)
	return layer
end
function close3()
    if mLayer then --�㻹û���ͷŵ�
        mScene:removeChild(mLayer,true)
        mLayer=nil;
    end
    mScene=nil;
end
-- ����ص�
function networkCallback(pScutScene, lpExternalData)
	local actionID = ZyReader:getActionID()
	local userData = ZyRequestParam:getParamData(lpExternalData)
end