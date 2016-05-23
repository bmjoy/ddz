USE [$(gameName)Config]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AchievementInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AchievementInfo](
	[Id] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Type] [int] NOT NULL DEFAULT ((0)),
	[TargetNum] [int] NOT NULL DEFAULT ((0)),
	[HeadIcon] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AchievementInfo', N'COLUMN',N'Type'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɾ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AchievementInfo', @level2type=N'COLUMN',@level2name=N'Type'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AchievementInfo', N'COLUMN',N'TargetNum'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɾʹﵽֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AchievementInfo', @level2type=N'COLUMN',@level2name=N'TargetNum'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'AchievementInfo', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɾ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AchievementInfo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoomInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RoomInfo](
	[Id] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[AnteNum] [int] NOT NULL DEFAULT ((0)),
	[MultipleNum] [smallint] NOT NULL DEFAULT ((0)),
	[MinGameCion] [int] NOT NULL DEFAULT ((0)),
	[GiffCion] [int] NOT NULL DEFAULT ((0)),
	[Description] [varchar](500) NULL,
	[PlayerNum] [int] NOT NULL DEFAULT ((0)),
	[CardPackNum] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RoomInfo', N'COLUMN',N'AnteNum'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ע��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomInfo', @level2type=N'COLUMN',@level2name=N'AnteNum'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RoomInfo', N'COLUMN',N'MultipleNum'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���䱶��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomInfo', @level2type=N'COLUMN',@level2name=N'MultipleNum'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RoomInfo', N'COLUMN',N'MinGameCion'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomInfo', @level2type=N'COLUMN',@level2name=N'MinGameCion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RoomInfo', N'COLUMN',N'GiffCion'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ÿ������,0:������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomInfo', @level2type=N'COLUMN',@level2name=N'GiffCion'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RoomInfo', N'COLUMN',N'PlayerNum'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomInfo', @level2type=N'COLUMN',@level2name=N'PlayerNum'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RoomInfo', N'COLUMN',N'CardPackNum'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���Ƽ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomInfo', @level2type=N'COLUMN',@level2name=N'CardPackNum'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'RoomInfo', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RoomInfo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConfigEnvSet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConfigEnvSet](
	[EnvKey] [varchar](50) NOT NULL,
	[EnvValue] [varchar](50) NOT NULL,
	[EnvDesc] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[EnvKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ShopInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ShopInfo](
	[ShopID] [int] NOT NULL,
	[ShopName] [varchar](20) NOT NULL,
	[HeadID] [varchar](100) NULL,
	[ShopType] [int] NOT NULL,
	[SeqNO] [smallint] NOT NULL,
	[Price] [int] NOT NULL,
	[VipPrice] [int] NOT NULL,
	[GameCoin] [int] NOT NULL,
	[ShopDesc] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DialInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DialInfo](
	[ID] [int] NOT NULL,
	[GameCoin] [int] NOT NULL,
	[HeadID] [varchar](100) NULL,
	[Probability] [decimal](8, 4) NOT NULL,
	[ItemDesc] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaskInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaskInfo](
	[TaskID] [int] NOT NULL,
	[TaskName] [varchar](50) NOT NULL,
	[TaskType] [int] NOT NULL,
	[TaskClass] [smallint] NOT NULL,
	[RestraintNum] [int] NOT NULL,
	[AchieveID] [int] NOT NULL,
	[GameCoin] [int] NOT NULL,
	[TaskDesc] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PokerInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PokerInfo](
	[Id] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Color] [int] NOT NULL,
	[Value] [smallint] NOT NULL,
	[HeadIcon] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PokerInfo', N'COLUMN',N'Color'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƻ�ɫ[Enum<CardColor>]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PokerInfo', @level2type=N'COLUMN',@level2name=N'Color'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PokerInfo', N'COLUMN',N'Value'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƴ�Сֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PokerInfo', @level2type=N'COLUMN',@level2name=N'Value'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'PokerInfo', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˿�������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PokerInfo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChatInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ChatInfo](
	[Id] [int] NOT NULL,
	[Content] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ChatInfo', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChatInfo'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TitleInfo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TitleInfo](
	[Id] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[TargetNum] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'TitleInfo', N'COLUMN',N'TargetNum'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ﵽֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TitleInfo', @level2type=N'COLUMN',@level2name=N'TargetNum'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'TitleInfo', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ƺ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TitleInfo'
go


GO
IF NOT EXISTS (SELECT * FROM RoomInfo WHERE Id =1001 )
BEGIN
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1001, N'����ͭ��', 2, 50, N'icon_1034', N'�ɾ�������Ӯ��50�����ö�����ʤ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1002, N'��������', 2, 150, N'icon_1035', N'�ɾ�������Ӯ��150�����ö�����ʤ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1003, N'���ý���', 2, 300, N'icon_1036', N'�ɾ�������Ӯ��300�����ö�����ʤ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1004, N'���ð׽�', 2, 600, N'icon_1037', N'�ɾ�������Ӯ��600�����ö�����ʤ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1005, N'���ò���', 2, 1000, N'icon_1038', N'�ɾ�������Ӯ��1000�����ö�����ʤ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1006, N'������ʯ', 2, 2000, N'icon_1039', N'�ɾ�������Ӯ��2000�����ö�����ʤ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1007, N'���ô���', 2, 3500, N'icon_1040', N'�ɾ�������Ӯ��3500�����ö�����ʤ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1008, N'һ������', 5, 500, N'icon_1041', N'�ɾ��������ۼƳ�ֵ500Ԫ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1009, N'��������', 5, 1500, N'icon_1042', N'�ɾ��������ۼƳ�ֵ1500Ԫ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1010, N'��������', 5, 3000, N'icon_1043', N'�ɾ��������ۼƳ�ֵ3000Ԫ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1011, N'��������', 5, 6000, N'icon_1044', N'�ɾ��������ۼƳ�ֵ6000Ԫ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1012, N'��������', 5, 8000, N'icon_1045', N'�ɾ��������ۼƳ�ֵ8000Ԫ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1013, N'��������', 5, 10000, N'icon_1046', N'�ɾ��������ۼƳ�ֵ10000Ԫ��')
	INSERT [AchievementInfo] ([Id], [Name], [Type], [TargetNum], [HeadIcon], [Description]) VALUES (1014, N'��������', 5, 20000, N'icon_1047', N'�ɾ��������ۼƳ�ֵ20000Ԫ��')
	INSERT [RoomInfo] ([Id], [Name], [AnteNum], [MultipleNum], [MinGameCion], [GiffCion], [Description], [PlayerNum], [CardPackNum]) VALUES (1001, N'һ�����ַ�', 400, 1, 1000, 1000, N'', 3, 1)
	INSERT [RoomInfo] ([Id], [Name], [AnteNum], [MultipleNum], [MinGameCion], [GiffCion], [Description], [PlayerNum], [CardPackNum]) VALUES (1002, N'�������ַ�', 400, 2, 10000, 1000, N'', 3, 1)
	INSERT [RoomInfo] ([Id], [Name], [AnteNum], [MultipleNum], [MinGameCion], [GiffCion], [Description], [PlayerNum], [CardPackNum]) VALUES (1003, N'�ı����ַ�', 600, 4, 60000, 1000, N'', 3, 1)
	INSERT [RoomInfo] ([Id], [Name], [AnteNum], [MultipleNum], [MinGameCion], [GiffCion], [Description], [PlayerNum], [CardPackNum]) VALUES (1004, N'ʮ�����ַ�', 800, 10, 200000, 1000, N'', 3, 1)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1001, N'������ͭ��I��', 49)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1002, N'������ͭ��II��', 99)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1003, N'������ͭ��III��', 199)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1004, N'���ð�����I��', 399)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1005, N'���ð�����II��', 599)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1006, N'���ð�����III��', 999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1007, N'���ûƽ���I��', 1999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1008, N'���ûƽ���II��', 3999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1009, N'���ûƽ���III��', 5999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1010, N'���ò�����I��', 9999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1011, N'���ò�����II��', 29999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1012, N'���ò�����III��', 99999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1013, N'������ʯ��I��', 199999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1014, N'������ʯ��II��', 499999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1015, N'������ʯ��III��', 999999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1016, N'���ô�����I��', 2999999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1017, N'���ô�����II��', 4999999)
	INSERT [TitleInfo] ([Id], [Name], [TargetNum]) VALUES (1018, N'���ô�����III��', 9999999)
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (1, N'����', N'head_1006', 1, 1, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (2, N'ˮţ', N'head_1007', 1, 2, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (3, N'����', N'head_1008', 1, 3, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (4, N'����', N'head_1009', 1, 4, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (5, N'����', N'head_1010', 1, 5, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (6, N'����', N'head_1011', 1, 6, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (7, N'����', N'head_1012', 1, 7, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (8, N'����', N'head_1013', 1, 8, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (9, N'���', N'head_1014', 1, 9, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (10, N'�ۼ�', N'head_1015', 1, 10, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (11, N'С��', N'head_1016', 1, 11, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (12, N'˯��', N'head_1017', 1, 12, 20, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (13, N'С��', N'head_1018', 1, 13, 50, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (14, N'����', N'head_1019', 1, 14, 50, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (15, N'����', N'head_1020', 1, 15, 50, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (16, N'С��', N'head_1021', 2, 16, 10, 0, 1000, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (17, N'�н�', N'head_1022', 2, 17, 100, 0, 10000, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (18, N'���', N'head_1023', 2, 18, 600, 0, 60000, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (19, N'�ش��', N'head_1024', 2, 19, 2000, 0, 200000, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (20, N'�����', N'head_1025', 2, 20, 5000, 0, 500000, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (21, N'Ů��', N'head_1026', 1, 21, 70, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (22, N'����', N'head_1027', 1, 22, 70, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (23, N'Ů��', N'head_1028', 1, 23, 70, 0, 0, N'')
	INSERT [ShopInfo] ([ShopID], [ShopName], [HeadID], [ShopType], [SeqNO], [Price], [VipPrice], [GameCoin], [ShopDesc]) VALUES (24, N'ѧ����', N'head_1029', 1, 24, 70, 0, 0, N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (1, 100, N'', CAST(0.3000 AS Decimal(8, 4)), N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (2, 200, N'', CAST(0.3000 AS Decimal(8, 4)), N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (3, 400, N'', CAST(0.2000 AS Decimal(8, 4)), N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (4, 600, N'', CAST(0.1000 AS Decimal(8, 4)), N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (5, 900, N'', CAST(0.0500 AS Decimal(8, 4)), N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (6, 1200, N'', CAST(0.0500 AS Decimal(8, 4)), N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (7, 2400, N'', CAST(0.0400 AS Decimal(8, 4)), N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (8, 4000, N'', CAST(0.0300 AS Decimal(8, 4)), N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (9, 6000, N'', CAST(0.0200 AS Decimal(8, 4)), N'')
	INSERT [DialInfo] ([ID], [GameCoin], [HeadID], [Probability], [ItemDesc]) VALUES (10, 10000, N'', CAST(0.0100 AS Decimal(8, 4)), N'')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (1001, N'������ʤ', 1, 2, 1, 0, 800, N'����é®Ӯ���׳����ö�����ʤ��')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (1002, N'��������', 1, 2, 3, 0, 1200, N'Ӯ��3�����ö�������ʤ��')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (1003, N'ʤ������', 1, 2, 10, 0, 2000, N'Ӯ��10�����ö�������ʤ��')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (1004, N'ʤ��ϲ��', 1, 2, 15, 0, 2500, N'Ӯ��15�����ö�������ʤ��')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (1005, N'��սʤ��', 1, 2, 30, 0, 4500, N'Ӯ��30�����ö�������ʤ��')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2001, N'����ͭ��', 1, 2, 50, 1001, 200, N'�������ͭ�Ƴɾͣ���Ӯ��50ʤ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2002, N'��������', 1, 2, 150, 1002, 400, N'����������Ƴɾͣ���Ӯ��150ʤ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2003, N'���ý���', 1, 2, 300, 1003, 600, N'������ý��Ƴɾͣ���Ӯ��300ʤ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2004, N'���ð׽�', 1, 2, 600, 1004, 800, N'������ð׽�ɾͣ���Ӯ��600ʤ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2005, N'���ò���', 1, 2, 1000, 1005, 1000, N'������ò���ɾͣ���Ӯ��1000ʤ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2006, N'������ʯ', 1, 2, 2000, 1006, 1200, N'���������ʯ�ɾͣ���Ӯ��2000ʤ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2007, N'���ô���', 1, 2, 3500, 1007, 1400, N'������ô���ɾͣ���Ӯ��3500ʤ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2008, N'һ������', 1, 5, 500, 1008, 2000, N'���һ������ɾͣ����۳�ֵ500Ԫ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2009, N'��������', 1, 5, 1500, 1009, 3000, N'��ö�������ɾͣ����۳�ֵ1500Ԫ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2010, N'��������', 1, 5, 3000, 1010, 4000, N'�����������ɾͣ����۳�ֵ3000Ԫ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2011, N'��������', 1, 5, 6000, 1011, 5000, N'�����������ɾͣ����۳�ֵ6000Ԫ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2012, N'��������', 1, 5, 8000, 1012, 7000, N'�����������ɾͣ����۳�ֵ8000Ԫ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2013, N'��������', 1, 5, 10000, 1013, 8000, N'�����������ɾͣ����۳�ֵ10000Ԫ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (2014, N'��������', 1, 5, 20000, 1014, 9000, N'�����������ɾͣ����۳�ֵ20000Ԫ����')
	INSERT [TaskInfo] ([TaskID], [TaskName], [TaskType], [TaskClass], [RestraintNum], [AchieveID], [GameCoin], [TaskDesc]) VALUES (3001, N'ÿ��һʤ', 2, 2, 1, 0, 400, N'Ӯ�ý��յ�һ��ʤ��')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'Game.FleeMultipleNum', N'10', N'��Ϸ������ͱ���')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'Game.Table.AIFirstOutCardTime', N'15000', N'������һ�ֳ��Ƽ��ʱ��')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'Game.Table.AIIntoTime', N'10000', N'�����˼�������ʱ����(����)')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'Game.Table.AIOutCardTime', N'5000', N'�����˳��Ƽ��5000��')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'Game.Table.MinTableCount', N'10', N'��ʼ����������')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'Ranking.OfficeNumber', N'100', N'��ʤ�ʰ���ܳ���')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'User.DailyFreeNum', N'3', N'ÿ��ת�̻��Ѵ���')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'User.DailyGiffCoinTime', N'1', N'ÿ�����ͽ𶹴���')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'User.GameCoin', N'10000', N'���ǳ�ʼ��')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'User.GiftGold', N'50', N'���ǳ�ʼ����Ԫ��')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'User.Level', N'1', N'���ǳ�ʼ�ȼ�')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'User.MaxLength', N'12', N'�ǳ���󳤶�')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'User.MinLength', N'4', N'�ǳ���С����')
	INSERT [ConfigEnvSet] ([EnvKey], [EnvValue], [EnvDesc]) VALUES (N'User.VipLv', N'0', N'���ǳ�ʼVIP�ȼ�')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (103, N'����3', 1, 3, N'card_1066')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (104, N'����4', 1, 4, N'card_1070')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (105, N'����5', 1, 5, N'card_1074')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (106, N'����6', 1, 6, N'card_1078')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (107, N'����7', 1, 7, N'card_1082')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (108, N'����8', 1, 8, N'card_1086')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (109, N'����9', 1, 9, N'card_1090')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (110, N'����10', 1, 10, N'card_1094')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (111, N'����J', 1, 11, N'card_1098')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (112, N'����Q', 1, 12, N'card_1102')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (113, N'����K', 1, 13, N'card_1106')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (114, N'����A', 1, 14, N'card_1110')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (115, N'����2', 1, 15, N'card_1062')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (203, N'÷��3', 2, 3, N'card_1068')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (204, N'÷��4', 2, 4, N'card_1072')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (205, N'÷��5', 2, 5, N'card_1076')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (206, N'÷��6', 2, 6, N'card_1080')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (207, N'÷��7', 2, 7, N'card_1084')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (208, N'÷��8', 2, 8, N'card_1088')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (209, N'÷��9', 2, 9, N'card_1092')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (210, N'÷��10', 2, 10, N'card_1096')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (211, N'÷��J', 2, 11, N'card_1100')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (212, N'÷��Q', 2, 12, N'card_1104')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (213, N'÷��K', 2, 13, N'card_1108')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (214, N'÷��A', 2, 14, N'card_1112')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (215, N'÷��2', 2, 15, N'card_1064')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (303, N'��Ƭ3', 3, 3, N'card_1065')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (304, N'��Ƭ4', 3, 4, N'card_1069')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (305, N'��Ƭ5', 3, 5, N'card_1073')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (306, N'��Ƭ6', 3, 6, N'card_1077')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (307, N'��Ƭ7', 3, 7, N'card_1081')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (308, N'��Ƭ8', 3, 8, N'card_1085')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (309, N'��Ƭ9', 3, 9, N'card_1089')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (310, N'��Ƭ10', 3, 10, N'card_1093')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (311, N'��ƬJ', 3, 11, N'card_1097')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (312, N'��ƬQ', 3, 12, N'card_1101')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (313, N'��ƬK', 3, 13, N'card_1105')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (314, N'��ƬA', 3, 14, N'card_1109')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (315, N'��Ƭ2', 3, 15, N'card_1061')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (403, N'����3', 4, 3, N'card_1067')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (404, N'����4', 4, 4, N'card_1071')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (405, N'����5', 4, 5, N'card_1075')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (406, N'����6', 4, 6, N'card_1079')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (407, N'����7', 4, 7, N'card_1083')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (408, N'����8', 4, 8, N'card_1087')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (409, N'����9', 4, 9, N'card_1091')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (410, N'����10', 4, 10, N'card_1095')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (411, N'����J', 4, 11, N'card_1099')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (412, N'����Q', 4, 12, N'card_1103')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (413, N'����K', 4, 13, N'card_1107')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (414, N'����A', 4, 14, N'card_1111')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (415, N'����2', 4, 15, N'card_1063')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (518, N'С��', 5, 18, N'card_1114')
	INSERT [PokerInfo] ([Id], [Name], [Color], [Value], [HeadIcon]) VALUES (619, N'����', 6, 19, N'card_1113')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1001, N'���찡������һ�����ƵĻ���ɣ�')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1002, N'������˵��Ѿ�ܿ����')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1003, N'���������ƶ������µ�����')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1004, N'�������Һ���ƴ��!')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1005, N'�����������˲��𰡣�')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1006, N'����������̫����ˣ�')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1007, N'ũ���ֵܣ���Ҫ�۸���������')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1008, N'�ֵܣ��������ʲô��ѽ��')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1009, N'�����ϰ��հ������������ˣ�')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1010, N'�⸱����Ӯ���ˣ�')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1011, N'���Ʒ��ģ�����̫�����ˣ�')
	INSERT [ChatInfo] ([Id], [Content]) VALUES (1012, N'����һ�ã�����ͺã�')
END
GO