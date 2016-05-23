using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 即时聊天配置接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action9001 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 聊天内容列表
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 聊天ID
            /// </summary>
            public int ChatID { get; set; }
            /// <summary>
            /// 聊天内容
            /// </summary>
            public string ChatContent { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 聊天内容列表
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 游戏id
        /// </summary>
        private int _gameType;
        /// <summary>
        /// 服务器id
        /// </summary>
        private int _serverID;
                

        public Action9001(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action9001, httpGet)
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
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.ChatID);
                dsItem.PushIntoStack(item.ChatContent);

                this.PushIntoStack(dsItem);
            }

        }

    }
}
