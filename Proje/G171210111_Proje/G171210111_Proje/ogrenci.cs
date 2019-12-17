using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace G171210111_Proje
{
    public partial class ogrenci : Form
    {
        public int userid;
        public ogrenci(int kullaniciid)
        {
            InitializeComponent();
            userid = kullaniciid ;
        }

        NpgsqlConnection baglanti = new NpgsqlConnection("Server=localhost;User ID=postgres;password=1591;Database=G171210111_Proje");
        string sql;

        public void listele()
        {
            sql = "SELECT kt.kitapid, kt.kitapAd,kt.mevcutmu, yz.yazarad,ye.yayineviad,ka.kategoriad FROM kitap AS kt INNER JOIN yazar AS yz ON kt.yazarid=yz.yazarid INNER JOIN yayinevi AS ye ON kt.yayineviid=ye.yayineviid INNER JOIN kategori AS ka ON kt.kategoriid=ka.kategoriid";
            baglanti.Open();
            NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();


            sql = "SELECT * FROM toplamkitap();";
            baglanti.Open();
             cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                label2.Text = "Toplam kitap : " + dr["toplamkitap"].ToString();
            }
            baglanti.Close();
        }

        private void BToduncAl_Click(object sender, EventArgs e)
        {
            if (TBodunc.Text.Trim() == "")
                MessageBox.Show("Lütfen alanları boş bırakmayınız");
            else
            {
                int kitapid = int.Parse(TBodunc.Text);
                baglanti.Open();
                string sql2 = "Select * From kitap Where kitapid=@kitapid";
                NpgsqlCommand cmd = new NpgsqlCommand(sql2, baglanti);
                cmd.Parameters.AddWithValue("@kitapid", kitapid);
                NpgsqlDataReader da = cmd.ExecuteReader();
                int ekitapid = 0, ekategoriid, eyayineviid, eyazarid;
                string ekitapad;
                Boolean emevcutmu = false;
                while (da.Read())
                {
                    ekitapid = int.Parse(da["kitapid"].ToString());
                    ekitapad = da["kitapad"].ToString();
                    ekategoriid = int.Parse(da["kategoriid"].ToString());
                    eyayineviid = int.Parse(da["yayineviid"].ToString());
                    eyazarid = int.Parse(da["yazarid"].ToString());
                    emevcutmu = Boolean.Parse(da["mevcutmu"].ToString());
                }
                if (emevcutmu == false)
                {
                    MessageBox.Show("Bu kitap mevcut değil.");
                    baglanti.Close();
                }
                else
                {
                    baglanti.Close();
                    baglanti.Open();
                    sql = "insert into mevcutKitap(mevcutkitapid,kitapid,kullaniciid,odunczamani) values(@mevcutkitapid, @kitapid,@kullaniciid,@odunczamani)";
                    cmd = new NpgsqlCommand(sql, baglanti);
                    cmd.Parameters.AddWithValue("@mevcutkitapid", ekitapid);
                    cmd.Parameters.AddWithValue("@kitapid", ekitapid);
                    cmd.Parameters.AddWithValue("@kullaniciid", userid);
                    cmd.Parameters.AddWithValue("@odunczamani", DateTime.Now);
                    cmd.ExecuteNonQuery();
                    baglanti.Close();
                    MessageBox.Show("Kitap başarıyla ödünç alındı.");

                }
            }
            listele();
        }

        private void BTtumlistele_Click(object sender, EventArgs e)
        {
            listele();
        }

        private void BTcikisYap_Click(object sender, EventArgs e)
        {
            anasayfa ana = new anasayfa();
            ana.Show();
            this.Hide();
        }

        private void BTkitaplarim_Click(object sender, EventArgs e)
        {
            sql = "SELECT * FROM mevcutkitap WHERE kullaniciid=@userid";
            baglanti.Open();
            NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
            cmd.Parameters.AddWithValue("@userid", userid);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();

            //toplam mevcut kitap hesaplanıyor
            sql = "SELECT * FROM toplammevcutkitap();";
            baglanti.Open();
            cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                label2.Text = "Toplam mevcut kitabın : " + dr["toplammevcutkitap"].ToString();
            }
            baglanti.Close();
        }

        
    }
}
