------------------------------------------------------------------
--CardConfig.lua
-- Author     : JMChen
-- Version    : 1.0.0.0
-- Date       : 2011-10-15
-- Description:
------------------------------------------------------------------


module("CardConfig", package.seeall)


function getCardInfoByid(id)
	if RecordInfos[id] then	
		return RecordInfos[id]
	end
end;


RecordInfos={}
RecordInfos[103]={CardId=103,Name="����3",Color=1,Value=3,HeadIcon="card_1066"}

RecordInfos[104]={CardId=104,Name="����4",Color=1,Value=4,HeadIcon="card_1070"}

RecordInfos[105]={CardId=105,Name="����5",Color=1,Value=5,HeadIcon="card_1074"}

RecordInfos[106]={CardId=106,Name="����6",Color=1,Value=6,HeadIcon="card_1078"}

RecordInfos[107]={CardId=107,Name="����7",Color=1,Value=7,HeadIcon="card_1082"}

RecordInfos[108]={CardId=108,Name="����8",Color=1,Value=8,HeadIcon="card_1086"}

RecordInfos[109]={CardId=109,Name="����9",Color=1,Value=9,HeadIcon="card_1090"}

RecordInfos[110]={CardId=110,Name="����10",Color=1,Value=10,HeadIcon="card_1094"}

RecordInfos[111]={CardId=111,Name="����J",Color=1,Value=11,HeadIcon="card_1098"}

RecordInfos[112]={CardId=112,Name="����Q",Color=1,Value=12,HeadIcon="card_1102"}

RecordInfos[113]={CardId=113,Name="����K",Color=1,Value=13,HeadIcon="card_1106"}

RecordInfos[114]={CardId=114,Name="����A",Color=1,Value=14,HeadIcon="card_1110"}

RecordInfos[115]={CardId=115,Name="����2",Color=1,Value=15,HeadIcon="card_1062"}

RecordInfos[203]={CardId=203,Name="÷��3",Color=2,Value=3,HeadIcon="card_1068"}

RecordInfos[204]={CardId=204,Name="÷��4",Color=2,Value=4,HeadIcon="card_1072"}

RecordInfos[205]={CardId=205,Name="÷��5",Color=2,Value=5,HeadIcon="card_1076"}

RecordInfos[206]={CardId=206,Name="÷��6",Color=2,Value=6,HeadIcon="card_1080"}

RecordInfos[207]={CardId=207,Name="÷��7",Color=2,Value=7,HeadIcon="card_1084"}

RecordInfos[208]={CardId=208,Name="÷��8",Color=2,Value=8,HeadIcon="card_1088"}

RecordInfos[209]={CardId=209,Name="÷��9",Color=2,Value=9,HeadIcon="card_1092"}

RecordInfos[210]={CardId=210,Name="÷��10",Color=2,Value=10,HeadIcon="card_1096"}

RecordInfos[211]={CardId=211,Name="÷��J",Color=2,Value=11,HeadIcon="card_1100"}

RecordInfos[212]={CardId=212,Name="÷��Q",Color=2,Value=12,HeadIcon="card_1104"}

RecordInfos[213]={CardId=213,Name="÷��K",Color=2,Value=13,HeadIcon="card_1108"}

RecordInfos[214]={CardId=214,Name="÷��A",Color=2,Value=14,HeadIcon="card_1112"}

RecordInfos[215]={CardId=215,Name="÷��2",Color=2,Value=15,HeadIcon="card_1064"}

RecordInfos[303]={CardId=303,Name="��Ƭ3",Color=3,Value=3,HeadIcon="card_1065"}

RecordInfos[304]={CardId=304,Name="��Ƭ4",Color=3,Value=4,HeadIcon="card_1069"}

RecordInfos[305]={CardId=305,Name="��Ƭ5",Color=3,Value=5,HeadIcon="card_1073"}

RecordInfos[306]={CardId=306,Name="��Ƭ6",Color=3,Value=6,HeadIcon="card_1077"}

RecordInfos[307]={CardId=307,Name="��Ƭ7",Color=3,Value=7,HeadIcon="card_1081"}

RecordInfos[308]={CardId=308,Name="��Ƭ8",Color=3,Value=8,HeadIcon="card_1085"}

RecordInfos[309]={CardId=309,Name="��Ƭ9",Color=3,Value=9,HeadIcon="card_1089"}

RecordInfos[310]={CardId=310,Name="��Ƭ10",Color=3,Value=10,HeadIcon="card_1093"}

RecordInfos[311]={CardId=311,Name="��ƬJ",Color=3,Value=11,HeadIcon="card_1097"}

RecordInfos[312]={CardId=312,Name="��ƬQ",Color=3,Value=12,HeadIcon="card_1101"}

RecordInfos[313]={CardId=313,Name="��ƬK",Color=3,Value=13,HeadIcon="card_1105"}

RecordInfos[314]={CardId=314,Name="��ƬA",Color=3,Value=14,HeadIcon="card_1109"}

RecordInfos[315]={CardId=315,Name="��Ƭ2",Color=3,Value=15,HeadIcon="card_1061"}

RecordInfos[403]={CardId=403,Name="����3",Color=4,Value=3,HeadIcon="card_1067"}

RecordInfos[404]={CardId=404,Name="����4",Color=4,Value=4,HeadIcon="card_1071"}

RecordInfos[405]={CardId=405,Name="����5",Color=4,Value=5,HeadIcon="card_1075"}

RecordInfos[406]={CardId=406,Name="����6",Color=4,Value=6,HeadIcon="card_1079"}

RecordInfos[407]={CardId=407,Name="����7",Color=4,Value=7,HeadIcon="card_1083"}

RecordInfos[408]={CardId=408,Name="����8",Color=4,Value=8,HeadIcon="card_1087"}

RecordInfos[409]={CardId=409,Name="����9",Color=4,Value=9,HeadIcon="card_1091"}

RecordInfos[410]={CardId=410,Name="����10",Color=4,Value=10,HeadIcon="card_1095"}

RecordInfos[411]={CardId=411,Name="����J",Color=4,Value=11,HeadIcon="card_1099"}

RecordInfos[412]={CardId=412,Name="����Q",Color=4,Value=12,HeadIcon="card_1103"}

RecordInfos[413]={CardId=413,Name="����K",Color=4,Value=13,HeadIcon="card_1107"}

RecordInfos[414]={CardId=414,Name="����A",Color=4,Value=14,HeadIcon="card_1111"}

RecordInfos[415]={CardId=415,Name="����2",Color=4,Value=15,HeadIcon="card_1063"}

RecordInfos[518]={CardId=518,Name="С��",Color=5,Value=18,HeadIcon="card_1114"}

RecordInfos[619]={CardId=619,Name="����",Color=6,Value=19,HeadIcon="card_1113"}

