using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Homework1
{
    public partial class _Default : Page
    {
        Random rnd = new Random();
        DateTime now = DateTime.Now;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMovies();
                LoadOrders();
            }
        }

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-HB9K6SB\\NAZARCZUKN;Initial Catalog=Homework1;Persist Security Info=True;User ID=sa;Password=Kimseokjin613");

        protected void insert_button_Click(object sender, EventArgs e)
        {
            con.Open();

            int year = 0;
            var q1 = "select year(release_date) from MOVIES where movie_id = @movie_id;";
            SqlCommand c1 = new SqlCommand(q1, con);
            c1.Parameters.Add("@movie_id", SqlDbType.Int).Value = Convert.ToInt32(TextMovieID.Text);
            SqlDataReader reader1 = c1.ExecuteReader();
            if (reader1.HasRows)
            {
                while (reader1.Read())
                    year = reader1.GetInt32(0);
            }
            reader1.Close();
            double discount = (2021 - year) > 5 ? 0.2 : 0;


            double net_amount = 0;
            var q = "select price from MOVIES where movie_id = @movie_id;";
            SqlCommand c = new SqlCommand(q, con);
            c.Parameters.Add("@movie_id", SqlDbType.Int).Value = Convert.ToInt32(TextMovieID.Text);
            SqlDataReader reader = c.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                    net_amount = Decimal.ToDouble(reader.GetDecimal(0));
            }
            reader.Close();

            var query = "Insert into ORDERS values(@ORDER_ID,@ORDER_DATE,@MOVIE_ID,@NET_AMOUNT,@DISCOUNT,@GROSS_AMOUNT)";
            SqlCommand command = new SqlCommand(query, con);
            command.Parameters.Add("@ORDER_ID", SqlDbType.Int).Value = rnd.Next(1000, 1200);
            command.Parameters.Add("@ORDER_DATE", SqlDbType.Date).Value = now.ToString("yyyy-MM-dd");
            command.Parameters.Add("@MOVIE_ID", SqlDbType.Int).Value = int.Parse(TextMovieID.Text);
            command.Parameters.Add("@NET_AMOUNT", SqlDbType.Money).Value = net_amount;
            command.Parameters.Add("@DISCOUNT", SqlDbType.Decimal).Value = (discount == 0) ? 0 : 1;
            command.Parameters.Add("@GROSS_AMOUNT", SqlDbType.Money).Value = 1.23 * net_amount * (1 - discount);
            command.ExecuteNonQuery();
            con.Close();
            LoadOrders();
        }

        void LoadMovies()
        {
            SqlCommand command = new SqlCommand("select * from MOVIES", con);
            SqlDataAdapter d = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            d.Fill(dt);
            ViewMovies.DataSource = dt;
            ViewMovies.DataBind();
        }

        void LoadOrders()
        {
            SqlCommand command = new SqlCommand("select * from ORDERS order by order_date", con);
            SqlDataAdapter d = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            d.Fill(dt);
            ViewOrders.DataSource = dt;
            ViewOrders.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "select * from MOVIES where MOVIE_TITLE like '%'+@key+'%'";
            SqlCommand c = new SqlCommand(q,con);
            c.Parameters.Add("@key", SqlDbType.NVarChar).Value = TextBox1.Text;
            SqlDataAdapter d = new SqlDataAdapter(c);
            DataTable dt = new DataTable();
            d.Fill(dt);
            ViewMovies.DataSource = dt;
            ViewMovies.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "select * from MOVIES where GENRE like '%'+@gen+'%'";
            SqlCommand c = new SqlCommand(q, con);
            c.Parameters.AddWithValue("@gen", TextBox2.Text);
            SqlDataAdapter d = new SqlDataAdapter(c);
            DataTable dt = new DataTable();
            d.Fill(dt);
            ViewMovies.DataSource = dt;
            ViewMovies.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "select * from MOVIES where RELEASE_DATE>@od and RELEASE_DATE<@do";
            SqlCommand c = new SqlCommand(q, con);
            c.Parameters.Add("@od", SqlDbType.Date).Value = TextBox3.Text;
            c.Parameters.Add("@do", SqlDbType.Date).Value = TextBox4.Text;
            SqlDataAdapter d = new SqlDataAdapter(c);
            DataTable dt = new DataTable();
            d.Fill(dt);
            ViewMovies.DataSource = dt;
            ViewMovies.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            con.Open();
            string q = "select * from MOVIES where RANKING <@rank";
            SqlCommand c = new SqlCommand(q, con);
            c.Parameters.Add("@rank", SqlDbType.Int).Value = TextBox5.Text;
            SqlDataAdapter d = new SqlDataAdapter(c);
            DataTable dt = new DataTable();
            d.Fill(dt);
            ViewMovies.DataSource = dt;
            ViewMovies.DataBind();
        }

        public void UpdateItem(String ID, String NewDate, String NewMovie, String NewNet, String NewDiscount, String NewGross)
        {
            con.Open();
            SqlCommand command = new SqlCommand("update ORDERS set order_date=@date, movie_id=@movie, net_amount=@net, discount=@disc, gross_amount=@gross where order_id = @id", con);

            command.Parameters.Add("@id", SqlDbType.Int).Value = ID;
            command.Parameters.Add("@date", SqlDbType.Date).Value = NewDate;
            command.Parameters.Add("@movie", SqlDbType.Int).Value = NewMovie;
            command.Parameters.Add("@net", SqlDbType.Money).Value = NewNet;
            command.Parameters.Add("@disc", SqlDbType.Decimal).Value = NewDiscount;
            command.Parameters.Add("@gross", SqlDbType.Money).Value = NewGross;

            command.ExecuteNonQuery();
        }

        protected void ViewOrders_RowEditing(object sender, GridViewEditEventArgs e)
        {
            ViewOrders.EditIndex = e.NewEditIndex;
            LoadOrders();
        }

        protected void ViewOrders_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            ViewOrders.EditIndex = -1;
            LoadOrders();
        }

        protected void ViewOrders_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow r = ViewOrders.Rows[e.RowIndex];
            TextBox date = (r.FindControl("txtDate") as TextBox);
            TextBox movie = (r.FindControl("txtMovie") as TextBox);
            TextBox net = (r.FindControl("txtNet") as TextBox);
            TextBox disc = (r.FindControl("txtDisc") as TextBox);
            TextBox gross = (r.FindControl("txtGross") as TextBox);
            Label id = (r.FindControl("lblID") as Label);

            UpdateItem(id.Text, date.Text, movie.Text, net.Text, disc.Text, gross.Text);
            ViewOrders.EditIndex = -1;
            LoadOrders();
        }

        protected void ViewOrders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Open();
            GridViewRow r = ViewOrders.Rows[e.RowIndex];
            Label id = (r.FindControl("lblID") as Label);            
            SqlCommand command = new SqlCommand("delete from ORDERS where order_id = @id", con);
            command.Parameters.AddWithValue("@id", Convert.ToInt32(id.Text));
            command.ExecuteNonQuery();
            ViewOrders.EditIndex = -1;
            LoadOrders();
        }
    }
}