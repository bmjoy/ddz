
------------------------------------------------------------------
-- HumanCard.lua
-- Author     : ZongLin Liu
-- Version    : 1.15
-- Date       :
-- Description: ������ ��������
------------------------------------------------------------------



HumanCard = {
	_parent=nil,
	_sprite = nil,

	_layer_num = nil,--�ڵڼ���
	_name="",
	_tag = nil,
	_state = nil,--4վ��2��
	_move_x = nil,--Ŀ������
	_move_y = nil,
	_direction = nil,--����
	_headSpritePath=nil,
	_headSprite=nil,    --ͷ���ͼƬ

	_NameLabel=nil,
	_startX=nil,
	_startY=nil,


	_nameLabel=nil,
	_hpLabel=nil,
	_ememy=nil,
	_stateNum=nil,
 }



 --------------------------------------------------------------------
 -- ����ʵ��
function HumanCard:new()
	local instance = {}
	setmetatable(instance, self)
	self.__index = self
	return instance
end


function  HumanCard:createPlayer(parent,spr_name_string,speed,name,layerTag,Tag)
	self._SpritePath=spr_name_string
	self._parent=parent
	self._layer_num=layerTag
	self._name=name
	self._tag=Tag
	self._menberCallback = menberCallback
	self:init()
end;




--��ӵ���
function HumanCard:addto(parent, param1)
	if param1==nil then
		param1=0
	end
	parent:addChild(self._sprite,param1)
end;

--�Ƴ�
function HumanCard:remove()
    if self._sprite ~= nil then
      self._sprite:getParent():removeChild( self._sprite, true)
       self._sprite=nil
  --      self._sprite:removeFromParentAndCleanup(true)
    end
end;


function  HumanCard:getParent()
	return self._sprite:getParent()
end;
--��ȡ�����ǩ
function  HumanCard:getZOrder()
	return self._sprite:getZOrder()
end;

--���õڼ���
function HumanCard:reorderChild(layer,param1)
	if self._layer_num~=param1 and param1~=nil then
		layer:reorderChild(self._sprite,param1)
		self._layer_num=param1
	end;
end;

function HumanCard:setAnchorPoint(x,y)
	self._sprite:setAnchorPoint(PT(x,y))
end

function HumanCard:setPosition(xx,yy)
	self._sprite:setPosition(xx,yy)
end;

function  HumanCard:setOpacity(value)
	--self._sprite:setOpacity(value)
end;

--��ǰ����
function HumanCard:getPosition()
	return self._sprite:getPosition()
end;
--------------------------------------------------------------------------------

----------------��ʼ�����
function  HumanCard:init()

	local itemBg = CCSprite:create(P("common/list_1032.png"))
	itemBg:setAnchorPoint(PT(0,0))
	
	self._sprite = itemBg
	
	--��������
	if self._tag then
		itemBg:setTag(self._tag)
	end
	
	-- ����ͼƬ
	local momLabel = CCSprite:create(P("common/icon_8013.png"))
	momLabel:setAnchorPoint(CCPoint(0.5, 0))
	momLabel:setPosition(PT(itemBg:getContentSize().width*0.5, itemBg:getContentSize().height*0.2))
	itemBg:addChild(momLabel,0)
	
	momLabel:setIsVisible(false)
	
	self._momentum = momLabel

	
	
	
	-- ��ƷͼƬ
	if self._SpritePath then
		local imageLabel = CCMenuItemImage:itemFromNormalImage(P(self._SpritePath),P(self._SpritePath))
		imageLabel:setAnchorPoint(CCPoint(0.5, 0))
		imageLabel:setPosition(PT(itemBg:getContentSize().width*0.5, itemBg:getContentSize().height*0.2))
		itemBg:addChild(imageLabel,0)
	end


	--����
	if self._name then
		local nameLabel = CCLabelTTF:create(self._name, FONT_NAME, FONT_SM_SIZE)
		nameLabel:setAnchorPoint(PT(0.5, 0.5))
		nameLabel:setPosition(PT(itemBg:getContentSize().width*0.5, itemBg:getContentSize().height*0.12))
		itemBg:addChild(nameLabel, 0)
	end
	
	if self._layer_num == nil then
		self._layer_num = 0
	end

	if self._parent then
		self._parent:addChild(itemBg, self._layer_num)
	end

