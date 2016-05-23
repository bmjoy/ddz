using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 成就详情接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action3002 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 成就名称
            /// </summary>
            public string AchieveName { get; set; }
            /// <summary>
            /// 成就类型
            /// </summary>
            public short AchieveType { get; set; }
            /// <summary>
            /// 成就图片
            /// </summary>
            public string HeadID { get; set; }
            /// <summary>
            /// 成就描述
            /// </summary>
            public string AchieveDesc { get; set; }
            /// <summary>
            /// 是否完成1：未完成 2：完成
            /// </summary>
            public short IsComplete { get; set; }
            /// <summary>
            /// 完成进度
            /// </summary>
            public int CompleteNum { get; set; }
            /// <summary>
            /// 总进度
            /// </summary>
            public int AchieveNum { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 成就ID
        /// </summary>
        private int _achieveID;
                

        public Action3002(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action3002, httpGet)
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
            if (httpGet.GetInt("AchieveID", ref _achieveID))
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
            this.PushIntoStack(_packet.AchieveName);
            this.PushIntoStack((short)_packet.AchieveType);
            this.PushIntoStack(_packet.HeadID);
            this.PushIntoStack(_packet.AchieveDesc);
            this.PushIntoStack((short)_packet.IsComplete);
            this.PushIntoStack(_packet.CompleteNum);
            this.PushIntoStack(_packet.AchieveNum);

        }

    }
}
