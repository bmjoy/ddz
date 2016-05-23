using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;

namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 任务界面接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action3003 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 任务列表
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 任务ID
            /// </summary>
            public int TaskID { get; set; }
            /// <summary>
            /// 任务名称
            /// </summary>
            public string TaskName { get; set; }
            /// <summary>
            /// 完成进度
            /// </summary>
            public int CompleteNum { get; set; }
            /// <summary>
            /// 总进度
            /// </summary>
            public int TaskNum { get; set; }
            /// <summary>
            /// 任务描述
            /// </summary>
            public string TaskDesc { get; set; }
            /// <summary>
            /// 奖励金豆数量
            /// </summary>
            public int GameCoin { get; set; }
            /// <summary>
            /// 是否可领取1：不可领取2：可领取 3：已领取
            /// </summary>
            public short IsReceive { get; set; }
            
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
            /// 任务列表
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
        /// <summary>
        /// 任务类型参照[TaskType]枚举
        /// </summary>
        private short _taskType;
        /// <summary>
        /// 
        /// </summary>
        private int _pageIndex;
        /// <summary>
        /// 
        /// </summary>
        private int _pageSize;
                

        public Action3003(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action3003, httpGet)
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
            if (httpGet.GetWord("TaskType", ref _taskType)            
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
                dsItem.PushIntoStack(item.TaskID);
                dsItem.PushIntoStack(item.TaskName);
                dsItem.PushIntoStack(item.CompleteNum);
                dsItem.PushIntoStack(item.TaskNum);
                dsItem.PushIntoStack(item.TaskDesc);
                dsItem.PushIntoStack(item.GameCoin);
                dsItem.PushIntoStack((short)item.IsReceive);

                this.PushIntoStack(dsItem);
            }

        }

    }
}
