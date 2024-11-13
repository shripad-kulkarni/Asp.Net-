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

            string query = @"select * from registration";

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
        public DataTable GetUserAuthentication(string username, string password)
        {

            string query = @"select * from user_master where username = '" + username + "' and  password = '" + password + "' ";

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

        public Boolean InsertData(String name, String address, string Contact, string age, string Gender, string Subject) {

            MySqlConnection con = new MySqlConnection(connString);
            try
            {
                string query = @"INSERT INTO registration(Name, Address, Contact, Age, Gender, Subject)values(@Name, @Address, @Contact, @Age, @Gender, @Subject)";

                MySqlCommand cmd = new MySqlCommand(query, con);
                 
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Contact", Contact);
                cmd.Parameters.AddWithValue("@Age", age);
                cmd.Parameters.AddWithValue("@Gender", Gender);
                cmd.Parameters.AddWithValue("@Subject", Subject);

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


        public void DeleteRow1(int Registration_ID)
        {
            MySqlConnection con = new MySqlConnection(connString);

           
            try
            {
                string deleteQuery = "DELETE FROM registration WHERE Registration_ID = @Registration_ID";
                MySqlCommand cmd = new MySqlCommand(deleteQuery, con);

                cmd.Parameters.AddWithValue("@Registration_ID", Registration_ID);
                   
                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                         
             }
            catch (SqlException ex)
            {
                       
                 Console.WriteLine("Error: " + ex.Message);
            }
                
            
        }


        public void UpdatedRow(string Registration_ID, string name,string address,string contactno, string age, string gender , string subject)
        {
            MySqlConnection con = new MySqlConnection(connString);


            try
            {
                string updateQuery = "Update registration set Name=@name, Address=@address, " +
                    "Contact=@Contact, Age=@Age, Gender=@gender, Subject=@subject  WHERE Registration_ID = @Registration_ID";
                MySqlCommand cmd = new MySqlCommand(updateQuery, con);

                cmd.Parameters.AddWithValue("@Registration_ID", Registration_ID);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Contact", contactno);
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
