using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 卡牌数据配置接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action1012 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 牌Id
            /// </summary>
            public int CardId { get; set; }
            /// <summary>
            /// 名称
            /// </summary>
            public string Name { get; set; }
            /// <summary>
            /// 花色
            /// </summary>
            public short Color { get; set; }
            /// <summary>
            /// 牌大小
            /// </summary>
            public short Value { get; set; }
            /// <summary>
            /// Icon
            /// </summary>
            public string HeadIcon { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            
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
                

        public Action1012(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action1012, httpGet)
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
                dsItem.PushIntoStack(item.CardId);
                dsItem.PushIntoStack(item.Name);
                dsItem.PushIntoStack((short)item.Color);
                dsItem.PushIntoStack((short)item.Value);
                dsItem.PushIntoStack(item.HeadIcon);

                this.PushIntoStack(dsItem);
            }

        }

    }
}
