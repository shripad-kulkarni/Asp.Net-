using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Xml.Linq;

namespace Test_Application
{
    public class Dataaccess
    {
        string connString = ConfigurationManager.ConnectionStrings["webapp"].ConnectionString;
        public DataTable GetData()
        {

            string query = @"select * from user_info";

            MySqlConnection con = new MySqlConnection(connString);
            MySqlCommand cmd = new MySqlCommand(query, con);
            DataTable dt = new DataTable();
            try
            {
                con.Open();
                using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();

            }
            return dt;
        }

        public Boolean InsertData(String name, String address, string contactno, string age, string gender, string subject) {

            MySqlConnection con = new MySqlConnection(connString);
            try
            {
                string query = @"INSERT INTO user_info(Name, Address, ContactNo, Age, Gender, Subject)values(@Name, @Address, @ContactNo, @Age, @GenderRadioButtonList, @SubjectDropDownList)";

                MySqlCommand cmd = new MySqlCommand(query, con);
                 
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@ContactNo", contactno);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@GenderRadioButtonList", gender);
                cmd.Parameters.AddWithValue("@SubjectDropDownList", subject);

                using (con)
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                    

            }
            finally
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
            }
            return true;
        }


        public void DeleteRow1(int i)
        {
            MySqlConnection con = new MySqlConnection(connString);

           
            try
            {
                string deleteQuery = "DELETE FROM user_info WHERE ID = @ID";
                MySqlCommand cmd = new MySqlCommand(deleteQuery, con);

                cmd.Parameters.AddWithValue("@ID", i);
                   
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                         
             }
            catch (SqlException ex)
            {
                       
                 Console.WriteLine("Error: " + ex.Message);
            }
                
            
        }


        public void UpdatedRow(string id,string name,string address,string contactno, string age, string gender , string subject)
        {
            MySqlConnection con = new MySqlConnection(connString);


            try
            {
                string updateQuery = "Update user_info set Name=@name, Address=@address, " +
                    "ContactNo=@contactno, Age=@age, Gender=@gender, Subject=@subject  WHERE ID = @id";
                MySqlCommand cmd = new MySqlCommand(updateQuery, con);

                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@ContactNo", contactno);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Subject", subject);
                   

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {

                Console.WriteLine("Error: " + ex.Message);
            }


        }


    }
}