end




function HumanCard:setTag(tag)
	self._tag=tag
end;

--���õڼ���
function HumanCard:set_Layer_num(num)
	self._layer_num=num
end;


function  HumanCard:stopAction()
    if self._sprite then
	self._sprite:stopAllActions()
	--self._sprite:play(false)
	end
end;

--�������
function HumanCard:getTag()
	return self._tag
end;

--�����Ƿ���ʾ
function HumanCard:setIsVisible(parent)
	self._sprite:setIsVisible(parent)
end;

function HumanCard:getPosition()
	return self._sprite:getPosition()
end;

--�����ߴ�
function HumanCard:getContentSize()
	return self._sprite:getContentSize()
end;

--�ڵڼ���
function HumanCard:getLayer_num()
	return self._layer_num
end;

------
function HumanCard:getstate()
	return self._state
end;

function HumanCard:setScaleX (value)
	self._sprite:setScaleX(value)
	if self._nameLabel then
				self._nameLabel:setScaleX(value)
	end
	if self._direction~= value then
	    self._direction=value
	end
end;

--���þ��鷽��
function HumanCard:setScale(scale)
	self._sprite:setScale(scale)
end

function HumanCard:setScaleY (value)
	self._sprite:setScaleY(value)
	if self._sprite._nameLabel then
		self._sprite._nameLabel:setScaleY(value)
	end
end;


----------------------
function HumanCard:getAnchorPoint()
    return self._sprite:getAnchorPoint()
end

---------------
function HumanCard:getContentSize()
    return self._sprite:getContentSize()
end


---------ִ�ж���
function  HumanCard:runAction(act)
	self._sprite:runAction(act)
end;

--------------------
function  HumanCard:setScale(scale)
	self._sprite:setScale(scale)
end;

--��������
function HumanCard:setPosition(xx,yy)
	self._sprite:setPosition(PT(xx,yy))
end;

--�����Ƿ���ʾ
function HumanCard:setIsVisible(value)
	self._sprite:setIsVisible(value)
end;

function HumanCard:play_stop()
	self._sprite:play(false)
end



--�����ߴ�
function HumanCard:getContentSize()
	return self._sprite:getContentSize()
end;

--�����������
function HumanCard:get_spr()
	return self._sprite
end



---------------------------------����˵��dialogue
function  HumanCard:setDialogue(str)
    self:releaseDialogue()
	local sprite=CCSprite:create(P("common/list_3002.9.png"))
	local size=ZyFont.stringSize(str,sprite:getContentSize().width*0.9,FONT_NAME, FONT_FMM_SIZE)
	local spriteSize=sprite:getContentSize()
	local lb = CCLabelTTF:create(str, size, CCTextAlignmentLeft, FONT_NAME, FONT_FMM_SIZE)
	lb:setAnchorPoint(PT(0,1))
	local dialogueHeight=size.height+SY(20)
	if dialogueHeight>sprite:getContentSize().height then
			sprite:setScaleY(dialogueHeight/sprite:getContentSize().height)
			spriteSize.height=dialogueHeight
	end
	sprite:setAnchorPoint(PT(1,0))
	sprite:setPosition(PT(self._sprite:getPosition().x-self._sprite:getContentSize().width/2,
	self._sprite:getPosition().y+self._sprite:getContentSize().height))
	lb:setPosition(PT(sprite:getPosition().x-spriteSize.width+SX(5),
						sprite:getPosition().y+spriteSize.height-SY(5)))
	self._dialogBox=sprite
	self._dialogContent=lb
	self._parent:addChild(sprite,self._layer_num)
	self._parent:addChild(lb,self._layer_num+1)
end

function  HumanCard:releaseDialogue()
	if self._dialogBox~=nil then
		self._dialogBox:getParent():removeChild(self._dialogBox,true)
		self._dialogBox=nil
	end
	if self._dialogContent~=nil then
		self._dialogContent:getParent():removeChild(self._dialogContent,true)
		self._dialogContent=nil
	end
end;

