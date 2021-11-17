using System;
using System.Linq;
using System.Reflection;
using System.Web.UI;

namespace AJAXTesting
{

    public enum MaskedControlType
    {
        None,
        Label,
        TextBox
    }
    public partial class MaskedField : System.Web.UI.UserControl
    {

        private string clientClickUnMask;
        private string clientClickReMask;
        private const string unMaskIcon = "<i class='fa fa-eye fa-2x'></i>";
        private const string reMaskIcon = "<i class='fa fa-eye-slash fa-2x'></i>";
        protected void Page_Load(object sender, EventArgs e)
        {
            clientClickUnMask = "unMask('" + txtField.ClientID + "','" + lnkButton.ClientID + "'," + Global.UnMaskTimeout + ")";
            clientClickReMask = "reMask('" + txtField.ClientID + "')";
            lnkButton.OnClientClick = clientClickUnMask;
            txtField.Attributes["data-is-masked"] = "true";
            txtField.Attributes["data-lnkbutton-id"] = lnkButton.ClientID;
            txtField.Attributes["data-unmask-timeout"] = Global.UnMaskTimeout;
        }

        protected void lnkButton_Click(object sender, EventArgs e)
        {
            ToggleMask();
        }

        private void ToggleMask()
        {
            txtField.Attributes["data-is-masked"] = IsMasked.ToString().ToLower();

            if (!IsMasked)
            {
                txtField.Enabled = false;
                //lnkButton.Style["visibility"] = "visible";

                lnkButton.OnClientClick = clientClickUnMask;
                lnkButton.Text = unMaskIcon;
                //if (ControlType == MaskedControlType.TextBox)
                lblField.Text = MaskedValue;
                txtField.Text = MaskedValue;
                lnkField.Text = MaskedValue;
                IsMasked = true;
            }
            else
            {
                lnkButton.OnClientClick = clientClickReMask;
                lnkButton.Text = reMaskIcon;
                //lnkButton.Style["visibility"] = "hidden";
                txtField.Enabled = true;

                lblField.Text = RandomDigits(9);
                txtField.Text = lblField.Text;
                lnkField.Text = lblField.Text;
                IsMasked = false;
            }
        }

        public string MaskedValue = "*********";

        public bool IsMasked { get { return (bool)(ViewState["IsMasked"]?? true); } set { ViewState["IsMasked"] = value; } }

        public MaskedControlType ControlType
        {
            get { return (MaskedControlType)ViewState["ControlType"]; }
            set { ViewState["ControlType"] = value; }
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