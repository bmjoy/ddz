using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 聊天记录通知接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action9003 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 发件人
            /// </summary>
            public int UserID { get; set; }
            /// <summary>
            /// 发件人名称
            /// </summary>
            public string UserName { get; set; }
            /// <summary>
            /// 聊天ID
            /// </summary>
            public int ChatID { get; set; }
            /// <summary>
            /// 聊天内容
            /// </summary>
            public string Content { get; set; }
            /// <summary>
            /// 聊天时间
            /// </summary>
            public string SendDate { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 最大版本号
            /// </summary>
            public int ChatMaxNum { get; set; }
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
                

        public Action9003(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action9003, httpGet)
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
            return true;
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
            this.PushIntoStack(_packet.ChatMaxNum);
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.UserID);
                dsItem.PushIntoStack(item.UserName);
                dsItem.PushIntoStack(item.ChatID);
                dsItem.PushIntoStack(item.Content);
                dsItem.PushIntoStack(item.SendDate);

                this.PushIntoStack(dsItem);
            }

        }

    }
}
