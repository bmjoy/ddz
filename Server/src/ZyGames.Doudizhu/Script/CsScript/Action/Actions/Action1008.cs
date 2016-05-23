using System;
using System.Collections.Generic;
using ZyGames.Framework.Game.Contract;
using ZyGames.Framework.Game.Service;
namespace ZyGames.Doudizhu.Script.CsScript.Action
{
   
    /// <summary>
    /// 主界面接口
    /// </summary>
    /// <remarks>继续BaseStruct类:允许无身份认证的请求;AuthorizeAction:需要身份认证的请求</remarks>
    public class Action1008 : BaseAction
    {
        
        #region class object
        /// <summary>
        /// 
        /// </summary>
        class Class_1
        {
            /// <summary>
            /// 房间编号
            /// </summary>
            public int RoomId { get; set; }
            /// <summary>
            /// 房间名称
            /// </summary>
            public string RoomName { get; set; }
            /// <summary>
            /// 房间倍数
            /// </summary>
            public short RoomMultiple { get; set; }
            /// <summary>
            /// 金豆数限制
            /// </summary>
            public int MinCion { get; set; }
            /// <summary>
            /// 每日赠豆，0：不赠送
            /// </summary>
            public int GiffCion { get; set; }
            /// <summary>
            /// 说明
            /// </summary>
            public string Description { get; set; }
            /// <summary>
            /// 底注
            /// </summary>
            public int AnteNum { get; set; }
            
        }

        /// <summary>
        /// Main Body
        /// </summary>
        class ResponsePacket
        {
            /// <summary>
            /// 通行证号
            /// </summary>
            public string Pid { get; set; }
            /// <summary>
            /// 玩家icon
            /// </summary>
            public string HeadIcon { get; set; }
            /// <summary>
            /// 玩家昵称
            /// </summary>
            public string NickName { get; set; }
            /// <summary>
            /// 金豆
            /// </summary>
            public int GameCoin { get; set; }
            /// <summary>
            /// 元宝
            /// </summary>
            public int Gold { get; set; }
            /// <summary>
            /// VIP等级
            /// </summary>
            public int VipLv { get; set; }
            /// <summary>
            /// 胜利局数
            /// </summary>
            public int WinNum { get; set; }
            /// <summary>
            /// 失败局数
            /// </summary>
            public int FailNum { get; set; }
            /// <summary>
            /// 称号
            /// </summary>
            public string TitleName { get; set; }
            /// <summary>
            /// 积分
            /// </summary>
            public int ScoreNum { get; set; }
            /// <summary>
            /// 胜率
            /// </summary>
            public int WinRate { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public List<Class_1> _dsItemList_1 { get; set; }
            /// <summary>
            /// 当前所在房间，0：未进入房间
            /// </summary>
            public int RoomId { get; set; }
            
        }
        #endregion

        /// <summary>
        /// 响应数据包
        /// </summary>
        private ResponsePacket _packet = new ResponsePacket();
                

        public Action1008(HttpGet httpGet)
            : base(ActionIDDefine.Cst_Action1008, httpGet)
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
            this.PushIntoStack(_packet.Pid);
            this.PushIntoStack(_packet.HeadIcon);
            this.PushIntoStack(_packet.NickName);
            this.PushIntoStack(_packet.GameCoin);
            this.PushIntoStack(_packet.Gold);
            this.PushIntoStack(_packet.VipLv);
            this.PushIntoStack(_packet.WinNum);
            this.PushIntoStack(_packet.FailNum);
            this.PushIntoStack(_packet.TitleName);
            this.PushIntoStack(_packet.ScoreNum);
            this.PushIntoStack(_packet.WinRate);
            this.PushIntoStack(_packet._dsItemList_1.Count);
            foreach (var item in _packet._dsItemList_1)
            {
                DataStruct dsItem = new DataStruct();
                dsItem.PushIntoStack(item.RoomId);
                dsItem.PushIntoStack(item.RoomName);
                dsItem.PushIntoStack((short)item.RoomMultiple);
                dsItem.PushIntoStack(item.MinCion);
                dsItem.PushIntoStack(item.GiffCion);
                dsItem.PushIntoStack(item.Description);
                dsItem.PushIntoStack(item.AnteNum);

                this.PushIntoStack(dsItem);
            }
            this.PushIntoStack(_packet.RoomId);

        }

    }
}
