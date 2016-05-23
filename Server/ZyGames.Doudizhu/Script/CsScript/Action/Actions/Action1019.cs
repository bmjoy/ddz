using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 排行榜接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action1019 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 排行榜列表
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 名次ID
            /// </summary>
            public int RankID { get; set; }
            /// <summary>
            /// 玩家ID
            /// </summary>
            public int UserID { get; set; }
            /// <summary>
            /// 玩家昵称
            /// </summary>
            public string NickName { get; set; }
            /// <summary>
            /// 玩家金豆
            /// </summary>
            public int GameCoin { get; set; }
            /// <summary>
            /// 玩家胜率
            /// </summary>
            public string Wining { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 页数
            /// </summary>
            public int PageCount { get; set; }
            /// <summary>
            /// 排行榜列表
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 排行类型1：金豆排行2：胜率排行
        /// </summary>
        private int _rankType;
        /// <summary>
        /// 页索引
        /// </summary>
        private int _pageIndex;
        /// <summary>
        /// 页大小
        /// </summary>
        private int _pageSize;
                

        public Action1019(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action1019, httpGet)
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
            if (httpGet.GetInt("RankType", ref _rankType)            
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
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.RankID);
                dsItem.PushIntoStack(item.UserID);
                dsItem.PushIntoStack(item.NickName);
                dsItem.PushIntoStack(item.GameCoin);
                dsItem.PushIntoStack(item.Wining);

                this.PushIntoStack(dsItem);
            }

        }

    }
}
