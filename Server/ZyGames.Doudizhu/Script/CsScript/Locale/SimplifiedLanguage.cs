/****************************************************************************
Copyright (c) 2013-2015 scutgame.com

http://www.scutgame.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
****************************************************************************/
using ZyGames.Framework.Game.Lang;

namespace GameServer.CsScript.Locale
{
    public class SimplifiedLanguage : Language
    {
        /// <summary>
        /// Sign error
        /// </summary>
        public new string SignError = "验证签名出错";

        /// <summary>
        /// validate error
        /// </summary>
        public new string ValidateError = "请求的参数无效";
        /// <summary>
        /// The system is busy
        /// </summary>
        public new string ServerBusy = "服务器繁忙";

        /// <summary>
        /// param error
        /// </summary>
        public new string UrlElement = "缺少请求参数-";

        /// <summary>
        /// 参数名:{0}不存在
        /// </summary>
        public new string UrlNoParam = "参数名:{0}是必须的";
        /// <summary>
        /// 参数名:{0}超出范围[{1}-{2}]
        /// </summary>
        public new string UrlParamOutRange = "参数:{0}超出范围[{1} - {2}]";

        /// <summary>
        /// 服务器正在维护
        /// </summary>
        public new string ServerMaintain = "服务器正在维护";

        /// <summary>
        /// 服务器正在重启中，请稍候...
        /// </summary>
        public new string ServerLoading = "服务器正在重启中，请稍候...";

        /// <summary>
        /// 请求超时
        /// </summary>
        public new string RequestTimeout = "请求超时";
        /// <summary>
        /// 您输入的账号或密码不正确
        /// </summary>
        public new string PasswordError = "您输入的账号或密码不正确";

        /// <summary>
        /// 加载数据失败
        /// </summary>
        public new string LoadDataError = "加载数据失败";

        /// <summary>
        /// 该账号已被封禁
        /// </summary>
        public new string AcountIsLocked = "该账号已被封禁";

        /// <summary>
        /// 您的账号未登录或已过期
        /// </summary>
        public new string AcountNoLogin = "您的账号未登录或已过期";

        /// <summary>
        /// 您的账号已在其它地方登录
        /// </summary>
        public new string AcountLogined = "您的账号已在其它地方登录";

        /// <summary>
        /// 充值失败
        /// </summary>
        public new string AppStorePayError = "充值失败";
        /// <summary>
        /// 获取受权失败
        /// </summary>
        public new string GetAccessFailure = "获取受权失败";


        public int SystemUserId= 1000000; 

        public string KingName= "系统"; 

        public string Date_Yesterday = "昨天"; 
        public string Date_BeforeYesterday = "前天"; 
        public string Date_Day = "{0}天前"; 

        public string St1002_GetRegisterPassportIDError = "获取注册通行证ID失败!"; 

        public string St1005_NickNameOutRange = "您的昵称输入有误，请重新输入!"; 
        public string St1005_NickNameExistKeyword = "您输入的昵称存在非法字符，请重新输入!"; 
        public string St1005_NickNameExist = "您输入的昵称已存在，请重新输入!"; 

        public string St1006_PasswordTooLong = "输入错误，请输入4-12位数字或字母!"; 
        public string St1006_ChangePasswordError = "修改密码失败!"; 
        public string St1006_PasswordError = "密码格式错误!"; 
        public string St1066_PayError = "充值失败";

        public new int ErrorCode = 10000;
        public string ErrorInfo = "系统繁忙";
        public string UserLoadError = "主角数据加载失败！";
        public string TableOver = "牌桌已经结束！";
        public string LoadError = "加载数据失败！";
        public string St1010_ChangeHeadError = "更新头像失败！";
        public string St2001_CoinNotEnough = "您的金豆余额为{0}，进入房间至少需要{1}金豆，您的金豆不足！是否到商城购买金豆？";
        public string St2001_GiffCoin = "您今日首次登陆游戏，获得{0}每日赠豆！";
        public string St2001_ConnectError = "网路连接失败！";
        public string St2001_InGaming = "您上一局游戏正处于托管中，请等待游戏结束！";
        public string St2005_CalledIsEnd = "抢地主已经结束！";
        public string St2009_OutCardError = "您出牌已违反规则！";
        public string St2009_OutCardNoExist = "您出牌无效！";
        public string St2009_ReOutCardError = "不能过牌，已轮到您重新出牌！";
        public string St2009_OutCardExitPos = "您已离开桌面！";
        public string St2011_Gameover = "您上一局游戏已结束！";

        public string St_1011RealNameRangeOut = "您输入的真实姓名不能超过8个字符！";
        public string St_1011BirthdayError = "您输入的出生日期错误！";
        public string St_1011HobbyRangeOut = "您输入的爱好不能超过8个字符！";
        public string St_1011ProfessionRangeOut = "您输入的职业字不能超过8个字符！";

        public string St_1011RealNameExistKeyWord = "您输入的真实姓名存在非法字符！";
        public string St_1011HobbyExistKeyWord = "您输入的爱好字存在非法字符！";
        public string St_1011ProfessionExistKeyWord = "您输入的职业存在非法字符！";
        public string St_2912UserActiveNumNotEnough = "活跃度未达到要求！";
        public string St_2908_StHonorNullEnough = "荣誉值不足！";
        public string St_2909_StGoldNumNullEnough = "您的元宝余额不足，是否进行充值？";
        public string St_2909_StAddNumTooEnough = "增加挑战次数已达到10次！";
        public string St_2911_AllDay = "全天";
        public string St3004_CurrentTaskIsNotCompleted = "当前任务未完成！";
        public string St3004_CurrentTaskrewardHasReceived = "当前任务奖励已领取！";
        public string St_7002_ShopOffTheShelf = "该商品已下架！";
        public string St_7002_PurchasedHeadID = "您已购买过该头像！";
        public string St9002_NotJoinedTheRoom = "未加入房间，不能聊天！";
        public string St12002_FreeNotEnough = "免费转盘次数已用完！";
        public string St12002_FreeEnough = "免费转盘次数未用完！";
        public string St12002_UseGoldTurntable = "您将消耗%d元宝再次转盘？";
        public string St12002_GoldenBeanAwards = "您获得%d金豆奖励！";
    }
}