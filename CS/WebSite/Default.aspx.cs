using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

public partial class Editors_Lookup_Lookup : System.Web.UI.Page {
    // (Value; Text)
    private static readonly Dictionary<string, string> data = new Dictionary<string, string>();

    static Editors_Lookup_Lookup() {
        for(int i = 1; i <= 10; i++)
            data.Add("Value #" + i, "Text #" + i);
    }

    protected void Page_Load(object sender, EventArgs e) {
        
    }

    private string GetValueByText(string text) {
        if(text == null)
            return string.Empty;
        foreach(KeyValuePair<string, string> item in data) {
            if (item.Value == text)
                return item.Key;
        }
        return "[not found]";
    }
    protected void OnCallback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
        // DEMO
        System.Threading.Thread.Sleep(100);

        string text = e.Parameter;
        e.Result = GetValueByText(text);
    }
}

