using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test_Application
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        Dataaccess db = new Dataaccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        [WebMethod]
        public static string InsertData(string name)
        {
            try
            {
                Dataaccess db = new Dataaccess();
                //JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
               // var inputData = jsSerializer.Deserialize<dynamic>(data.ToString());

                //string name = Convert.ToString(inputData["name"]);
                //string address = Convert.ToString(inputData["address"]);
                //string contactno = Convert.ToString(inputData["contactno"]);
                //string age = Convert.ToString(inputData["age"]);
                //string gender = Convert.ToString(inputData["gender"]);
                //string subject = Convert.ToString(inputData["subject"]);

                //db.InsertData(name, address, contactno, age, gender, subject);

                return "Data inserted successfully";
            }
            catch (Exception ex)
            {
                // Handle exceptions
                return "Error: " + ex.Message;
            }
        }
    }
}