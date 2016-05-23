using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 用户信息变更通知接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action1014 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 玩家icon
            /// </summary>
            public string HeadIcon { get; set; }
            /// <summary>
            /// 金豆
            /// </summary>
            public int GameCoin { get; set; }
            /// <summary>
            /// 元宝
            /// </summary>
            public int Gold { get; set; }
            /// <summary>
            /// VIP等级
            /// </summary>
            public int VipLv { get; set; }
            /// <summary>
            /// 胜利局数
            /// </summary>
            public int WinNum { get; set; }
            /// <summary>
            /// 失败局数
            /// </summary>
            public int FailNum { get; set; }
            /// <summary>
            /// 称号
            /// </summary>
            public string TitleName { get; set; }
            /// <summary>
            /// 积分
            /// </summary>
            public int ScoreNum { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 
        /// </summary>
        private int _gameType;
        /// <summary>
        /// 
        /// </summary>
        private int _serverID;
                

        public Action1014(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action1014, httpGet)
        {
            
        }

        /// <summary>
        /// 检查的Action是否需要授权访问
        /// </summary>
        protected override bool IgnoreActionId
        {
            get{ return true; }
        }

        /// <summary>
        /// 客户端请求的参数较验
        /// </summary>
        /// <returns>false:中断后面的方式执行并返回Error</returns>
        public override bool GetUrlElement()
        {
            if (httpGet.GetInt("GameType", ref _gameType)            
                && httpGet.GetInt("ServerID", ref _serverID))
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// 业务逻辑处理
        /// </summary>
        /// <returns>false:中断后面的方式执行并返回Error</returns>
        public override bool TakeAction()
        {
            return true;
        }

        /// <summary>
        /// 下发给客户的包结构数据
        /// </summary>
        public override void BuildPacket()
        {
            this.PushIntoStack(_packet.HeadIcon);
            this.PushIntoStack(_packet.GameCoin);
            this.PushIntoStack(_packet.Gold);
            this.PushIntoStack(_packet.VipLv);
            this.PushIntoStack(_packet.WinNum);
            this.PushIntoStack(_packet.FailNum);
            this.PushIntoStack(_packet.TitleName);
            this.PushIntoStack(_packet.ScoreNum);

        }

    }
}
