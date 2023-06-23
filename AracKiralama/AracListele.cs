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
    public partial class AracListele : Form
    {
        public AracListele()
        {
            InitializeComponent();
        }
        private string baglantiCumlesi = @"Data Source=localhost;Initial Catalog=OtoKiralama;Integrated Security=True";
        private void button3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        public void Arac_Listele()
        {
            SqlConnection baglanti = new SqlConnection(baglantiCumlesi);
            baglanti.Open();

            String komutCumlesi = "Select * From Araclar";
            SqlCommand komut = new SqlCommand(komutCumlesi, baglanti);
            SqlDataAdapter da = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            baglanti.Close();
        }
        public void Arac_Guncelle()
        {
            SqlConnection baglanti = new SqlConnection(baglantiCumlesi);
            baglanti.Open();

            string komutCumlesi = "Update Araclar set Marka=@Marka,Seri=@Seri,Model=@Model,Renk=@Renk,Km=@Km,Yakit=@Yakit,Ücret=@Ücret,Durumu=@Durumu where Plaka=@plaka";
            SqlCommand komut = new SqlCommand(komutCumlesi, baglanti);
            komut.Parameters.AddWithValue("@plaka", txtPlaka.Text).ToString();
            komut.Parameters.AddWithValue("@Marka", cbxMarka.Text);
            komut.Parameters.AddWithValue("@Seri", cbxSeri.Text);
            komut.Parameters.AddWithValue("@Model", txtModel.Text).ToString();
            komut.Parameters.AddWithValue("@Renk", txtRenk.Text);
            komut.Parameters.AddWithValue("@Km", int.Parse(txtKm.Text));
            komut.Parameters.AddWithValue("@Yakit", cbxYakit.Text);
            komut.Parameters.AddWithValue("@Ücret", float.Parse(txtÜcret.Text)).ToString();
            komut.Parameters.AddWithValue("@Durumu ",cbxAracDurum.Text);
            komut.ExecuteNonQuery();
            baglanti.Close();
            Arac_Listele();
            MessageBox.Show("Tebrikler, seçilen alan güncellenmiştir!");
        }
        private void AracListele_Load(object sender, EventArgs e)
        {
            Arac_Listele();
        }

        private void btnGüncelle_Click(object sender, EventArgs e)
        {
            Arac_Guncelle();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           txtPlaka.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            cbxMarka.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            cbxSeri.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            txtModel.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            txtRenk.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            txtKm.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            cbxYakit.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();
            txtÜcret.Text = dataGridView1.CurrentRow.Cells[7].Value.ToString();
            cbxAracDurum.Text = dataGridView1.CurrentRow.Cells[8].Value.ToString();


        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = new SqlConnection(baglantiCumlesi);
            baglanti.Open();

            string komutCumlesi = "Delete from Araclar where Plaka='" + dataGridView1.CurrentRow.Cells["Plaka"].Value.ToString() + "'";
            SqlCommand komut = new SqlCommand(komutCumlesi, baglanti);

            komut.ExecuteNonQuery();
            baglanti.Close();
            Arac_Listele();
        }
    }
}
