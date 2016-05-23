using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 明牌通知接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action2008 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 地主明牌下发，自己不通知客户端要存住，地主出的牌要相应移除
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 牌Id
            /// </summary>
            public int CardId { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 地主明牌下发，自己不通知客户端要存住，地主出的牌要相应移除
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            /// <summary>
            /// 当前倍数
            /// </summary>
            public int MultipleNum { get; set; }
            /// <summary>
            /// 当前底注
            /// </summary>
            public int AnteNum { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
                

        public Action2008(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action2008, httpGet)
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
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.CardId);

                this.PushIntoStack(dsItem);
            }
            this.PushIntoStack(_packet.MultipleNum);
            this.PushIntoStack(_packet.AnteNum);

        }

    }
}
