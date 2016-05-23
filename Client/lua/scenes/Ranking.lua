--
-- Ranking.lua.lua
-- Author     : Chensy
-- Version    : 1.0
-- Date       :
-- Description: ����ϵͳ

module("Ranking", package.seeall)

-- �������õ��ĳ�Ա����Ҫ���ļ�ͷ���������������ӱ�Ҫ��˵��
-- ��Ա����ͳһ���»��߿�ʼ�����ӵ�����ĸҪСд
local mScene = nil 		-- ����
local mCurrentTab=nil;--tab
local allTable={};
local noMsg=nil;--�Ƿ�����Ϣ
local layoutLayer=nil;--ͨ�ò�
local exPlainLayer=nil;--˵����
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

--˵����ť��Ҫ�ر��¼�
function explainCloseBtnAction()
    if exPlainLayer then
        mLayer:removeChild(exPlainLayer,true)
        exPlainLayer=nil;
    end
end
--�رհ�ť��Ҫ�¼�
function closeBtnActon()
    releaseResource()--�ͷ���Դ
    SlideInRPopScene()
    if mLayer then
        mScene:removeChild(mLayer,true);
        mLayer=nil;
    end
	mScene=nil
end
--
-------------------------˽�нӿ�------------------------
--
-- ��ʼ����Դ����Ա����
function initResource()
allTable={} 
end
-- �ͷ���Դ
function releaseResource()
    allTable=nil;
    if mList then
        mList:clear();
        mList=nil;
    end
    releaseLayer()--�ͷŵ���
end
-- ��������
function createScene()
    initResource()
	local scene  = ScutScene:new()
	-- ע������ص�
	scene:registerCallback(networkCallback)
    mScene = scene.root
	-- �˴���ӳ�����ʼ����
    mLayer = CCLayer:create()
	mScene:addChild(mLayer, 0)
	----
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
    --���ذ�ť
    local closeBtn=ZyButton:new(P(Image.image_exit));
    closeBtn:setAnchorPoint(PT(1,0.5));
    closeBtn:setPosition(PT(pWinSize.width-closeBtn:getContentSize().width/2,pWinSize.height-closeBtn:getContentSize().height*0.8));
    closeBtn:registerScriptTapHandler(closeBtnActon);
    closeBtn:addto(mLayer);
    --˵����ť
    local explainBtn=ZyButton:new(P(Image.image_help))
    explainBtn:setAnchorPoint(PT(0.5,0.5));
    explainBtn:setPosition(PT(pWinSize.width*0.8,closeBtn:getPosition().y));
   -- explainBtn:setScaleX(0.8)
    explainBtn:registerScriptTapHandler(explainBtnAction)
   -- explainBtn:addImage(Image.button_1006);--˵��ͼ��
    explainBtn:addto(mLayer,1);
    ---
    if not mCurrentTab then
        mCurrentTab=1;
    end
    --Tab --������,ʤ������
   -- local tabName={Language.RANKING_JINDOUPAIMING,Language.RANKING_SHENGLVPAIMING}
    local tabName={Image.button_1028,Image.button_1029}  
 --   createTabBar(tabName);--�������ⰴť
    showLayer(mCurrentTab);
    ----
   	 SlideInLPushScene(mScene)
   --[[ MainScene.releseMainScene();
    local runningScene = CCDirector:sharedDirector():getRunningScene()
    if runningScene == nil then
		CCDirector:sharedDirector():runWithScene(mScene);
    else
		CCDirector:sharedDirector():replaceScene(mScene);
    end]]
end
--Tab
function createTabBar(tabName)
    tabBar = ZyTabBar:new(Image.image_shop,Image.image_shop_1,tabName, FONT_NAME, FONT_SM_SIZE,2);
    tabBar:addto(mLayer)
    tabBar:setCallbackFun(callbackTabBar);  --�����Ӧ���¼�
    tabBar:selectItem(mCurrentTab);           --����ĸ���ť
--    tabBar:setPosition(PT(SX(20),pWinSize.height-tabBar:getContentSize().height-SY(8)))   
    tabBar:setPosition(PT(SX(23),pWinSize.height*0.86-SY(1)))   
end
--tabbar
function callbackTabBar(bar,pNode,tag)
	local index=pNode:getTag();
	if index ~=mCurrentTab then
		mCurrentTab=index;
		showLayer(mCurrentTab);
	end
end
function showLayer(index)
    if index then
        mCurrentTab =index
    end
    releaseLayer();--�ͷŲ�
    if mCurrentTab ==1 then 
        showLayout();
        actionLayer.Action1019(mScene,nil,mCurrentTab,1,200)
    --    update()--��������
    elseif mCurrentTab ==2 then
        showLayout();
        actionLayer.Action1019(mScene,nil,mCurrentTab,1,200)
       -- update()--��������
    end
end
--�ͷŲ�
function  releaseLayer()
    allTable={};
    if layoutLayer then
        mLayer:removeChild(layoutLayer,true)
        layoutLayer=nil;
    end
