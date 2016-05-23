--
-- PrivateChatLayer.lua
-- Author     : Chensy
-- Version    : 1.0
-- Date       :
-- Description: ����ӿڹ���
--

module("PrivateChatLayer", package.seeall)

-- �������õ��ĳ�Ա����Ҫ���ļ�ͷ���������������ӱ�Ҫ��˵��
-- ��Ա����ͳһ���»��߿�ʼ�����ӵ�����ĸҪСд

local _chatMessage = {};
local _allMessage={}
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

--
-------------------------˽�нӿ�------------------------
--
-- ��ʼ����Դ����Ա����
function initResource()
end
-- �ͷ���Դ
function releaseResource()
end
-- ����ʱ��Ϣ
function sendMessage(Scene,chatId)
	ZyWriter:writeString("ActionId", 9002)
	ZyWriter:writeString("ChatID",chatId)
	ZyExecRequest(Scene,nil, false)
end
-- ��ȡ��Ϣ
function getMessage(Scene)
	ZyWriter:writeString("ActionId", 9003)
 	ZyExecRequest(Scene, nil, false)
end
-- ����ص�
function networkCallback(pScutScene, lpExternalData)
	local actionID = ZyReader:getActionID()
	local userData = ZyRequestParam:getParamData(lpExternalData)
	if actionID ==9002 then----9002_���췢�ͽӿڣ�ID=9002��
        if ZyReader:getResult() == eScutNetSuccess then
            getMessage(pScutScene)
            ChatLayer.setIsClick(true)
            ChatLayer.closeBtnActon();
            sendState=true
        else         
		    ChatLayer.setIsClick(true) 
            ZyToast.show(pScutScene, ZyReader:readErrorMsg(),1,0.2)
        end
     elseif actionID ==9003 then--9003_�����¼�б�ӿڡ���ɡ���ID=9003��
         --[[  local table=actionLayer._9003Callback(pScutScene, lpExternalData)
           if table and #table.RecordTabel>0 then
             if ChatLayer.getIsClick2() then----�����ж��Ƿ����л�Tab��ʱ�������¼�Ǳ�
                ChatLayer.setIsClick2(false);
                ChatLayer.updateChatTypeLayer(table)
             else
                if sendState then--�����ж������Ƿ����������--trueδ�����������
                    sendState=nil;
                    for k,v in ipairs(table.RecordTabel) do
                        if MainDesk.getLayer() then
                            local layer=MainDesk.getLayer()
                            ZyToast.show2(layer,v.Content,1,0.3)
                        end
                    end
                else
                    for k,v in ipairs(table.RecordTabel) do 
                        ChatLayer.addMsg(v,k)
                        if MainDesk.getLayer() then
                            local layer=MainDesk.getLayer()
                            ZyToast.show2(layer,v.Content,1,0.3)
                        end
                    end
                end
             end
           end]]
	 end
end
--����һ����Ϣ
function appendLocalMessage(messageType,message)
	if _chatMessage[messageType] == nil then
		_chatMessage[messageType]={};
	end
	if _allMessage[messageType]==nil then--˵�е���Ϣ
		_allMessage[messageType]={};
	end
	--
	local messageInfo={};
	if message then
        ----
            for i,v in pairs(message) do 
	            messageInfo[i]=v;
	        end
	        messageInfo.index=#_allMessage[messageType]+1;
            table.insert(_allMessage[messageType],messageInfo)
        ---
	end
        if  messageType==1 then--����100 ɾ����һ�� ����Ϊ�ۺϵ�ʱ��
            if #_chatMessage[messageType] >=100 then
                removeMessage(messageType,1)
            end
        else---����30 ɾ����һ�� ���Ͳ����ۺϵ�ʱ��
	   end
	table.insert(_chatMessage[messageType],messageInfo)
end
--ɾ��һ����Ϣ --30������
function removeMessage(messageType,index)
	if _chatMessage[messageType] then
		table.remove(_chatMessage[messageType],index);
	end
end
--��Ϣά��
function getLocalMessage(messageType)
	if messageType then
		if _chatMessage[messageType] then
			return _chatMessage[messageType];
		else
			return {};
		end
	else
		return _chatMessage;
    end
end

function getChatMessage()
    return _chatMessage;
end

function  clearMessage()
    _chatMessage={};
    _allMessage={}
    personalInfo=nil;
end