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
namespace ZyGames.Framework.Game.Combat
{
    /// <summary>
    /// 战斗控制器接口
    /// </summary>
    public interface ICombatController
    {
		/// <summary>
		/// Gets the single combat.
		/// </summary>
		/// <returns>The single combat.</returns>
		/// <param name="args">Arguments.</param>
        ISingleCombat GetSingleCombat(object args);

		/// <summary>
		/// Gets the many one combat.
		/// </summary>
		/// <returns>The many one combat.</returns>
		/// <param name="args">Arguments.</param>
        IManyOneCombat GetManyOneCombat(object args);

		/// <summary>
		/// Gets the multi combat.
		/// </summary>
		/// <returns>The multi combat.</returns>
		/// <param name="args">Arguments.</param>
        IMultiCombat GetMultiCombat(object args);
    }
}