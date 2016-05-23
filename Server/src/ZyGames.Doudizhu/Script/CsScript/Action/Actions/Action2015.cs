using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 桌子重连通知接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action2015 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 
        /// </summary>
        class Class_1_1
        {
            /// <summary>
            /// 玩家剩余牌（小到大排序）
            /// </summary>
            public int CardId { get; set; }
            
        }

        /// <summary>
        /// 玩家列表
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 玩家Id
            /// </summary>
            public int UserId { get; set; }
            /// <summary>
            /// 玩家昵称
            /// </summary>
            public string NickName { get; set; }
            /// <summary>
            /// 头像
            /// </summary>
            public string HeadIcon { get; set; }
            /// <summary>
            /// 位置Id
            /// </summary>
            public int PosId { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public List<Class_1_1> _dsItemList_1_1 { get; set; }
            
        }

        /// <summary>
        /// 底牌
        /// </summary>
        class Class_2
        {
            /// <summary>
            /// 
            /// </summary>
            public int CardId { get; set; }
            
        }

        /// <summary>
        /// 上次出的牌
        /// </summary>
        class Class_3
        {
            /// <summary>
            /// 
            /// </summary>
            public int CardId { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 当前倍数
            /// </summary>
            public int MultipleNum { get; set; }
            /// <summary>
            /// 初始底注
            /// </summary>
            public int AnteNum { get; set; }
            /// <summary>
            /// 当前玩家是否在托管状态
            /// </summary>
            public byte IsAI { get; set; }
            /// <summary>
            /// 是否明牌显示
            /// </summary>
            public byte IsShow { get; set; }
            /// <summary>
            /// 地主Id，0：还没有叫地主
            /// </summary>
            public int LandlordId { get; set; }
            /// <summary>
            /// 玩家列表
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            /// <summary>
            /// 底牌
            /// </summary>
            public List<Class_2> _dsItemList_2 { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int CodeTime { get; set; }
            /// <summary>
            /// 当前出牌玩家
            /// </summary>
            public int OutCardUserId { get; set; }
            /// <summary>
            /// 重新出牌
            /// </summary>
            public byte IsReNew { get; set; }
            /// <summary>
            /// 金豆
            /// </summary>
            public int GameCoin { get; set; }
            /// <summary>
            /// 上次出的牌
            /// </summary>
            public List<Class_3> _dsItemList_3 { get; set; }
            /// <summary>
            /// 牌型【DeckType】
            /// </summary>
            public short DeckType { get; set; }
            /// <summary>
            /// 牌面大小
            /// </summary>
            public int CardSize { get; set; }
            /// <summary>
            /// 上次出的玩家
            /// </summary>
            public int PreUserId { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
                

        public Action2015(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action2015, httpGet)
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
            this.PushIntoStack(_packet.MultipleNum);
            this.PushIntoStack(_packet.AnteNum);
            this.PushIntoStack((byte)_packet.IsAI);
            this.PushIntoStack((byte)_packet.IsShow);
            this.PushIntoStack(_packet.LandlordId);
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.UserId);
                dsItem.PushIntoStack(item.NickName);
                dsItem.PushIntoStack(item.HeadIcon);
                dsItem.PushIntoStack(item.PosId);
                dsItem.PushIntoStack(item._dsItemList_1_1.Count);
                foreach (var item_1 in item._dsItemList_1_1)
                {
                    DataStruct dsItem1 = new DataStruct();
                    dsItem1.PushIntoStack(item_1.CardId);

                    dsItem.PushIntoStack(dsItem1);
                }

                this.PushIntoStack(dsItem);
            }
            this.PushIntoStack(_packet._dsItemList_2.Count);
            foreach (var item in _packet._dsItemList_2)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.CardId);

                this.PushIntoStack(dsItem);
            }
            this.PushIntoStack(_packet.CodeTime);
            this.PushIntoStack(_packet.OutCardUserId);
            this.PushIntoStack((byte)_packet.IsReNew);
            this.PushIntoStack(_packet.GameCoin);
            this.PushIntoStack(_packet._dsItemList_3.Count);
            foreach (var item in _packet._dsItemList_3)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.CardId);

                this.PushIntoStack(dsItem);
            }
            this.PushIntoStack((short)_packet.DeckType);
            this.PushIntoStack(_packet.CardSize);
            this.PushIntoStack(_packet.PreUserId);

        }

    }
}
