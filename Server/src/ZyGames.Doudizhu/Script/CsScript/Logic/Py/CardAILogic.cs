using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZyGames.Framework.Cache.Generic;
using ZyGames.Doudizhu.Model;

namespace ZyGames.Doudizhu.Bll.Logic
{
    public class CardAILogic
    {
        TableData mTableData;
        int mPlayerNum = 3;

        PositionData mLandlordData;
        PositionData mSelfData;
        PositionData mNextPos;
        PositionData mPrePos;

        const CardSize mCK = CardSize.C_K;//K
        const CardSize mCA = CardSize.C_A;//A
        const CardSize mC2 = CardSize.C_2;//2
        const CardSize mCW1 = CardSize.C_18;//小王
        const CardSize mCW2 = CardSize.C_19;//大王
        CardSize mLargestCardSize = CardSize.C_19;

        int mRole;//0:地主 -1：上家 1：下家

        public CardAILogic(int roomID,int tableID,int posID)
        {
            var roomStruct = new MemoryCacheStruct<RoomData>();
            RoomData roomData;
            if(roomStruct.TryGet(roomID.ToString(), out roomData))
            {
                if(roomData.Tables.TryGetValue(tableID, out mTableData))
                {
                    mPlayerNum = mTableData.PlayerNum;
                }
            }

            if(null != mTableData && posID < mTableData.Positions.Length)
            {
                int tempCard = 0;
                foreach(var pos in mTableData.Positions)
                {
                    if(pos.IsLandlord)
                    {
                        mLandlordData = pos;
                    }
                    if(pos.Id == posID)
                    {
                        mSelfData = pos;
                    }

                    if(null != pos.CardData && pos.CardData.Count > 0)
                    {
                        int lastCardVal = pos.CardData[pos.CardData.Count - 1] % 100;
                        if(lastCardVal > tempCard)
                        {
                            tempCard = lastCardVal;
                        }
                    }
                }

                if(tempCard > 0)
                {
                    mLargestCardSize = (CardSize)tempCard;
                }
            }

            if(null != mLandlordData && null != mSelfData)
            {
                int nextIndex = (mSelfData.Id + 1) % mPlayerNum;
                mNextPos = mTableData.Positions[nextIndex];
                int preIndex = (mSelfData.Id + mPlayerNum - 1) % mPlayerNum;
                mPrePos = mTableData.Positions[preIndex];

                if(mLandlordData.Id == mSelfData.Id)
                {
                    mRole = 0;
                }
                else if(mLandlordData.Id == mNextPos.Id)
                {
                    mRole = -1;
                }
                else
                {
                    mRole = 1;
                }
            }
        }
        
        //获取牌大小
        public CardSize GetCardSize(int card)
        {
            return (CardSize)(card % 100);
        }

        //出牌对象
        public CardData GetOutCardData()
        {
            return mTableData.PreCardData;
        }

        //获取已出牌纪录
        public List<CardData> GetOutCardResult()
        {
            return mTableData.OutCardList;
        }

        //获取玩家手上的牌
        public List<int> GetUserCard()
        {
            return mSelfData.CardData;
        }

        //玩家角色 0：地主 -1：上家 1：下家位置
        public int GetUserRole()
        {
            return mRole;
        }

        //获取玩家下家牌数
        public int GetNextPosCardCount()
        {
            return mNextPos.CardData.Count;
        }

        //获取玩家上家牌数
        public int GetPrePosCardCount()
        {
            return mPrePos.CardData.Count;
        }

        //检查能否叫地主 火箭为8分，炸弹为6分，大王4分，小王3分，2为2分
        public bool CheckCall()
        {
            int bigCardValue = 0;
            List<int> cards = GetUserCard();
            int times = mTableData.MultipleNum / 2;
            List<int> bombCards = new List<int>();
            CardVector bombVec = new CardVector(DeckType.Bomb);
            GetBombCard(cards, ref bombVec);
            bombCards.AddRange(bombVec.GetList());
            CardVector wangVec = new CardVector(DeckType.WangBomb);
            GetWangBombCard(cards, ref wangVec);
            bombCards.AddRange(wangVec.GetList());
            CardVector c2Vec = new CardVector(DeckType.Single);
            GetCard(cards, mC2, ref c2Vec);
            int c2Count = c2Vec.GetList().Count;

            if (2 == wangVec.GetCount())
            {
                bigCardValue += 8;
            }

            bigCardValue += bombVec.GetCount() * 6;

            if(0 == bombCards.Count)
            {
                GetCard(cards, mCW1, ref wangVec);
                GetCard(cards, mCW2, ref wangVec);
                if(wangVec.HasKey(mCW2))
                {
                    bigCardValue += 4;
                }
                if(wangVec.HasKey(mCW1))
                {
                    bigCardValue += 3;
                }
            }
            if(4 > c2Count)
            {
                bigCardValue += c2Count * 2;
            }

            if((7 <= bigCardValue && 3 > times) || (5 <= bigCardValue && 2 > times) || (2 <= bigCardValue && 1 > times))
            {
                return true;
            }

            return false;
        }

