using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace pronto02
{
    public class Utilidades
    {

        public static void Alert(Control control, string message) 
        {
            ScriptManager.RegisterStartupScript(control, control.GetType(), "alertMessage", "alert('" + message + "');", true);
        }
    }
}