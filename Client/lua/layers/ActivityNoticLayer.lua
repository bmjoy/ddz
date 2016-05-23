--
-- ActivityNoticLayer.lua.lua
-- Author     : Chensy
-- Version    : 1.0
-- Date       :
-- Description: �����
--

module("ActivityNoticLayer", package.seeall)

-- �������õ��ĳ�Ա����Ҫ���ļ�ͷ���������������ӱ�Ҫ��˵��
-- ��Ա����ͳһ���»��߿�ʼ�����ӵ�����ĸҪСд

local mScene = nil 		-- ����
local noMsg=nil;
local activityNoticMlist=nil;--list
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

---�رս���
function closeAction()
  	if activityNoticMlist then
  	    activityNoticMlist:clear();
  	end
    noMsg=nil;
    if mLayer then
        mScene:removeChild(mLayer,true)
        mLayer=nil;
    end
    mScene=nil;
end

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
function createScene(scene)
    if scene then
        mScene=scene;
    end
   mLayer=CCLayer:create();
   mScene:addChild(mLayer,9)
	-- �˴���ӳ�����ʼ����
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
	--����
	local detailBg= CCSprite:create(P("common/panle_1072.png"));
	detailBg:setAnchorPoint(PT(0,0))
	detailBg:setScaleX(pWinSize.width/detailBg:getContentSize().width)
	detailBg:setScaleY(pWinSize.height/detailBg:getContentSize().height)
	detailBg:setPosition(PT(0,0))
	mLayer:addChild(detailBg,0)
	--�뿪��ť
	local exitBtn=ZyButton:new("button/panle_1014_3.png",nil,nil, nil,FONT_NAME,FONT_SM_SIZE)
	exitBtn:setAnchorPoint(PT(0,0))
	exitBtn:setPosition(PT(pWinSize.width-exitBtn:getContentSize().width,pWinSize.height-exitBtn:getContentSize().height-SY(3)))
	exitBtn:registerScriptTapHandler(closeAction)
	exitBtn:addto(mLayer)
    ---
  	if activityNoticMlist then
  	    mLayer:removeChild(activityNoticMlist,true)
  	    activityNoticMlist=nil;
  	end
	local listSize = SZ(pWinSize.width*0.9,pWinSize.height*0.75)

	local listRowH=listSize.height/5
	local colW=listSize.width*0.9
	
	activityNoticMlist = ScutCxList:node(listSize.height, ccc4(24, 24, 24, 0), listSize)
	activityNoticMlist:setAnchorPoint(PT(0, 0))
	activityNoticMlist:setTouchEnabled(true)
	activityNoticMlist:setPosition(PT(pWinSize.width*0.05, pWinSize.height*0.1))
	mLayer:addChild(activityNoticMlist,0)
	
    ---
    
    noMsg=CCLabelTTF:create("",FONT_NAME,FONT_SM_SIZE);
    noMsg:setAnchorPoint(PT(0.5,0.5));
    noMsg:setPosition(PT(activityNoticMlist:getContentSize().width/2,activityNoticMlist:getContentSize().height/2));
    activityNoticMlist:addChild(noMsg,1);
    
    actionLayer.Action9203(mScene,nil,1,100)
   -- updateActivityNoticMlist();--��������
end
function updateActivityNoticMlist(mtable)
    --[[local mtable={[1]={Title="facai",SendDate="2013-12-01",Content="CCXXOO"},
        [2]={Title="facai",SendDate="2013-12-01",Content="CCXXOO"},
        [3]={Title="facai",SendDate="2013-12-01",Content="CCXXOO"},}]]
    
    activityNoticMlist:clear();
	local layout = CxLayout()
	layout.val_x.t = ABS_WITH_PIXEL
	layout.val_y.t = ABS_WITH_PIXEL
	layout.val_x.val.pixel_val = 0
	layout.val_y.val.pixel_val = 0
    if #mtable>0 then
        noMsg:setString("")
        for k,v in ipairs(mtable) do
            local listItem = ScutCxListItem:itemWithColor(ccc3(0,0,0))
            listItem:setOpacity(0);
            ----
            local  content = createNoticeMessage(v);--�������칫����Ϣ
            activityNoticMlist:setRowHeight(content:getContentSize().height + SY(10))
            listItem:addChildItem(content, layout)
            activityNoticMlist:addListItem(listItem, false)
        end
    else
        noMsg:setString(Language.NOTICE_ZANWUGONGAO)--���޹���
    end
    
end
--��������ͨ�ý���
function createNoticeMessage(v)
	local layer = CCLayer:create()
	local layerSize=SZ(0,0)
	layerSize.width=activityNoticMlist:getContentSize().width
	--local title=string.format(Language.CHAT_KUANG,)..string.format("(%s)",message.SendDate)
    local title=string.format(Language.NOTICE_NAME,v.Title)..string.format("(%s)",v.SendDate)
--[[	local label=CCLabelTTF:create(title,FONT_NAME,FONT_SM_SIZE)
	label:setAnchorPoint(PT(0,1))
	label:setColor(ccYELLOW)]]
--	local str=v.Content
	local xmlContent=string.format("<label color='%d,%d,%d'>%s</label>",255,255,0,title.."\r\n")..string.format("<label >%s</label>",v.Content)
	local ndMultiLabe=ZyMultiLabel:new(xmlContent,layerSize.width*0.98,FONT_NAME,FONT_SM_SIZE)
			    --����ͼƬ
	local bgEmpty= CCSprite:create(P(Image.panle_1016_1));
	layerSize.height=ndMultiLabe:getContentSize().height+SY(5)+bgEmpty:getContentSize().height
	bgEmpty:setScaleX(layerSize.width/bgEmpty:getContentSize().width)--�������ű���
	-- bgEmpty:setScaleY(0.5)--�������ű���
	bgEmpty:setAnchorPoint(PT(0,0))--���ö�������
	bgEmpty:setPosition(PT(0,0))--����ͼƬ����
	layer:addChild(bgEmpty,0)

	layer:setContentSize(layerSize)
	--label:setPosition(PT(0,layerSize.height))
	ndMultiLabe:setPosition(PT(0,layerSize.height-ndMultiLabe:getContentSize().height))
	ndMultiLabe:addto(layer,0)
--	layer:addChild(label,0)
	return layer
end

-- ����ص�
function networkCallback(pScutScene, lpExternalData)
	local actionID = ZyReader:getActionID()
	local userData = ZyRequestParam:getParamData(lpExternalData)
	if actionID==9203 then
        local table=actionLayer._9203Callback(pScutScene, lpExternalData)
    --[[  local table={[1]={Title="facai",CreateDate="2013-12-01",Content="CCXXOO"},
        [2]={Title="facai",CreateDate="2013-12-01",Content=Language.TOP_TIP},
        [3]={Title="facai",CreateDate="2013-12-01",Content="CCXXOO"},}]]
        if table then
            updateActivityNoticMlist(table.RecordTabel)
        end
	end
end