-------------------------------��������
function  HumanCard:createQishiAnimation()
    if self._QishiAnimation==nil then
	local spr=ScutAnimation.CScutAnimationManager:GetInstance():LoadSprite("icon_1411")
	spr:play()
	self._QishiAnimation=spr
	self._sprite:addChild(spr,0)
	spr:setPosition(PT(0,0))
    end
end;

function  HumanCard:releaseQishiAnimation()
	if self._QishiAnimation~=nil then
		self._QishiAnimation:getParent():removeChild(self._QishiAnimation,true)
		self._QishiAnimation=nil
	end
end;



--15 ѣ��16 ��˯ 17���� 18��ʧ 19���� 20�ж�21 ��Ѫ  23���� 24	���Է���
function  HumanCard:addEffectImage(state)
	local stateEffectTable={[15]="icon_7200",[16]="icon_7201",[17]="icon_7202",[18]="icon_7203"
		,[19]="icon_7204",[20]="icon_7205",[21]="icon_7206",[23]="icon_7207",[24]="icon_7207"}
		
	if stateEffectTable[state] == nil then
		return
	end		
		
	local imagePath = string.format("battle/%s.png",stateEffectTable[state])
	if self._stateNum == nil then
		self._stateNum = 0
	end
	self._stateNum = self._stateNum+1
	
	if self._stateNum < 4 then--�����ʾ3��ͼ��
		local layer = CCLayer:create()
		
		local imageBg = CCSprite:create(P("battle/list_1135.png"))
		imageBg:setAnchorPoint(PT(0,0))
		local pos_x = self._sprite:getContentSize().width-imageBg:getContentSize().width*self._stateNum
		imageBg:setPosition(PT(pos_x,0))
		layer:addChild(imageBg, 0)
--		
		local stateImage = CCSprite:create(P(imagePath))
		stateImage:setAnchorPoint(PT(0.5,0.5))
		stateImage:setPosition(PT(imageBg:getContentSize().width*0.5, imageBg:getContentSize().height*0.55))
		imageBg:addChild(stateImage, 0)
		

		self._sprite:addChild(layer, 0)
		if self._stateTable == nil then
			self._stateTable = {}
		end
		self._stateTable[self._stateNum] = layer			
	end
	

	
end;

---------------------------------------------
function HumanCard:releaseEffectImage()
	if self._stateTable and #self._stateTable > 0 then
		
		for k,v in ipairs(self._stateTable) do
			v:getParent():removeChild(v, true)
			v =nil		
		end

	end
		self._stateTable = nil
		self._stateNum = 0	
end;







function HumanCard:setSpriteTag(tag)
	 self._sprite:setTag(tag)
end;


---�ӳٽ��з���
function delayExec(funName,nDuration, parent)
	local  action = CCSequence:actionOneTwo(
	CCDelayTime:actionWithDuration(nDuration),
	CCCallFuncN:actionWithScriptFuncName(funName));
	parent:runAction(action)
end


----------------------------
--����
function HumanCard:attack()
	delayExec("HumanCard.rotat",0.1, self)
	delayExec("HumanCard.rotatReset",0.3, self)	
end;

function HumanCard:rotat()
	self:setRotation(-10)
end;

function HumanCard:rotatReset()
	self:setRotation(0)
end;
------------------------

--����
function HumanCard:dodge(funName)
	if funName == nil then
		funName = ""
	end

	local action1 = CCMoveBy:actionWithDuration(0.1, PT(SX(50),0))
	local action2 = CCMoveBy:actionWithDuration(0.2, PT(-SX(50),0))
	local action3 = CCSequence:actionOneTwo(action1,action2)
	
	local action = CCSequence:actionOneTwo(action3,CCCallFuncN:actionWithScriptFuncName(funName));	


	self:runAction(action)
end;


------------------------------------------

--������ 
function HumanCard:defend()
	action1 = CCMoveBy:actionWithDuration(0.1, PT(0,100))
	action2 = CCMoveBy:actionWithDuration(0.2, PT(0,-100))
	
	action3 = CCSequence:actionOneTwo(action1,action2)	
	self:runAction(action3)
end;

-----
--������
function HumanCard:MomentumMax()
	self._momentum:setIsVisible(true)
end;

--���Ʋ���
function HumanCard:MomentumNotMax()
	self._momentum:setIsVisible(false)
end;