end
function showLayout()
    -------
    if layoutLayer then
        mLayer:removeChild(layoutLayer,true)
        layoutLayer=nil;
    end
    layoutLayer=CCLayer:create()
    mLayer:addChild(layoutLayer,1)
    local simpleW=(pWinSize.width*0.8)/3;  --ÿ����Ҫ���ٿ��
    local Bg=CCSprite:create(P(Image.panle_1019_1_9));
    local scalex=simpleW/Bg:getContentSize().width;
    local scaleList={0.7,1.1,1.2}--�������е��б�����
    local cursor=pWinSize.width*0.1;
    local listBgStartY=pWinSize.height*0.75;
    allTable.ranKingTitlePos={};--λ��
    allTable.biliSize={};--ÿһ������ı�����С

    local table=nil;
    if mCurrentTab==1 then
        --����--�ǳ�--��
        table={Language.RANKING_MINGCI,Language.RANKING_NICHEN,Language.RANKING_JINDOU}
    elseif mCurrentTab ==2 then
        --����--�ǳ�--ʤ��
        table={Language.RANKING_MINGCI,Language.RANKING_NICHEN,Language.RANKING_SHENGLV}
    end
   ----
   allTable.title={}
   for i,v in ipairs(table) do  
       local temp=scaleList[i];
       local textlabel=CCLabelTTF:create(v,FONT_NAME,FONT_SM_SIZE);
       textlabel:setAnchorPoint(PT(0.5,0));
       textlabel:setColor(ccRED1)
       textlabel:setPosition(PT(cursor+simpleW*temp/2,listBgStartY+SY(2)))
       allTable.ranKingTitlePos[i]=(textlabel:getPosition().x);
       allTable.biliSize[i]=simpleW*scaleList[i]
       cursor=cursor+(simpleW*scaleList[i])
        layoutLayer:addChild(textlabel,1)
        allTable.title[i]=textlabel
    end
    --mlils
    if mList then
        layoutLayer:removeChild(mList,true)
        mList=nil;
    end
    
    mList=ScutCxList:node(pWinSize.height*0.63/4,ccc4(124, 124, 124, 255),SZ(pWinSize.width*0.8,pWinSize.height*0.63));
	mList:setPosition(PT(pWinSize.width*0.1,listBgStartY-pWinSize.height*0.63));
    mList:setSelectedItemColor(ccc3(0, 70, 65), ccc3(0, 70, 65))
    --mList:registerItemClickListener(SportScene.gotoPlayer); --�б����
    mList:setTouchEnabled(true)
    layoutLayer:addChild(mList,1);
    
    ---��Ϣ
    noMsg=CCLabelTTF:create("",FONT_NAME,FONT_SM_SIZE)
    noMsg:setAnchorPoint(PT(0.5,0.5));
    noMsg:setPosition(PT(pWinSize.width*0.5,pWinSize.height*0.46))
    layoutLayer:addChild(noMsg,1);

end
--��������
function update(mtable)
   --[[ mtable={};
    mtable={[1]={mc=1,name="cxx",money="777777"},[2]={mc=2,name="cxx",money="777777"},
[3]={mc=3,name="cxx",money="777777"},[4]={mc=4,name="cxx",money="7778777"},
[5]={mc=5,name="cxx",money="7778777"},}]]
 
    mList:clear();
    if #mtable<=0 then
        noMsg:setString(Language.RANKING_ZANWUPAIMING);--��������
        noMsg:setColor(ccRED1)
        ---
        for k,v in ipairs(allTable.title) do 
            v:getParent():removeChild(v, true)
            v = nil
        end
    else
        noMsg:setString("")
    end
	local layout = CxLayout()
	layout.val_x.t = ABS_WITH_PIXEL
	layout.val_y.t = ABS_WITH_PIXEL
	layout.val_x.val.pixel_val = 0
	layout.val_y.val.pixel_val = 0
	----
       for i,v in ipairs(mtable) do 
            local listItem=ScutCxListItem:itemWithColor(ccc3(0,0,0))
            listItem:setDrawTopLine(false)
            listItem:setOpacity(0)
            mList:addListItem(listItem,false)

            local table=nil
            if mCurrentTab==1 then
                --����--�ǳ�--��
                table={v.RankID,v.NickName,v.GameCoin }
            elseif mCurrentTab ==2 then
                --����--�ǳ�--ʤ��
                table={v.RankID,v.NickName,v.Wining }
            end
            for k,v in ipairs(table) do 
                --������
                local bgEmpty= CCSprite:create(P(Image.panle_1019_1_9));
                bgEmpty:setScaleX(allTable.biliSize[k]*0.95/bgEmpty:getContentSize().width)--�������ű���
                bgEmpty:setAnchorPoint(PT(0.5,0.5))--���ö�������
                bgEmpty:setPosition(PT(allTable.ranKingTitlePos[k]-mList:getPosition().x,pWinSize.height*0.63/4/2))--����ͼƬ����
                listItem:addChild(bgEmpty,0)
             --[[   if k==1 and v==1 or v==2 or v==3 then
                    local successImg=CCSprite:create(P(Image.icon_1015));
                    successImg:setAnchorPoint(PT(0.5,0.5))--���ö�������
                    successImg:setPosition(PT(allTable.ranKingTitlePos[k]-mList:getPosition().x,pWinSize.height*0.63/4/2))--����ͼƬ����
                    listItem:addChild(successImg,0)
                else]]
                    local value=CCLabelTTF:create(v,FONT_NAME,FONT_SM_SIZE)
                    value:setAnchorPoint(PT(0.5,0.5));
                    value:setPosition(PT(allTable.ranKingTitlePos[k]-mList:getPosition().x,pWinSize.height*0.63/4/2));
                    listItem:addChild(value,0);
              --  end
            end
            --------
            
        end
        
