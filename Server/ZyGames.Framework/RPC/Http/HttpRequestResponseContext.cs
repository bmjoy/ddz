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
using System.IO;
using System.Net;
using System.Security.Principal;

namespace ZyGames.Framework.RPC.Http
{
    /// <summary>
    /// 
    /// </summary>
    public sealed class HttpRequestResponseContext : IHttpRequestResponseContext
    {
        /// <summary>
        /// 
        /// </summary>
        public IHttpAsyncHostHandlerContext HostContext { get; private set; }
        /// <summary>
        /// 
        /// </summary>
        public HttpListenerRequest Request { get; private set; }
        /// <summary>
        /// 
        /// </summary>
        public IPrincipal User { get; private set; }
        /// <summary>
        /// 
        /// </summary>
        public HttpListenerResponse Response { get; private set; }
        /// <summary>
        /// 
        /// </summary>
        public Stream OutputStream { get { return Response.OutputStream; } }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="requestState"></param>
        /// <param name="response"></param>
        public HttpRequestResponseContext(IHttpRequestContext requestState, HttpListenerResponse response)
        {
            HostContext = requestState.HostContext;
            Request = requestState.Request;
            User = requestState.User;

            Response = response;
        }
    }
}