        //出牌搜索，牌组0：为空，1：单牌，2：对牌，3：王炸，4：三张，5：三带一，6：三带二，7：炸弹，8：顺子，9：四带二，10：连对，11：飞机，12：飞机带二，13：二连飞机带二对
        public List<int> SearchOutCard()
        {
            List<int> resultCards = new List<int>();
            List<int> handCard = GetUserCard();
            if(null == handCard || 0 == handCard.Count)
            {
                return resultCards;
            }

            int myCardCount = handCard.Count;
            int handleTimes = GetCardHandleTimes(handCard);
            return resultCards;
        }


        //拆牌算法
        public CardVector SplitCard(List<int> handCard)
        {
            CardVector vec = new CardVector(DeckType.All);
            CardVector wangVec = new CardVector(DeckType.WangBomb);
            CardVector bombVec = new CardVector(DeckType.Bomb);
            CardVector shunVec = new CardVector(DeckType.Shunzi);
            CardVector threeVec = new CardVector(DeckType.Three);
            CardVector doubleVec = new CardVector(DeckType.Double);
            CardVector singleVec = new CardVector(DeckType.Single);

            List<int> lastCards = new List<int>();

            if(2 == handCard.Count)
            {
                if(mCW1 == GetCardSize(handCard[0]) && mCW2 == GetCardSize(handCard[1]))
                {
                    wangVec.Add(GetCardSize(handCard[0]), new List<int>(handCard[0]));
                    wangVec.Add(GetCardSize(handCard[1]), new List<int>(handCard[1]));
                }
            }

            if(1 < handCard.Count)
            {
                lastCards = GetUnrelatedCard(handCard, ref singleVec);
                lastCards = GetBombCard(lastCards, ref bombVec);
                lastCards = GetFlyCard(lastCards, ref threeVec);
                lastCards = GetShunTwoCard(lastCards, ref shunVec);
                lastCards = GetThreeCard(lastCards, ref threeVec);
                lastCards = GetTwoCard(lastCards, ref doubleVec);
                lastCards = CheckSingleAsShun(lastCards, ref shunVec);
            }
            else
            {
                lastCards = handCard;
            }
            lastCards = GetSingleCard(lastCards, ref singleVec);
            vec.AddChild(wangVec);
            vec.AddChild(bombVec);
            vec.AddChild(shunVec);
            vec.AddChild(threeVec);
            vec.AddChild(doubleVec);
            vec.AddChild(singleVec);

            return vec;
        }

        //取出无关联的牌，返回剩余的关联牌
        public List<int> GetUnrelatedCard(List<int> handCard, ref CardVector vec)
        {
            List<int> arr = new List<int>();
            List<int> lastCards = new List<int>();
            CardSize eqVal = 0;
            int count = handCard.Count;
            if(count < 2)
            {
                return handCard;
            }

            for(int i = 0; i < count; ++i)
            {
                int card = handCard[i];
                CardSize val = GetCardSize(card);
                if(0 == i)
                {
                    arr.Add(card);
                    continue;
                }

                int preCard = handCard[i - 1];
                CardSize preVal = GetCardSize(preCard);
                if(val == preVal)
                {
                    arr.Add(card);
                }
                else
                {
                    if((preVal >= mC2) || (((0 == eqVal) || (eqVal != preVal - 1)) && ((val == mC2) || preVal < val - 1)))
                    {
                        AddVector(ref vec, preVal, arr);
                    }
                    else
                    {
                        lastCards.AddRange(arr);
                    }

                    arr = new List<int>();
                    eqVal = preVal;
                    arr.Add(card);
                }
                if(i == count - 1)
                {
                    if(val >= mC2 || eqVal < val - 1)
                    {
                        if(val == mCW1 || (preVal < mCW1 && val == mCW2))
                        {
                            vec.GetChild(DeckType.Single).Add(val, new List<int>(card));
                        }
                        else
                        {
                            lastCards.AddRange(arr);
                        }
                    }
                }
            }

            return lastCards;
        }

