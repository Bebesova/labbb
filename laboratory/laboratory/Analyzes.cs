using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace laboratory
{
    public partial class Analyzes : Form
    {
        public Analyzes()
        {
            InitializeComponent();
        }
        static string Connstring = @"Data Source=MEPHI3-MSSQL;Initial Catalog=Bes_laboratory;Integrated Security=True";
        SqlConnection sqlConnect = new SqlConnection(Connstring);

        private void Analyzes_Load(object sender, EventArgs e)
        {
            sqlConnect.Open();
            SqlCommand Service = new SqlCommand();
            Service.CommandText = $"SELECT * FROM Service";
            Service.Connection = sqlConnect;
            SqlDataAdapter adapter = new SqlDataAdapter(Service);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            dGVService.DataSource = dataSet.Tables[0];
            dGVService.Columns[0].Visible = false;
            sqlConnect.Close();

            sqlConnect.Open();
            SqlCommand Order = new SqlCommand();
            Order.CommandText = $"Select* from AllOrder ";
            Order.Connection = sqlConnect;
            SqlDataAdapter bebe = new SqlDataAdapter(Order);
            DataSet dset = new DataSet();
            bebe.Fill(dset);
            dGVorder.DataSource = dset.Tables[0];
            dGVorder.Columns[0].Visible = false;

        }

        private void dGVService_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
