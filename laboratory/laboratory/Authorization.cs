using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace laboratory
{
    public partial class Authorization : Form
    {
        public Authorization()
        {
            InitializeComponent();
        }
        static string Connstring = @"Data Source=MEPHI3-MSSQL;Initial Catalog=Bes_laboratory;Integrated Security=True";
        SqlConnection sqlConect = new SqlConnection(Connstring);

        private void Authorization_Load(object sender, EventArgs e)
        {
            


        }

        private void button1_Click(object sender, EventArgs e)
        {
            sqlConect.Open();
            SqlCommand logrequst = new SqlCommand();
            logrequst.CommandType = CommandType.Text;
            logrequst.CommandText = "Aut";
            logrequst.Parameters.AddWithValue("@Login",Login.Text);
            logrequst.Parameters.AddWithValue("@Password",Password.Text);
            logrequst.Connection = sqlConect;
            SqlDataReader sqlReader = logrequst.ExecuteReader();
            sqlReader.Read();
            if (sqlReader.HasRows)
            {
                MessageBox.Show("Успешно");
                int role = sqlReader.GetInt32(7);
                int us = sqlReader.GetInt32(0);
                switch (role)
                {
                    case 1:
                        MessageBox.Show("Вы вошли как лаборант");
                        break;

                    case 2:
                        MessageBox.Show("Вы вошли как лаборант - иследователь ");
                        break;
                    case 3:
                        MessageBox.Show("Вы вошли как администратор");
                        break;

                    case 4:
                        MessageBox.Show("Вы вошли как бугалтер");
                        break;
                        


                }
            }
            else
            {
                MessageBox.Show("Пароль не верный");
            }

        }
    }
}