end
--˵����ť��Ҫ�¼�
--˵����ť��Ҫ�¼�
function explainBtnAction()
    if exPlainLayer then
        mLayer:removeChild(exPlainLayer,true)
        exPlainLayer=nil;
    end
    exPlainLayer=CCLayer:create();
    mLayer:addChild(exPlainLayer,2)
    -----
    --͸������
    local transparentBg=Image.tou_ming;--����ͼƬ
    local menuItem =CCMenuItemImage:itemFromNormalImage(P(transparentBg),P(transparentBg));
    local menuBg=CCMenu:menuWithItem(menuItem);
    menuBg:setContentSize(menuItem:getContentSize());
    menuBg:setAnchorPoint(CCPoint(0,0));
    menuBg:setScaleX(pWinSize.width/menuBg:getContentSize().width*2)
    menuBg:setScaleY(pWinSize.height/menuBg:getContentSize().height*2);
    menuBg:setPosition(CCPoint(0,0));
    exPlainLayer:addChild(menuBg,0);
    ---
   --[[ local explainBg=CCSprite:create(P(Image.panle_1014_1));
    explainBg:setAnchorPoint(PT(0.5,0.5))
    explainBg:setPosition(PT(pWinSize.width/2,pWinSize.height/2));
    exPlainLayer:addChild(explainBg,1)]]
	--����
	local explainBg= CCSprite:create(P("common/panle_1015.9.png"));
	explainBg:setAnchorPoint(PT(0,0))
	explainBg:setScaleX(pWinSize.width*0.5/explainBg:getContentSize().width)
	explainBg:setScaleY(pWinSize.height*0.6/explainBg:getContentSize().height);
	explainBg:setPosition(PT((pWinSize.width-pWinSize.width*0.5)/2,(pWinSize.height-pWinSize.height*0.6)/2))
	exPlainLayer:addChild(explainBg,0)
    ----�رհ�ť
    local explainCloseBtn=ZyButton:new(P(Image.image_button_small_0),P(Image.image_button_small_1),nil,Language.IDS_OK,FONT_NAME,FONT_SM_SIZE)
    explainCloseBtn:setAnchorPoint(PT(0.5,0))
    explainCloseBtn:setPosition(PT(explainBg:getPosition().x+pWinSize.width*0.25,explainBg:getPosition().y+pWinSize.height*0.04));
    explainCloseBtn:registerScriptTapHandler(Ranking.explainCloseBtnAction)
    explainCloseBtn:addto(exPlainLayer,1);
    ----
    local list = ScutCxList:node(pWinSize.height*0.54*0.7, ccc4(24, 24, 24, 255), SZ(pWinSize.width*0.5*0.8,pWinSize.height*0.54*0.7))
	list:setPosition(PT(explainBg:getPosition().x+pWinSize.width*0.5*0.1,explainCloseBtn:getPosition().y+explainCloseBtn:getContentSize().height+SY(5)));
	list:setSelectedItemColor(ccc3(5, 93, 183), ccc3(8, 85, 163));
	exPlainLayer:addChild(list,1);
    ---˵������
    local content=string.format("<label color='%d,%d,%d'>%s</label>",241,176,63,Language.RANKING_SHUOMING.."\r".."\r\n")
                   ..string.format("<label color='%d,%d,%d'>%s</label>",241,176,63,Language.RANKING_SHUOMING2.."\r\n")
    local explainContent=ZyMultiLabel:new(content,pWinSize.width*0.5*0.8,FONT_NAME,FONT_SM_SIZE,nil,nil);
    local listItem = ScutCxListItem:itemWithColor(ccc3(45,85,89));
    listItem:setOpacity(0);
    listItem:setDrawSelected(true);
    list:setRowHeight(explainContent:getContentSize().height)
    explainContent:addto(listItem,0)
	list:addListItem(listItem, false)  
	list:setTouchEnabled(true)
end

-- ����ص�
function networkCallback(pScutScene, lpExternalData)
	local actionID = ZyReader:getActionID()
	local userData = ZyRequestParam:getParamData(lpExternalData)
	if actionID==1019 then
	    local table=actionLayer._1019Callback(pScutScene, lpExternalData)
	    if table then
	        update(table.RecordTabel)--��������
	    end
	end
end