        public List<int> GetShunCard(List<int> handCard, ref CardVector vec)
        {
            List<int> lastCards = new List<int>();
            int count = handCard.Count;
            if(2 >count)
            {
                return handCard;
            }

            List<int> arr = new List<int>();
            List<int> arrIgnore = new List<int>();
            List<int> arrLog = new List<int>();

            for(int i = 0; i < count; ++i)
            {
                int card = handCard[i];
                if(0 == i)
                {
                    arr.Add(card);
                    arrLog.Add(card);
                    continue;
                }

                int preCard = handCard[i - 1];
                CardSize preVal = GetCardSize(preCard);
                CardSize val = GetCardSize(card);

                if(preVal == val -1 && val < mC2)
                {
                    arr.Add(card);
                    arrLog.Add(card);
                }
                else if(preVal == val)
                {
                    arrIgnore.Add(card);
                    arrLog.Add(card);
                }
                else
                {
                    if(5 <= arr.Count)
                    {
                        vec.Add(GetCardSize(arr[0]), arr);
                        lastCards.AddRange(arrIgnore);
                    }
                    else
                    {
                        lastCards.AddRange(arrLog);
                    }

                    arr = new List<int>();
                    arr.Add(card);
                    arrLog = new List<int>();
                    arrLog.Add(card);
                    arrIgnore = new List<int>();
                }

                if(i == count - 1)
                {
                    if(5 <= arr.Count)
                    {
                        vec.Add(GetCardSize(arr[0]), arr);
                        lastCards.AddRange(arrIgnore);
                        arrIgnore = new List<int>();
                    }
                    else
                    {
                        lastCards.AddRange(arrLog);
                    }
                }
            }
            return lastCards;
        }

        //从顺子cards对象中获取顺子大于minVal的牌
        public List<int> GetMoreThanShunCard( List<int> handCard, CardSize minVal, int minCount, int maxCount = 0)
        {
            List<int> result = new List<int>();
            int length = result.Count;
            foreach(int card in handCard)
            {
                CardSize val = GetCardSize(card);
                if(val > minVal && val < mC2 && ((0 == maxCount && length < minCount) ||(0 < maxCount && length < maxCount -1)))
                {
                    result.Add(card);
                }
            }
            if((0 == maxCount && result.Count == minCount) || (0 < maxCount && result.Count >= minCount))
            {
                return result;
            }
            return new List<int>();
        }

        //取出王炸牌至wangVec，返回剩余的牌
        public List<int> GetWangBombCard(List<int> handCard, ref CardVector wangVec)
        {
            List<int> arr = new List<int>();
            List<int> temp = new List<int>();
            int count = handCard.Count;
            for (int i = 0; i < count; ++i)
            {
                int card = handCard[i];
                CardSize val = GetCardSize(card);
                if (val == mCW1 || val == mCW2)
                {
                    temp.Add(card);
                }
                else
                {
                    arr.Add(card);
                }
            }
            if (temp.Count == 2)
            {
                foreach (int card in temp)
                {
                    wangVec.Add(GetCardSize(card), new List<int>(card));
                }
            }
            else
            {
                arr.AddRange(temp);
            }
            return arr;
        }

        //获取炸弹至vector对象返回剩余牌
        public List<int> GetBombCard(List<int> handCard, ref CardVector bombVec)
        {
            return GetSameCard(handCard, 4, ref bombVec);
        }

        //取出飞机对象至Vector对象，返回剩余的牌
        public List<int> GetFlyCard(List<int> handCard, ref CardVector vec)
        {
            if(5 < handCard.Count)
            {
                CardVector threeVec = new CardVector(DeckType.Three);
                GetThreeCard(handCard, ref threeVec);
                if(1 < threeVec.GetCount())
                {
                    List<int> arr = GetMoreThanCardVal(ref threeVec, 0, 2, 20);
                    GetSameCard(arr, 3, ref vec);
                    foreach(int card in arr)
                    {
                        handCard.Remove(card);
                    }
                }
            }
            return handCard;
        }

