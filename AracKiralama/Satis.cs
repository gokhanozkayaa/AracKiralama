using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace AracKiralama
{
    public partial class Satis : Form
    {
        public Satis()
        {
            InitializeComponent();
        }

        private string baglantiCumlesi = @"Data Source=localhost;Initial Catalog=OtoKiralama;Integrated Security=True";

        public void Sozlesme_Listele()
        {
            SqlConnection baglanti = new SqlConnection(baglantiCumlesi);
            baglanti.Open();

            String komutCumlesi = "Select * From Sozlesme";
            SqlCommand komut = new SqlCommand(komutCumlesi, baglanti);
            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            baglanti.Close();
        }
        private void Satis_Load(object sender, EventArgs e)
        {
            Sozlesme_Listele();
            double sum = 0;
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row.Cells[13].Value != null && row.Cells[13].Value.ToString() != "")
                {
                    sum += Convert.ToDouble(row.Cells[13].Value);
                }
            }
            label2.Text = sum.ToString();


            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                if (row.Cells[5].Value != null && row.Cells[5].Value.ToString() != "")
                {

                    listBox1.Items.Add(row.Cells[5].Value.ToString());

                }
            }


        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
