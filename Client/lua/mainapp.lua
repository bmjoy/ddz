------------------------------------------------------------------
-- mainapp.lua
-- Author     : Xin Zhang
-- Version    : 1.0.0.0
-- Date       : 2011-10-15
-- Description:
------------------------------------------------------------------

local strModuleName = "mainapp";
--CCLuaLog("Module ".. strModuleName.. " loaded.");
strModuleName = nil;

------------------------------------------------------------------
-- ���� ��ʼ���������� ��ʼ ����
------------------------------------------------------------------

local strRootDir = ScutDataLogic.CFileHelper:getPath("lua");
local strTmpPkgPath = package.path;

local strSubDirs =
{
	"scenes",
	"layers",
	"datapool",
	"config",
	"action",
	"lib",
	"commupdate",
	"payment",
	
	-- �ڴ�����µ�Ŀ¼
};

--package.path = string.format("%s/?.lua;%s/lib/?.lua;%s/action/?.lua;%s/common/?.lua;%s/datapool/?.lua;%s/Global/?.lua;%s/layers/?.lua;%s/LuaClass/?.lua;%s/scenes/?.lua;%s/titleMap/?.lua;%s",strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir,strRootDir, strTmpPkgPath);

-- ���������ļ���
for key, value in ipairs(strSubDirs) do
	local strOld = strTmpPkgPath;
	if(1 == key) then
		strTmpPkgPath = string.format("%s/%s/?.lua%s", strRootDir, value, strOld);
	else
		strTmpPkgPath = string.format("%s/%s/?.lua;%s", strRootDir, value, strOld);
	end
--	CCLuaLog(value.. " added.");
	strOld = nil;
end

package.path = string.format("%s/?.lua;%s", strRootDir, strTmpPkgPath);
strTmpPkgPath = nil;

------------------------------------------------------------------
-- ���� ��ʼ���������� ���� ����
------------------------------------------------------------------

-- require�����ڻ���������ʼ��֮�󣬱����ļ��Ҳ������������
require("lib.lib")
require("scenes.LoginScene")
require("datapool.PushReceiverLayer")
require("scenes.MainScene")

 g_frame_mgr = FrameManager:new()
    g_frame_mgr:init()

    function OnHandleData(pScene, nTag, nNetRet, pData)
        pScene = tolua.cast(pScene, "CCScene")
        g_scenes[pScene]:execCallback(nTag, nNetRet, pData)
    end

math.randomseed(os.time());
__NETWORK__=true
------------------------------------------------------------------
-- ���� Э���������ע�� ��ʼ ����
------------------------------------------------------------------

function processCommonData(lpScene)
   return true;
end

function netDecodeEnd(pScutScene, nTag)
	ZyLoading.hide(pScutScene, nTag)
end
--ע�������push�ص�
CCDirector:sharedDirector():RegisterSocketPushHandler("PushReceiverLayer.PushReceiverCallback");
--NDFixSDK.FixCocos2dx:CreateFixCocos2dx():RegisterSocketPushHandler("PushReceiverLayer.PushReceiverCallback")
--ScutScene:registerNetCommonDataFunc("processCommonData");
ScutScene:registerNetErrorFunc("LoginScene.netConnectError2");
ScutScene:registerNetDecodeEnd("netDecodeEnd");
--NdUpdate.CUpdateEngine:getInstance():registerResPackageUpdateLuaHandleFunc("CommandDataResove.resourceUpdated")

CCDirector:sharedDirector():RegisterBackHandler("MainScene.closeApp")
--ע��crash log�ص�
CCDirector:sharedDirector():RegisterErrorHandler("err_handler")

--
function err_handler(str)
	ZyRequestCounter = ZyRequestCounter + 1
	ZyWriter:writeString("ActionId",404 );
	ZyWriter:writeString("ErrorInfo", str)
	ZyExecRequest(ScutScene, nil,isLoading)
--	ScutDataLogic.CDataRequest:Instance():AsyncExecRequest(ScutScene, ZyWriter:generatePostData(), ZyRequestCounter, nil);
--	ScutDataLogic.CNetWriter:resetData()
end

------------------------------------------------------------------
-- ���� Э���������ע�� ���� ����
------------------------------------------------------------------


LoginScene.init()

