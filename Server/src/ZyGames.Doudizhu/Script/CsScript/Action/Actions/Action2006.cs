using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 叫地主通知接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action2006 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 叫地主状态0：继续，1：结束叫地主未结束时，指下一个叫地主玩家Id；否则指最后地主是谁
            /// </summary>
            public byte IsEnd { get; set; }
            /// <summary>
            /// 地主Id等待叫地主玩家，IsEnd=1则确定地主
            /// </summary>
            public int LandlordId { get; set; }
            /// <summary>
            /// 地主昵称
            /// </summary>
            public string LandlordName { get; set; }
            /// <summary>
            /// 当前倍数
            /// </summary>
            public int MultipleNum { get; set; }
            /// <summary>
            /// 当前底注
            /// </summary>
            public int AnteNum { get; set; }
            /// <summary>
            /// 是否叫地主，0：不叫，1：叫上次玩家操作
            /// </summary>
            public byte IsCall { get; set; }
            /// <summary>
            /// 上次是否是抢地主，0：叫，1：抢
            /// </summary>
            public byte IsRob { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 2005传递参数
        /// </summary>
        private byte _isCall;
                

        public Action2006(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action2006, httpGet)
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
            if (httpGet.GetByte("IsCall", ref _isCall))
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
            this.PushIntoStack((byte)_packet.IsEnd);
            this.PushIntoStack(_packet.LandlordId);
            this.PushIntoStack(_packet.LandlordName);
            this.PushIntoStack(_packet.MultipleNum);
            this.PushIntoStack(_packet.AnteNum);
            this.PushIntoStack((byte)_packet.IsCall);
            this.PushIntoStack((byte)_packet.IsRob);

        }

    }
}
