--
-- TypeData.lua.lua
-- 91War
--
-- Created by LinKequn on 8/30/2011.
-- Copyright 2008 ND, Inc. All rights reserved.
--

module("TypeData", package.seeall)

-- �������õ��ĳ�Ա����Ҫ���ļ�ͷ���������������ӱ�Ҫ��˵��
-- ��Ա����ͳһ���»��߿�ʼ�����ӵ�����ĸҪСд


--
---------------���нӿ�(�������������̶����øı�)--------
--

-- ��������Сд��ĸ��ʼ��ÿ��������Ӧע��

-- �������
function pushScene()
	initResource()
	createScene()
	CCDirector:sharedDirector():pushScene(_scene)
end
-- �˳�����
function popScene()
	releaseResource()
	CCDirector:sharedDirector():popScene()
end

--
-------------------------˽�нӿ�------------------------'
---������������
function AttrType(type)
    if type then
 local table={
		[1]={name=Language.NATT},--="�ڹ�"
		[2]={name=Language.NDEF},--="�ڷ�"
		[3]={name=Language.WATT},--="�⹥"
		[4]={name=Language.WDEF},--="�⹥"
		[5]={name=Language.HATT},--="�ṥ"
		[6]={name=Language.HDEF},--="���"
		[7]={name=Language.HIT},--="����"
		[8]={name=Language.EVA},--="����"
		[9]={name=Language.IATT},--="����"
		[10]={name=Language.IDEF},--="����"
		[11]={name=Language.FATT},--="��"
		[12]={name=Language.FDEF},--="���"
		[13]={name=Language.TATT},--="�׹�"
		[14]={name=Language.TDEF},--="�׷�"
		[15]={name=Language.PATT},--="����"
		[16]={name=Language.PDEF},--="����"
		[17]={name=Language.STR},--="����"
		[18]={name=Language.SPR},--="����"
		[19]={name=Language.VIT},--="����"
		[20]={name=Language.CRE},--="����"
		[21]={name=Language.AGI},--="��"
		[22]={name=Language.VITALITY},--="����"
		[23]={name=Language.ENERGY},--="����"
		[24]={name=Language.HP},--="Ѫ"
		[25]={name=Language.AIR},--="Ѫ"
		[26]={name=Language.FRUY},--="ŭ"
		[27]={name=Language.HPCEL},--="Ѫ����"
		[28]={name=Language.AIRCEL},--="������"
		[29]={name=Language.REVIVE},--="����"
		[30]={name=Language.EXP},--="����"
		[31]={name=Language.FJTYPE_JSBKX},--="���ٱ�����"
        [32]={name=Language.FJTYPE_JDBKXXX},--="���ͱ���������"
        [33]={name=Language.FJTYPE_JSHKX},--="���ٻ���"
        [34]={name=Language.FJTYPE_JDHKXXX},--="���ͻ�������"
        [35]={name=Language.FJTYPE_JSLKX},--="�����׿���"
        [36]={name=Language.FJTYPE_JDLXXXX},--="�����׿�������"
        [37]={name=Language.FJTYPE_JSDKX},--="���ٶ�����"
        [38]={name=Language.FJTYPE_JDDKXXX},--="���Ͷ���������"
        [39]={name=Language.SHUANGBEIJINQIAN},--="˫����Ǯ"
        [40]={name=Language.SHUANGBEIJINGYAN},--="˫������"

	}
		return table[type].name;
	end
end
--��ʯ����
function GemType(type)
if type then
    local table={};
    table={
    [1]={name=Language.BAOSHI_XIWANGBAOSHI},--ϣ����ʯ
    [2]={name=Language.BAOSHI_ZHIHUIBAOHSI},--�ǻ۱�ʯ
    [3]={name=Language.BAOSHI_XUANWEIBAOSHI},--��΢��ʯ
    [4]={name=Language.BAOSHI_HUANMINGBAOSHI},--��ڤ��ʯ
    [5]={name=Language.BAOSHI_XIWANGBAOSHI},--ϣ����ʯ
    [6]={name=Language.BAOSHI_MEILIBAOSHI},--������ʯ
    [7]={name=Language.BAOSHI_MINGYUNBAOSHI},--���˱�ʯ
    [8]={name=Language.BAOSHI_TIANJIBAOSHI},--�����ʯ
    [9]={name=Language.BAOSHI_SHENGLIBAOSHI},--ʤ����ʯ
           }
     return table[type].name
end
end
--��������
function ElementType(type)
    if type then
        local table={};
        table={
        [1]={type=Language.WUHUN_FENG,kz=Language.WUHUN_DI,bkz=Language.WUHUN_HUO},--��--���Ƶ�    �������
        [2]={type=Language.WUHUN_DI,kz=Language.WUHUN_HUO,bkz=Language.WUHUN_FENG},--��--����ˮ    �������
        [3]={type=Language.WUHUN_SHUI,kz=Language.WUHUN_HUO,bkz=Language.WUHUN_DI},--ˮ--���ƻ�    ���ؿ���
        [4]={type=Language.WUHUN_HUO,kz=Language.WUHUN_FENG,bkz=Language.WUHUN_SHUI},--��--���Ʒ�    ��ˮ����
                }
    return table[type];
    end
end
--��������
function ProfessionType(type)
    if type then
        local table={};
        table={[1]={type=Language.LOGIN_DAWU},--����
                [2]={type=Language.LOGIN_SANQING},--����
                [3]={type=Language.LOGIN_SHENNONG},--��ũ
                [4]={type=Language.LOGIN_XUANYUAN},--��ԯ
                [5]={type=Language.LOGIN_GUIMEI},--����
                }
     return table[type];
    end
end
--ȥ����
function gotoMenPai(type)
	if type then
		local table={[1]={name=Language.Task_GotoMengPai_[type],Id=2001},--ȥ��������
					[2]={name=Language.Task_GotoMengPai_[type],Id=2002},--ȥ��������
					[3]={name=Language.Task_GotoMengPai_[type],Id=2003},--ȥ��ũ����
					[4]={name=Language.Task_GotoMengPai_[type],Id=2004},--ȥ��ԯ����
					[5]={name=Language.Task_GotoMengPai_[type],Id=2005},--ȥ��������
					}
		return table[type]
	end
end
function TrendType(type)
    if type then
        local table={[0]={type=Language.SPORT_BUBIAN,color=ccWHITE},--����--��ɫ
                    [1]={type=Language.SPORT_SHANGSHENG,color=ccGREEN},--����--��ɫ
                    [2]={type=Language.SPORT_XIAJIANG,color=ccRED},--�½�--��ɫ
                    }
        return table[type]
    end
end
--��Ծ��ö��
function DailyTaskType(type)
	if type then
		local table={[1]={type=Language.HUOYUDU_[type]},--��¼
					[2]={type=Language.HUOYUDU_[type]},--�
					[3]={type=Language.HUOYUDU_[type]},--����
					[4]={type=Language.HUOYUDU_[type]},--����
					[5]={type=Language.HUOYUDU_[type]},--����
					}
		return table[type]
	end
end