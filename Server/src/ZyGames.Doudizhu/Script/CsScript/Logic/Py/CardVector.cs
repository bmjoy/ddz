using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZyGames.Doudizhu.Model;

namespace ZyGames.Doudizhu.Bll.Logic
{
    public class CardVector
    {
        public DeckType mCardType;
        public Dictionary<CardSize, List<int>> mCardData = new Dictionary<CardSize, List<int>>();

        public Dictionary<DeckType, CardVector> mChild = new Dictionary<DeckType, CardVector>();

        public void AddChild(CardVector vec)
        {
            if (mChild.ContainsKey(vec.mCardType))
            {
                mChild[vec.mCardType] = vec;
            }
            else
            {
                mChild.Add(vec.mCardType, vec);
            }
        }

        public CardVector GetChild(DeckType key)
        {
            if(mChild.ContainsKey(key))
            {
                return mChild[key];
            }
            return null;
        }

        public CardVector(DeckType type)
        {
            mCardType = type;
        }

        private CardVector()
        {

        }

        public void Add(CardSize key, List<int> cards)
        {
            List<int> cardsList = new List<int>();
            if (mCardData.TryGetValue(key, out cardsList))
            {
                cardsList.AddRange(cards);
                mCardData[key] = cardsList;
            }
            else
            {
                mCardData.Add(key, cards);
            }
        }

        public List<int> Get(CardSize key)
        {
            List<int> cardsList = new List<int>();
            if(mCardData.TryGetValue(key, out cardsList))
            {
                return cardsList;
            }
            return null;
        }

        public int GetCount()
        {
            return mCardData.Count;
        }

        public bool HasKey(CardSize key)
        {
            return mCardData.ContainsKey(key);
        }

        public List<CardSize> GetKeys()
        {
            List<CardSize> keys = new List<CardSize>();
            foreach(KeyValuePair<CardSize, List<int>> kvp in mCardData)
            {
                keys.Add(kvp.Key);
            }

            //foreach(KeyValuePair<DeckType, CardVector> kvp in mChild)
            //{
            //    foreach(KeyValuePair<CardSize, List<int>> kvp2 in kvp.Value.mCardData)
            //    {
            //        if(!keys.Contains(kvp2.Key))
            //        {
            //            keys.Add(kvp2.Key);
            //        }
            //    }
            //}
            keys.Sort();
            return keys;
        }

        public List<int> GetFirstVal()
        {
            List<CardSize> keys = GetKeys();
            if(0 < keys.Count)
            {
                return mCardData[keys[0]];
            }
            return null;
        }

        public List<int> GetLastVal()
        {
            List<CardSize> keys = GetKeys();
            if(0 < keys.Count)
            {
                return mCardData[keys[keys.Count - 1]];
            }
            return null;
        }

        public List<int> GetGreaterThan(CardSize k)
        {
            List<CardSize> keys = GetKeys();
            foreach(CardSize key in keys)
            {
                if(key > k)
                {
                    return mCardData[key];
                }
            }
            return null;
        }

        public List<int> GetMaxGreaterTran(CardSize k)
        {
            List<CardSize> keys = GetKeys();
            for(int i = keys.Count - 1; i >= 0; --i)
            {
                if(keys[i] > k)
                {
                    return mCardData[keys[i]];
                }
            }
            return null;
        }


        public List<int> GetList()
        {
            List<int> list = new List<int>();
            List<CardSize> keys = GetKeys();
            foreach(KeyValuePair<CardSize, List<int>>kvp in mCardData)
            {
                if(0 < kvp.Value.Count)
                {
                    list.AddRange(kvp.Value);
                }
            }
            return list;
        }

        public List<int> GetIndexVal(int index)
        {
            List<CardSize> keys = GetKeys();
            if(keys.Count > index)
            {
                return Get(keys[index]);
            }
            return null;
        }
    }
}
