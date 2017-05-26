using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SecurityFramework.Utilities.Common
{
    /// =============================================================================================
    /// <summary>
    ///     Session Wrapper Utilities Class
    /// </summary>
    /// =============================================================================================
    internal static class SessionUtil
    {
        #region Session
        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        ///     Session
        /// </summary>
        /// <typeparam name="T">generics</typeparam>
        /// <param name="key">string</param>
        /// <returns>generics</returns>
        /// ---------------------------------------------------------------------------------------------
        public static T GetFromSession<T>(string key)
        {
            var obj = HttpContext.Current.Session[key];
            if (obj == null)
                return default(T);
            return (T)obj;
        }

        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        ///     Set in Session
        /// </summary>
        /// <typeparam name="T">generics</typeparam>
        /// <param name="key">string</param>
        /// <param name="value">T</param>
        /// ---------------------------------------------------------------------------------------------
        public static void SetInSession<T>(string key, T value)
        {
            if (value == null)
                HttpContext.Current.Session.Remove(key);
            else
                HttpContext.Current.Session[key] = value;
        }

        #endregion Session

        #region Application
        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        ///     Get from Application
        /// </summary>
        /// <typeparam name="T">generics</typeparam>
        /// <param name="key">string</param>
        /// <returns>generics</returns>
        /// ---------------------------------------------------------------------------------------------
        public static T GetFromApplication<T>(string key)
        {
            return (T)HttpContext.Current.Application[key];
        }

        /// ---------------------------------------------------------------------------------------------
        /// <summary>
        ///     Set from Application
        /// </summary>
        /// <typeparam name="T">generics</typeparam>
        /// <param name="key">string</param>
        /// <param name="value">T</param>
        /// ---------------------------------------------------------------------------------------------
        public static void SetInApplication<T>(string key, T value)
        {
            if (value == null)
                HttpContext.Current.Application.Remove(key);
            else
                HttpContext.Current.Application[key] = value;
        }

        #endregion Application
    }
}