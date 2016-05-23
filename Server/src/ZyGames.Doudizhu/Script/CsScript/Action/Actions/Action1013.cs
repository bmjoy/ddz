using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 背包物品列表通知接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action1013 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 背包列表
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 玩家物品ID
            /// </summary>
            public string UserItemID { get; set; }
            /// <summary>
            /// 物品ID
            /// </summary>
            public int ItemID { get; set; }
            /// <summary>
            /// 物品名称
            /// </summary>
            public string ItemName { get; set; }
            /// <summary>
            /// 物品类型
            /// </summary>
            public short ItemType { get; set; }
            /// <summary>
            /// 物品数量
            /// </summary>
            public int Num { get; set; }
            /// <summary>
            /// 物品图片
            /// </summary>
            public string HeadID { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 
            /// </summary>
            public int PageCount { get; set; }
            /// <summary>
            /// 背包列表
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
        private int _pageIndex;
        /// <summary>
        /// 
        /// </summary>
        private int _pageSize;
                

        public Action1013(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action1013, httpGet)
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
            if (httpGet.GetInt("PageIndex", ref _pageIndex)            
                && httpGet.GetInt("PageSize", ref _pageSize))
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
            this.PushIntoStack(_packet.PageCount);
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.UserItemID);
                dsItem.PushIntoStack(item.ItemID);
                dsItem.PushIntoStack(item.ItemName);
                dsItem.PushIntoStack((short)item.ItemType);
                dsItem.PushIntoStack(item.Num);
                dsItem.PushIntoStack(item.HeadID);

                this.PushIntoStack(dsItem);
            }

        }

    }
}
