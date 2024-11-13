using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test_Application
{
    public partial class Registration2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //[WebMethod]
        //public static string InsertData(string name)
        //{
        //    try
        //    {
        //        Dataaccess db = new Dataaccess();
        //        //JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        //        // var inputData = jsSerializer.Deserialize<dynamic>(data.ToString());

        //        //string name = Convert.ToString(inputData["name"]);
        //        //string address = Convert.ToString(inputData["address"]);
        //        //string contactno = Convert.ToString(inputData["contactno"]);
        //        //string age = Convert.ToString(inputData["age"]);
        //        //string gender = Convert.ToString(inputData["gender"]);
        //        //string subject = Convert.ToString(inputData["subject"]);

        //        //db.InsertData(name, address, contactno, age, gender, subject);

        //        return "Data inserted successfully";
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle exceptions
        //        return "Error: " + ex.Message;
        //    }
        //}

        public class UserData
        {
            public string Name { get; set; }
            public string Address { get; set; }
            public string ContactNo { get; set; }
            public string Age { get; set; }
            public string Gender { get; set; }
            public string Subject { get; set; }
        }

        [WebMethod]
        public static string InsertData(string Name,string Address, string Contact, string Age)
        {
            string connString = ConfigurationManager.ConnectionStrings["webapp"].ConnectionString; // Update with your connection string

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connString))
                {
                    conn.Open();

                    
                        string query = "INSERT INTO registration (Name, Address, Contact, Age, Gender, Subject) VALUES (@Name, @Address, @Contact, @Age, @Gender, @Subject)";
                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@Name", Name);
                            cmd.Parameters.AddWithValue("@Address", Address);
                            cmd.Parameters.AddWithValue("@Contact", Contact);
                            cmd.Parameters.AddWithValue("@Age", Age);
                            cmd.Parameters.AddWithValue("@Gender", "");
                            cmd.Parameters.AddWithValue("@Subject", "");
                            cmd.ExecuteNonQuery();
                        }
                    
                }

                return "Data inserted successfully";
            }
            catch (Exception ex)
            {
                // Log or handle the exception as needed
                return "Error inserting data: " + ex.Message;
            }
        }

        [WebMethod]
        public static List<UserData> GetData()
        {
            string connString = ConfigurationManager.ConnectionStrings["webapp"].ConnectionString;
            List<UserData> userDataList = new List<UserData>();

            using (MySqlConnection conn = new MySqlConnection(connString))
            {
                string query = "SELECT Name, Address, Contact, Age, Gender, Subject FROM registration";
                MySqlCommand cmd = new MySqlCommand(query, conn);

                conn.Open();
                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    UserData userData = new UserData
                    {
                        Name = reader["Name"].ToString(),
                        Address = reader["Address"].ToString(),
                        ContactNo = reader["Contact"].ToString(),
                        Age = reader["Age"].ToString(),
                        Gender = reader["Gender"].ToString(),
                        Subject = reader["Subject"].ToString()
                    };
                    userDataList.Add(userData);
                }
            }
            return userDataList;
        }

         
    }
}