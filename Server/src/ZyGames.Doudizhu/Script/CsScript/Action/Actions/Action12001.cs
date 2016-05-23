using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 转盘界面接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action12001 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 转盘奖励物品列表
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 物品位置
            /// </summary>
            public int Postion { get; set; }
            /// <summary>
            /// 物品图片
            /// </summary>
            public string HeadID { get; set; }
            /// <summary>
            /// 概率
            /// </summary>
            public string Probability { get; set; }
            /// <summary>
            /// 物品描述
            /// </summary>
            public string ItemDesc { get; set; }
            /// <summary>
            /// 奖励金豆
            /// </summary>
            public int GameCoin { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 转盘类型0：免费 1：晶石
            /// </summary>
            public short IsFree { get; set; }
            /// <summary>
            /// 免费次数
            /// </summary>
            public int FreeNum { get; set; }
            /// <summary>
            /// 转盘奖励物品列表
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            /// <summary>
            /// 玩家金豆
            /// </summary>
            public int UserCoin { get; set; }
            /// <summary>
            /// 玩家元宝
            /// </summary>
            public int UserGold { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
                

        public Action12001(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action12001, httpGet)
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
            this.PushIntoStack((short)_packet.IsFree);
            this.PushIntoStack(_packet.FreeNum);
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.Postion);
                dsItem.PushIntoStack(item.HeadID);
                dsItem.PushIntoStack(item.Probability);
                dsItem.PushIntoStack(item.ItemDesc);
                dsItem.PushIntoStack(item.GameCoin);

                this.PushIntoStack(dsItem);
            }
            this.PushIntoStack(_packet.UserCoin);
            this.PushIntoStack(_packet.UserGold);

        }

    }
}
