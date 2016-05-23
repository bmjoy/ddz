using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 360获取Token接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action360 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 
            /// </summary>
            public string access_token { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 360用于刷新AccessToken
        /// </summary>
        private string _refeshToken;
        /// <summary>
        /// 渠道ID
        /// </summary>
        private string _retailID;
        /// <summary>
        /// 360最终反问范围
        /// </summary>
        private string _scope;
                

        public Action360(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action360, httpGet)
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
            if (httpGet.GetString("RefeshToken", ref _refeshToken)            
                && httpGet.GetString("RetailID", ref _retailID)            
                && httpGet.GetString("Scope", ref _scope))
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
            this.PushIntoStack(_packet.access_token);

        }

    }
}
