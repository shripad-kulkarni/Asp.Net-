using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using MySql.Data.MySqlClient;
using System.Xml.Linq;
using System.Drawing;
using System.Security.Cryptography.X509Certificates;

namespace Test_Application
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Dataaccess db = new Dataaccess();
        string connString = ConfigurationManager.ConnectionStrings["webapp"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DataTable dt=  db.GetData();
                GridViewUserInfo.DataSource = dt;
                GridViewUserInfo.DataBind();
            }
        }

     
        protected void Button_Click(object sender, EventArgs e)
        {
            string name = Name.Text;
            string address = Address.Text;
            string contactno = ContactNo.Text;
            string age = Age.Text;  
            string gender = GenderRadioButtonList.SelectedValue;
            string subject = SubjectDropDownList.SelectedValue;
                
            db.InsertData(name, address, contactno, age, gender, subject);

            DataTable dt = db.GetData();
            GridViewUserInfo.DataSource = dt;
            GridViewUserInfo.DataBind();

        }

        protected void GridViewUserInfo_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblAge = e.Row.FindControl("lblAge") as Label;

                if (!string.IsNullOrEmpty(lblAge.Text))
                {
                    if (Convert.ToInt32(lblAge.Text) < 18)
                    {

                        e.Row.BackColor = Color.Cyan;

                    }
                }
            }
        }

        protected void GridViewUserInfo_DeleteRow(object sender, GridViewCommandEventArgs e)
        {
             if(e.CommandName == "DeleteRow")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                Label lblID = row.FindControl("lblID") as Label;
                
                if (!string.IsNullOrEmpty(lblID.Text))
                {
                    int i = Convert.ToInt32(lblID.Text);

                    db.DeleteRow1(i);
                }
                DataTable dt = db.GetData();
                GridViewUserInfo.DataSource = dt;
                GridViewUserInfo.DataBind();
            }
            if (e.CommandName == "UpdateRow")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);

                Label lblid = row.FindControl("lblid") as Label;
                  ID.Text =  lblid.Text;

                Label lblName = row.FindControl("lblName") as Label;
                  Name.Text= lblName.Text;

                Label lblAddress = row.FindControl("lblAddress") as Label;
                  Address.Text = lblAddress.Text;

                Label lblContactNo = row.FindControl("lblContactNo") as Label;
               ContactNo.Text = lblContactNo.Text;

                Label lblAge = row.FindControl("lblAge") as Label;
                Age.Text = lblAge.Text;

                Label lblGender = row.FindControl("lblGender") as Label;
                GenderRadioButtonList.ClearSelection();
                 GenderRadioButtonList.Items.FindByValue(lblGender.Text).Selected = true;
                
                Label lblSubject = row.FindControl("lblSubject") as Label;
                SubjectDropDownList.ClearSelection();
                 SubjectDropDownList.Items.FindByValue(lblSubject.Text).Selected = true;

                

                ButtonSave.Visible = false;
                ButtonUpdate.Visible = true;


                
                
            }
        }


        protected void ButtonUpdateClick(object sender, EventArgs e)
        {
            string id = ID.Text;
            string name = Name.Text;
            string address = Address.Text;
            string contactno = ContactNo.Text;
            string age = Age.Text;
            string gender = GenderRadioButtonList.SelectedValue;
            string subject = SubjectDropDownList.SelectedValue;
            


            db.UpdatedRow(id, name, address, contactno, age, gender, subject);

            ID.Text = string.Empty;
            Name.Text = string.Empty;
            Address.Text = string.Empty;
            ContactNo.Text = string.Empty;
            Age.Text = string.Empty;
            GenderRadioButtonList.ClearSelection();
            SubjectDropDownList.ClearSelection();

            ButtonSave.Visible = true;
            ButtonUpdate.Visible = false;

            DataTable dt = db.GetData();
            GridViewUserInfo.DataSource = dt;
            GridViewUserInfo.DataBind();
        }

        protected void NextPage(object sender, EventArgs e)
        {
            Response.Redirect("WebForm2.aspx");
        }



    }
}