using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AJAXTesting
{
    public partial class MaskedField : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkButton_Click(object sender, EventArgs e)
        {
            lblText.Text = RandomDigits(9);
        }

        private string RandomDigits(int length)
        {
            var random = new Random();
            string s = string.Empty;
            for (int i = 0; i < length; i++)
                s = String.Concat(s, random.Next(10).ToString());
            return s;
        }

        protected void UpdatePanel1_Unload(object sender, EventArgs e)
        {
            var panel = (UpdatePanel)sender;
            UnloadUpdatePanel(panel);
        }

        public void UnloadUpdatePanel(UpdatePanel panel)
        {
            ScriptManager scriptManager;
            object[] updatePanel;
            MethodInfo[] allMethods;
            MethodInfo methodInfo;

            try
            {
                allMethods = typeof(ScriptManager).GetMethods(BindingFlags.NonPublic | BindingFlags.Instance);
                methodInfo = allMethods.Where(i => i.Name.Equals("System.Web.UI.IScriptManagerInternal.RegisterUpdatePanel")).First();

                scriptManager = ScriptManager.GetCurrent(Page);
                updatePanel = new object[] { panel };

                if (methodInfo == null || scriptManager == null | updatePanel == null)
                {
#if DEBUG
                    Console.WriteLine("Most likely missing the Script Manager in the host page.");
                    System.Diagnostics.Debugger.Break();
#endif
                }
            }
            catch (Exception ex)
            {
#if DEBUG
                Console.WriteLine("An unexpected error occurred. Please alert Kevin of the following error:");
                Console.WriteLine(ex.Message);
                System.Diagnostics.Debugger.Break();
#endif
                throw;
            }
            methodInfo.Invoke(ScriptManager.GetCurrent(Page), new object[] { panel as UpdatePanel });
        }

    }
}