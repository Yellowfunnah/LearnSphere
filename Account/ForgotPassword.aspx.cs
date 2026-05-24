using System; using System.Configuration; using System.Data.SqlClient;
namespace LearnSphere.Account{ public partial class ForgotPassword:System.Web.UI.Page{
string conn=ConfigurationManager.ConnectionStrings["WAPPConnectionString"].ConnectionString;
protected void btnReset_Click(object sender,EventArgs e){
using(SqlConnection c=new SqlConnection(conn)){c.Open();
SqlCommand cmd=new SqlCommand("UPDATE Users SET Password=@p WHERE Email=@e",c);
cmd.Parameters.AddWithValue("@p",txtPassword.Text);
cmd.Parameters.AddWithValue("@e",txtEmail.Text);
int r=cmd.ExecuteNonQuery();
lblMessage.Text=r>0?"Password Updated":"Email Not Found";
}}}}