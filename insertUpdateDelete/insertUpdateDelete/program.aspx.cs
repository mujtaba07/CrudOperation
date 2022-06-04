using System;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using NLog;
namespace insertUpdateDelete
{
    

    public partial class WebForm1 : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        Logger logger = LogManager.GetCurrentClassLogger();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter("select * from ContactTable", con);
                    DataTable dtbl = new DataTable();
                    adapter.Fill(dtbl);
                    GridView1.DataSource = dtbl;
                    GridView1.DataBind();
                    GridView1.Visible = false;
                   
                }
            }
            catch(Exception ex )
            {
                logger.Error(DateTime.Now+"error", ex.Message);
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand(@"INSERT INTO[dbo].[ContactTable]
           ([ID]
           ,[Name]
           ,[Phone]
           ,[Address]
            ,[Email ID])
     VALUES
           ('" + txtID.Text + "','" + txtName.Text + "','" + txtPhone.Text + "','" + txtAddress.Text + "','" + txtEmail.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("Inserted Successfully");
               
               
                txtID.Focus();
                con.Close();

            }
            catch(Exception ex)
            {
                logger.Error(DateTime.Now + "error", ex.Message);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(CS);

                SqlCommand cmd = new SqlCommand(@"DELETE FROM[dbo].[ContactTable]
                WHERE [ID] = '" + txtID.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("Deleted Successfully");

                 txtID.Focus();
                con.Close();
            }
            catch (Exception ex)
            {
                logger.Error(DateTime.Now + "error", ex.Message);
            }


        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(CS);

                SqlCommand cmd = new SqlCommand(@"UPDATE[dbo].[ContactTable]
          SET[ID] ='" + txtID.Text + "',[Name] ='" + txtName.Text + "',[Phone] ='" + txtPhone.Text + "',[Address] = '" + txtAddress.Text + "',[Email ID] = '" +txtEmail.Text+ "'  WHERE [ID]='" + txtID.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("Updated Successfully");

                
                con.Close();
                
            }
            catch(Exception ex)
            {
               logger.Error(DateTime.Now + "error", ex.Message);
            }

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(@"SELECT[ID]
                      ,[Name]
                      ,[Phone]
                      ,[Address]
                      ,[Email ID]
                  FROM[dbo].[ContactTable] where ID = '"+txtID.Text+"'", con);
                    DataTable dtbl = new DataTable();
                    adapter.Fill(dtbl);
                    GridView1.DataSource = dtbl;
                    GridView1.DataBind();
                    GridView1.Visible = true;
                   
                    txtID.Focus();

                }
            }
            catch(Exception ex)
            {
                logger.Error(DateTime.Now + "error", ex.Message);
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}