        //取出大于3连对至Vector对象，返回剩余牌
        public List<int> GetShunTwoCard(List<int> handCard, ref CardVector vec)
        {
            if(6 < handCard.Count)
            {
                CardVector twoVec = new CardVector(DeckType.Double);
                GetTwoCard(handCard, ref twoVec);
                if(3 < twoVec.GetCount())
                {
                    List<int> arr = GetMoreThanCardVal(ref twoVec, 0, 4, 20);
                    GetSameCard(arr, 2, ref vec);
                    foreach(int card in arr)
                    {
                        handCard.Remove(card);
                    }
                }
            }
            return handCard;
        }

        //取出3条至Vector对象，返回剩余牌
        public List<int> GetThreeCard(List<int> handCard, ref CardVector vec)
        {
            return GetSameCard(handCard, 3, ref vec);
        }

        //去除对子至Vector对象，返回剩余牌
        public List<int> GetTwoCard(List<int> handCard, ref CardVector vec, bool matchThree=false)
        {
            List<int> lastCards = GetSameCard(handCard, 2, ref vec);
            if(matchThree)
            {
                CardVector threeVec = new CardVector(DeckType.Three);
                lastCards = GetSameCard(handCard, 3, ref threeVec);
                if(0 < threeVec.GetCount())
                {
                    List<CardSize> keys = threeVec.GetKeys();
                    foreach(CardSize key in keys)
                    {
                        List<int> val = threeVec.Get(key);
                        List<int> arr = new List<int>();
                        CopyList(val, ref arr, 0, 2);
                        vec.Add(key, arr);
                    }
                }
            }

            return lastCards;
        }

        public List<int> GetMoreThanCardVal(ref CardVector vec, CardSize minVal, int minCount, int maxCount = 0)
        {
            List<CardSize> arr = new List<CardSize>();
            List<int> resultCards = new List<int>();

            List<CardSize> keys = vec.GetKeys();
            for(int i = 0; i < keys.Count; ++i)
            {
                CardSize key = keys[i];
                if(0 == i && key > minVal && key < mC2)
                {
                    arr.Add(key);
                }
                else if(key > minVal)
                {
                    CardSize preKey = keys[i - 1];
                    if(preKey == key - 1 && key < mC2)
                    {
                        arr.Add(key);
                        if(0 == maxCount && arr.Count == minCount)
                        {
                            break;
                        }
                    }
                    else
                    {
                        if(arr.Count >= minCount)
                        {
                            break;
                        }
                        else
                        {
                            arr = new List<CardSize>();
                            arr.Add(key);
                        }
                    }
                }
            }

            int length = arr.Count;
            if(length >= minCount)
            {
                for(int i = 0; i < length; ++i)
                {
                    if((0 == maxCount && i == minCount) || (0 < maxCount && i >= maxCount - 1))
                    {
                        break;
                    }

                    CopyList(vec.Get(arr[i]), ref resultCards);
                }
            }

            return resultCards;
        }

        //检查单牌是否可加到顺子中，返回剩余牌
        public List<int> CheckSingleAsShun(List<int> handCard, ref CardVector vec)
        {
            CardVector shunVec = vec;
            List<CardSize> keys = shunVec.GetKeys();
            if(0 == keys.Count)
            {
                return handCard;
            }

            List<int> lastCards = new List<int>();
            foreach(int card in handCard)
            {
                bool suc = false;
                foreach(CardSize key in keys)
                {
                    List<int> items = shunVec.Get(key);
                    if(0 == items.Count)
                    {
                        continue;
                    }

                    CardSize min = GetCardSize(items[0]);
                    CardSize max = GetCardSize(items[items.Count - 1]);
                    CardSize val = GetCardSize(card);
                    if(val == min - 1)
                    {
                        items.Insert(0, (int)val);
                        suc = true;
                        break;
                    }
                    else if(val == max + 1)
                    {
                        items.Add((int)val);
                        suc = true;
                        break;
                    }
                }
                if(!suc)
                {
                    lastCards.Add(card);
                }
            }
            return lastCards;
        }

        //将牌转至Vector对象
        public void ConverVerctor(List<int> handCard, ref CardVector vec)
        {
            foreach(int card in handCard)
            {
                vec.Add(GetCardSize(card), new List<int>(card));
            }
        }

        //取出单牌至Vector对象，返回剩余牌
        public List<int> GetSingleCard(List<int> handCard, ref CardVector vec)
        {
            return GetSameCard(handCard, 1, ref vec);
        }

