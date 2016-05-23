using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 抽奖接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action12002 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 抽到的位置
            /// </summary>
            public short Postion { get; set; }
            /// <summary>
            /// 奖励内容
            /// </summary>
            public string RewardContent { get; set; }
            /// <summary>
            /// 免费次数
            /// </summary>
            public int FreeNum { get; set; }
            /// <summary>
            /// 玩家金豆
            /// </summary>
            public int UserCoin { get; set; }
            /// <summary>
            /// 玩家元宝
            /// </summary>
            public int UserGold { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 抽奖类型1：免费抽奖2：元宝抽奖3：确认抽奖
        /// </summary>
        private int _ops;
                

        public Action12002(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action12002, httpGet)
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
            if (httpGet.GetInt("Ops", ref _ops))
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
            this.PushIntoStack((short)_packet.Postion);
            this.PushIntoStack(_packet.RewardContent);
            this.PushIntoStack(_packet.FreeNum);
            this.PushIntoStack(_packet.UserCoin);
            this.PushIntoStack(_packet.UserGold);

        }

    }
}
