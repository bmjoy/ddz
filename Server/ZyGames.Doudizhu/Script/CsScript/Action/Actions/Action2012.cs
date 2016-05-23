using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 牌局结束通知接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action2012 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 牌列表
        /// </summary>
        class Class_1_1
        {
            /// <summary>
            /// 牌ID
            /// </summary>
            public int CardId { get; set; }
            
        }

        /// <summary>
        /// 玩家剩余牌排除自己的
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 玩家ID
            /// </summary>
            public int UserId { get; set; }
            /// <summary>
            /// 牌列表
            /// </summary>
            public List<Class_1_1> _dsItemList_1_1 { get; set; }
            
        }

        /// <summary>
        /// 最后一手出牌
        /// </summary>
        class Class_2
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
            /// 是否是地主
            /// </summary>
            public byte IsLandlord { get; set; }
            /// <summary>
            /// 是否地主胜
            /// </summary>
            public byte IsLandlordWin { get; set; }
            /// <summary>
            /// 增加或扣除积分
            /// </summary>
            public int ScoreNum { get; set; }
            /// <summary>
            /// 增加或扣除金豆
            /// </summary>
            public int CoinNum { get; set; }
            /// <summary>
            /// 当前剩余金豆数
            /// </summary>
            public int GameCoin { get; set; }
            /// <summary>
            /// 玩家剩余牌排除自己的
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            /// <summary>
            /// 最后一手出牌
            /// </summary>
            public List<Class_2> _dsItemList_2 { get; set; }
            /// <summary>
            /// 最后出的玩家ID
            /// </summary>
            public int LastUserId { get; set; }
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
                

        public Action2012(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action2012, httpGet)
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
            this.PushIntoStack((byte)_packet.IsLandlord);
            this.PushIntoStack((byte)_packet.IsLandlordWin);
            this.PushIntoStack(_packet.ScoreNum);
            this.PushIntoStack(_packet.CoinNum);
            this.PushIntoStack(_packet.GameCoin);
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.UserId);
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
            this.PushIntoStack(_packet.LastUserId);
            this.PushIntoStack(_packet.MultipleNum);
            this.PushIntoStack(_packet.AnteNum);

        }

    }
}