        //取相同的牌，返回剩余的牌
        public List<int> GetSameCard(List<int> handCard, int num, ref CardVector vec)
        {
            List<int> lastCards = new List<int>();
            List<int> arr = new List<int>();
            int count = handCard.Count;
            if (2 > count)
            {
                if (0 < count && 1 == num)
                {
                    int card = handCard[0];
                    vec.Add(GetCardSize(card), new List<int>(card));
                    return arr;
                }
                else
                {
                    return handCard;
                }
            }
            for (int i = 0; i < count; ++i)
            {
                int card = handCard[i];
                if (0 == i)
                {
                    arr.Add(card);
                    continue;
                }

                int preCard = handCard[i - 1];
                CardSize val = GetCardSize(card);
                CardSize preVal = GetCardSize(preCard);
                if (val == preVal)
                {
                    arr.Add(card);
                }
                else
                {
                    if (arr.Count == num)
                    {
                        if (1 == num)
                        {
                            vec.Add(preVal, new List<int>(arr[0]));
                        }
                        else
                        {
                            vec.Add(preVal, arr);
                        }
                    }
                    else
                    {
                        lastCards.AddRange(arr);
                    }
                    arr = new List<int>();
                    arr.Add(card);
                }

                if (i == count - 1)
                {
                    if (arr.Count == num)
                    {
                        if (1 == num)
                        {
                            vec.Add(val, new List<int>(arr[0]));
                        }
                        else
                        {
                            vec.Add(val, arr);
                        }
                    }
                    else
                    {
                        lastCards.AddRange(arr);
                    }
                }
            }
            return lastCards;
        }

        //取出指定大小的牌至vec对象，返回剩余牌
        public List<int> GetCard(List<int> handCard, CardSize cardVal, ref CardVector vec)
        {
            List<int> arr = new List<int>();
            int count = handCard.Count;
            for (int i = 0; i < count; ++i)
            {
                int card = handCard[i];
                CardSize val = GetCardSize(card);
                if (cardVal == val)
                {
                    vec.Add(val, new List<int>(card));
                }
                else
                {
                    arr.Add(card);
                }
            }
            return arr;
        }

        //计算出牌手数
        public int GetCardHandleTimes(List<int> handCard)
        {
            CardVector vec = SplitCard(handCard);
            return GetVectorHandleTimes(vec);
        }

        //计算出牌手数
        public int GetVectorHandleTimes(CardVector vec)
        {
            int times = 0;
            if(0 < vec.GetChild(DeckType.WangBomb).GetCount())
            {
                times += 1;
            }

            int bombLen = vec.GetChild(DeckType.Bomb).GetCount();
            if(0 < bombLen)
            {
                times += bombLen;
            }
            times += vec.GetChild(DeckType.Shunzi).GetCount();
            int threeLen = vec.GetChild(DeckType.Three).GetCount();
            if(0 < threeLen)
            {
                times += threeLen;
            }
            int twoLen = vec.GetChild(DeckType.Double).GetCount();
            if(0 < twoLen)
            {
                times += twoLen;
            }
            int oneLen = vec.GetChild(DeckType.Single).GetCount();
            if(0 < oneLen)
            {
                times += oneLen;
            }

            times -= threeLen * 1;

            return times;
        }

        //计算单牌数
        public int GetSingleCount(CardVector vec)
        {
            return vec.GetChild(DeckType.Single).GetCount();
        }

        //计算对牌数
        public int GetTwoCount(CardVector vec)
        {
            return vec.GetChild(DeckType.Double).GetCount();
        }

        //增加到vector集合以及wang，bomb，three，two，one分类
        public void AddVector(ref CardVector vec, CardSize val, List<int> list)
        {
            int len = list.Count;
            if(0 < len && val >= mCW1)
            {
                vec.GetChild(DeckType.WangBomb).Add(val, list);
            }
            else if(4 == len)
            {
                vec.GetChild(DeckType.Bomb).Add(val, list);
            }
            else if(3 == len)
            {
                vec.GetChild(DeckType.Three).Add(val, list);
            }
            else if(2 == len)
            {
                vec.GetChild(DeckType.Double).Add(val, list);
            }
            else if(1 == len)
            {
                vec.GetChild(DeckType.Single).Add(val, list);
            }
        }

        public void CopyList(List<int> vec, ref List<int> clist, int index = 0, int count = 0)
        {
            for(int i = 0; i < vec.Count; ++i)
            {
                if(count > 0 && clist.Count == count)
                {
                    break;
                }
                if(i >= index)
                {
                    clist.Add(vec[i]);
                }
            }
        }
    }
}
