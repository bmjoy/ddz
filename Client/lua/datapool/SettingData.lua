
-- SettingData.lua.lua
-- Author     :Lysong
-- Version    : 1.0.0.0
-- Date       :
-- Description:
------------------------------------------------------------------

module("SettingData", package.seeall)

-- �û�������Ϣ
local SettingData = {}

--����������Ϣ
local LocalSettingData = {
   {EnumValue = 1,IsInUse  = 1},  -- ������Ч
   {EnumValue = 2,IsInUse  = 1},       -- ��������
 }
 
 local LocalPeopleData = {
   {EnumValue = 1,IsInUse  = 0},  
   {EnumValue = 2,IsInUse  = 15},       
 }
 
 -------------��ʾ����
 function  saveShowPlayer(state)
	  if state ~= nil then
		return saveConfig("sys/config.ini", "system", "ShowState" , state)
	end
end;

function getShowPlayer()
	local result = getConfig("sys/config.ini", "system", "ShowState")
	if not tonumber(result) or tonumber(result) == 0 then
		return false
	else
		return result
	end
end

 --------
function saveMusicConfig(nConfig)
    if nConfig ~= nil then
		return saveConfig("sys/config.ini", "system", "isPlayMusic" , nConfig)
	end
end

function getMusicConfig()
	local result = getConfig("sys/config.ini", "system", "isPlayMusic")
	if not tonumber(result) or tonumber(result) == 0 then
		return false
	else
		return true
	end
end


-- �������ã��ļ��������⡢key��value
function saveConfig(sFileName, sTitle, key , value)
	if value ~= nil then
		local pIni = ScutDataLogic.CLuaIni:new()
		local bIsRead = pIni:Load(sFileName)
		pIni:Set(sTitle, key, value)
		pIni:Save(sFileName)
		pIni:delete()
		return true
	else
	       return false
	end
end


-- ��ȡ���ã��ļ��������⡢key
function getConfig(sFileName, sTitle, sKey)
	local pIni = ScutDataLogic.CLuaIni:new()
	local bIsRead = pIni:Load(sFileName)
	if bIsRead == false then
		pIni:Set(sTitle, sKey, 1)
		pIni:Save(sFileName)
		pIni:delete()
		return 1
	end
	return pIni:Get(sTitle, sKey)
end


function initLocalOptions()
	   LocalSettingData[1].IsInUse = tonumber( getConfig("sys/config.ini", "system", "isPlayMusic"))
	   LocalSettingData[2].IsInUse = tonumber(getConfig("sys/config.ini", "system", "isPlayMusic"))
end

 
function getSettingData()
   return SettingData
end

function getLocalData()
   return LocalSettingData
end

-- �������˷��ص�����
function setSettingData(Response_1508)
    SettingData = {}
    initLocalOptions()
    for k,v in pairs(LocalSettingData) do
	   SettingData[#SettingData + 1] = v
    end
    local data = Response_1508.Items
	for k,v in pairs(data) do
	   v.EnumValue = v.EnumValue + #LocalSettingData
	   SettingData[#SettingData + 1] = v
    end
end


function  release()
   SettingData = {}
end

