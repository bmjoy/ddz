﻿/****************************************************************************
Copyright (c) 2013-2015 scutgame.com

http://www.scutgame.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
****************************************************************************/
namespace ZyGames.Framework.RPC.Sockets
{
    /// <summary>
    /// 
    /// </summary>
    public class OpCode
    {
        /// <summary>
        /// no process
        /// </summary>
        public const sbyte Empty = -1;

        /// <summary>
        /// 
        /// </summary>
        public const sbyte Continuation = 0;
        /// <summary>
        /// 
        /// </summary>
        public const sbyte Text = 1;
        /// <summary>
        /// 
        /// </summary>
        public const sbyte Binary = 2;
        /// <summary>
        /// 
        /// </summary>
        public const sbyte Close = 8;
        /// <summary>
        /// 
        /// </summary>
        public const sbyte Ping = 9;
        /// <summary>
        /// 
        /// </summary>
        public const sbyte Pong = 10;
    }
}