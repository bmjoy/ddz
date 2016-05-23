using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 成就界面接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action3001 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 成就展示列表
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 成就ID
            /// </summary>
            public int AchieveID { get; set; }
            /// <summary>
            /// 成就名称
            /// </summary>
            public string AchieveName { get; set; }
            /// <summary>
            /// 成就图片
            /// </summary>
            public string HeadID { get; set; }
            /// <summary>
            /// 是否获得1：未获得2：获得
            /// </summary>
            public short IsGain { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 完成成就数量
            /// </summary>
            public int CompleteNum { get; set; }
            /// <summary>
            /// 全部成就数量
            /// </summary>
            public int AchieveNum { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int PageCount { get; set; }
            /// <summary>
            /// 成就展示列表
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 成就类型参照[AchieveType]枚举
        /// </summary>
        private short _achieveType;
        /// <summary>
        /// 
        /// </summary>
        private int _pageIndex;
        /// <summary>
        /// 
        /// </summary>
        private int _pageSize;
                

        public Action3001(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action3001, httpGet)
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
            if (httpGet.GetWord("AchieveType", ref _achieveType)            
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
            this.PushIntoStack(_packet.CompleteNum);
            this.PushIntoStack(_packet.AchieveNum);
            this.PushIntoStack(_packet.PageCount);
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.AchieveID);
                dsItem.PushIntoStack(item.AchieveName);
                dsItem.PushIntoStack(item.HeadID);
                dsItem.PushIntoStack((short)item.IsGain);

                this.PushIntoStack(dsItem);
            }

        }

    }
}
