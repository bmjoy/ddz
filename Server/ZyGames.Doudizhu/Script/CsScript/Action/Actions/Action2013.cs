using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 逃跑通知接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action2013 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 0时，系统强退通知
            /// </summary>
            public int FleeUserId { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public string FleeNickName { get; set; }
            /// <summary>
            /// 当前金豆
            /// </summary>
            public int GameCoin { get; set; }
            /// <summary>
            /// 当前积分
            /// </summary>
            public int ScoreNum { get; set; }
            /// <summary>
            /// 增加积分
            /// </summary>
            public int InsScoreNum { get; set; }
            /// <summary>
            /// 增加金豆
            /// </summary>
            public int InsCoinNum { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 内部参数
        /// </summary>
        private int _fleeUserId;
                

        public Action2013(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action2013, httpGet)
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
            if (httpGet.GetInt("FleeUserId", ref _fleeUserId))
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
            this.PushIntoStack(_packet.FleeUserId);
            this.PushIntoStack(_packet.FleeNickName);
            this.PushIntoStack(_packet.GameCoin);
            this.PushIntoStack(_packet.ScoreNum);
            this.PushIntoStack(_packet.InsScoreNum);
            this.PushIntoStack(_packet.InsCoinNum);

        }

    }
}
