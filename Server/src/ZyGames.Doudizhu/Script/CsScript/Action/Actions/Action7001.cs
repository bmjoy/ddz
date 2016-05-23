using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 商店物品列表接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action7001 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 物品ID
            /// </summary>
            public int ItemID { get; set; }
            /// <summary>
            /// 物品名称
            /// </summary>
            public string ItemName { get; set; }
            /// <summary>
            /// 物品头像
            /// </summary>
            public string HeadID { get; set; }
            /// <summary>
            /// 物品价格
            /// </summary>
            public int ItemPrice { get; set; }
            /// <summary>
            /// VIP价格
            /// </summary>
            public int VipPrice { get; set; }
            /// <summary>
            /// 赠送金豆数量
            /// </summary>
            public int GainGameCoin { get; set; }
            /// <summary>
            /// 商品说明
            /// </summary>
            public string ShopDesc { get; set; }
            /// <summary>
            /// 排序
            /// </summary>
            public short SeqNO { get; set; }
            
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
            /// 金豆
            /// </summary>
            public int GameCoin { get; set; }
            /// <summary>
            /// 元宝
            /// </summary>
            public int GoldNum { get; set; }
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
        /// [ShopType]枚举
        /// </summary>
        private int _shopType;
        /// <summary>
        /// 
        /// </summary>
        private int _pageIndex;
        /// <summary>
        /// 
        /// </summary>
        private int _pageSize;
                

        public Action7001(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action7001, httpGet)
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
            if (httpGet.GetInt("ShopType", ref _shopType)            
                && httpGet.GetInt("PageIndex", ref _pageIndex)            
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
            this.PushIntoStack(_packet.GameCoin);
            this.PushIntoStack(_packet.GoldNum);
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.ItemID);
                dsItem.PushIntoStack(item.ItemName);
                dsItem.PushIntoStack(item.HeadID);
                dsItem.PushIntoStack(item.ItemPrice);
                dsItem.PushIntoStack(item.VipPrice);
                dsItem.PushIntoStack(item.GainGameCoin);
                dsItem.PushIntoStack(item.ShopDesc);
                dsItem.PushIntoStack((short)item.SeqNO);

                this.PushIntoStack(dsItem);
            }

        }

    }
}
