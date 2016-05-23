--
-- MainSceneNetCallback.lua.lua
-- 91War
--
-- Created by LinKequn on 8/30/2011.
-- Copyright 2008 ND, Inc. All rights reserved.
--

module("MainSceneNetCallback", package.seeall)

-- �������õ��ĳ�Ա����Ҫ���ļ�ͷ���������������ӱ�Ҫ��˵��
-- ��Ա����ͳһ���»��߿�ʼ�����ӵ�����ĸҪСд


---------------���нӿ�(�������������̶����øı�)--------

-- ����ص�
function netCallBack(pScutScene, lpExternalData)
	local actionID=ZyReader:getActionID()

	if actionID>=3000 then
		_3000netCallBack(pScutScene, lpExternalData)
	elseif  actionID>=2000 then
		 _2000netCallBack(pScutScene, lpExternalData)
	elseif  actionID>=1000 then
		_1000netCallBack(pScutScene, lpExternalData)
	end

end


function _1000netCallBack(pScutScene, lpExternalData)
	local actionID=ZyReader:getActionID()
	--[[if actionID==9001 then--9001_��ʱ�����б�ӿڣ�ID=9001��
		ChatLayer.networkCallback(pScutScene, lpExternalData)]]
	if actionID==1008 then--9002_���췢�ͽӿڣ�ID=9002��
	  	MainScene.netCallBack(pScutScene, lpExternalData)
	end
end

function _3000netCallBack(pScutScene, lpExternalData)
	local actionID=ZyReader:getActionID()
	--[[if actionID==9001 then--9001_��ʱ�����б�ӿڣ�ID=9001��
		ChatLayer.networkCallback(pScutScene, lpExternalData)]]
	if actionID==9002 then--9002_���췢�ͽӿڣ�ID=9002��
		PrivateChatLayer.networkCallback(pScutScene, lpExternalData)
	elseif actionID==9003 then-- 9003_�����¼�б�ӿڡ���ɡ���ID=9003��
		PrivateChatLayer.networkCallback(pScutScene, lpExternalData)
	elseif actionID==9203 then-- 9003_�����¼�б�ӿڡ���ɡ���ID=9003��
		ActivityNoticLayer.networkCallback(pScutScene, lpExternalData)
	end
end

function gotoGameDesk()
			local roomID=MainScene.getRoomID()
			MainDesk.setRoomID(roomID)
			MainDesk.initScene()
end;

function _2000netCallBack(pScutScene, lpExternalData)
	local actionID=ZyReader:getActionID()
	local userData = ZyRequestParam:getParamData(lpExternalData)
	if actionID==2001 then--9001_��ʱ�����б�ӿڣ�ID=9001��
	    	if ZyReader:getResult() == eScutNetSuccess then
	    		local GameCoin = ZyReader:getInt(); 
	    		PersonalInfo.getPersonalInfo()._GameCoin=GameCoin    
 			gotoGameDesk(GameCoin)
		elseif ZyReader:getResult() ==1 then
			local box = ZyMessageBoxEx:new()
			box:doQuery(pScutScene,nil,Language.TIP_ESCAPE1,Language.IDS_SURE,Language.IDS_CANCEL,leaveRoom)	
		elseif ZyReader:getResult() ==3 then
	    		local GameCoin = ZyReader:getInt(); 
	    		PersonalInfo.getPersonalInfo()._GameCoin=GameCoin    
	    		MainDesk.firstGetGameCoin(ZyReader:readErrorMsg())
 			gotoGameDesk(GameCoin)
		else
--			ZyToast.show(pScutScene, ZyReader:readErrorMsg(),1,0.2)	
			local box = ZyMessageBoxEx:new()
			box:doQuery(pScutScene,nil, ZyReader:readErrorMsg(),Language.IDS_SURE,Language.IDS_CANCEL,gotoshop)	
		end
	end
end

function leaveRoom(clickedButtonIndex)
	if clickedButtonIndex ==1 then
		MainHelper.leaveAction()
	end
end;

function gotoshop(clickedButtonIndex)
	if clickedButtonIndex ==1 then
		ShopScene.createScene(2)
	end
end;
