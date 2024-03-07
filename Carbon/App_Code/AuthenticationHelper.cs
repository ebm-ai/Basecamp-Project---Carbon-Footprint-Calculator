using System.Web.Security;
using System.Web;
using System;


namespace Carbon { 
    public static class AuthenticationHelper
    {
        public static void Logout()
        {
            FormsAuthentication.SignOut(); // Sign out the user
            var cookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];
            if (cookie != null)
            {
                cookie.Expires = DateTime.Now.AddDays(-1);
                HttpContext.Current.Response.Cookies.Add(cookie);
            }
            HttpContext.Current.Session.Abandon(); // Abandon the session
        }
    }
}