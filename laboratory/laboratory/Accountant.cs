using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using Microsoft.SqlServer.Server;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace laboratory
{
    public partial class Accountant : Form
    {
        public Accountant()
        {
            InitializeComponent();
        }
        static string Connstring = @"Data Source=MEPHI3-MSSQL;Initial Catalog=Bes_laboratory;Integrated Security=True";
        SqlConnection sqlConnect = new SqlConnection(Connstring);
        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void Accountant_Load(object sender, EventArgs e)
        {
            sqlConnect.Open();
            SqlCommand Service = new SqlCommand();
            Service.CommandText = $"SELECT * FROM Service";
            Service.Connection = sqlConnect;
            SqlDataAdapter adapter = new SqlDataAdapter(Service);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            DGVreport.DataSource = dataSet.Tables[0];
            DGVreport.Columns[0].Visible = false;
            sqlConnect.Close();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if ( CBexcel.Checked == true)
            {


            }
            if (CBpdf.Checked == true)
            {


            }
        }
    }
}
