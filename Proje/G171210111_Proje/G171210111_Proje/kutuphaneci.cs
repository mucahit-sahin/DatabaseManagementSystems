using Npgsql;
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

namespace G171210111_Proje
{
    public partial class kutuphaneci : Form
    {
        public kutuphaneci()
        {
            InitializeComponent();
        }

        NpgsqlConnection baglanti = new NpgsqlConnection("Server=localhost;User ID=postgres;password=1591;Database=G171210111_Proje");
        string sql;

        private void BTlistele_Click_1(object sender, EventArgs e)
        {
            sql = "SELECT kt.kitapAd, yz.yazarad,ye.yayineviad,ka.kategoriad FROM kitap AS kt INNER JOIN yazar AS yz ON kt.yazarid=yz.yazarid INNER JOIN yayinevi AS ye ON kt.yayineviid=ye.yayineviid INNER JOIN kategori AS ka ON kt.kategoriid=ka.kategoriid";
            //sql = "Select public.kitaptumlistele();";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();
        }

        private void kutuphaneci_Load(object sender, EventArgs e)
        {
            baglanti.Close();
            sql = "Select * from yazar";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
                NpgsqlDataReader da;
                baglanti.Open();
                da = cmd.ExecuteReader();
                while (da.Read())
                {
                    comboBox1.Items.Add(da["yazarAd"]);
                }
            baglanti.Close();
            baglanti.Open();
            sql = "Select * from yayinevi";
             cmd = new NpgsqlCommand(sql, baglanti);
             da = cmd.ExecuteReader();
            while (da.Read())
            {
                comboBox2.Items.Add(da["yayineviAd"]);
            }

            baglanti.Close();
            baglanti.Open();
            sql = "Select * from kategori";
            cmd = new NpgsqlCommand(sql, baglanti);
            da = cmd.ExecuteReader();
            while (da.Read())
            {
                comboBox3.Items.Add(da["kategoriad"]);
            }

            baglanti.Close();

        }

        private void BTkitapEkle_Click(object sender, EventArgs e)
        {
            if (TBkitapid.Text.Trim() == "" ||TBkitapad.Text.Trim()==""|| comboBox1.Text.Trim() == "" || comboBox2.Text.Trim() == "" || comboBox3.Text.Trim() == "")
                MessageBox.Show("Lütfen alanları bos bırakmayın.");
            else
            {
                baglanti.Open();
                string selectYazar, selectKategori, selectYayinevi, kitapad;
                int selectYazarId = 0, selectKategoriId = 0, selectYayineviId = 0, kitapid;
                kitapid = int.Parse(TBkitapid.Text);
                kitapad = TBkitapad.Text;
                selectYazar = comboBox1.SelectedItem.ToString();
                selectYayinevi = comboBox2.SelectedItem.ToString();
                selectKategori = comboBox3.SelectedItem.ToString();

                sql = "Select yazarId From yazar Where yazarAd=@selectYazar";
                NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
                cmd.Parameters.AddWithValue("@selectYazar", selectYazar);
                NpgsqlDataReader da = cmd.ExecuteReader();
                while (da.Read())
                {
                    selectYazarId = int.Parse(da["yazarId"].ToString());
                }
                baglanti.Close();

                baglanti.Open();
                sql = "Select yayineviid From yayinevi Where yayineviad=@selectYayinevi";
                cmd = new NpgsqlCommand(sql, baglanti);
                cmd.Parameters.AddWithValue("@selectYayinevi", selectYayinevi);
                da = cmd.ExecuteReader();
                while (da.Read())
                {
                    selectYayineviId = int.Parse(da["yayineviid"].ToString());
                }
                baglanti.Close();

                baglanti.Open();
                sql = "Select kategoriid From kategori Where kategoriad=@selectKategori";
                cmd = new NpgsqlCommand(sql, baglanti);
                cmd.Parameters.AddWithValue("@selectKategori", selectKategori);
                da = cmd.ExecuteReader();
                while (da.Read())
                {
                    selectKategoriId = int.Parse(da["kategoriid"].ToString());
                }
                baglanti.Close();

                baglanti.Open();
                sql = "insert into kitap(kitapid,kitapad,kategoriid,yayineviid,yazarid,mevcutmu) values(@kitapid, @kitapad,@kategoriid,@yayineviid,@yazarid,true)";
                cmd = new NpgsqlCommand(sql, baglanti);
                cmd.Parameters.AddWithValue("@yazarId", selectYazarId);
                cmd.Parameters.AddWithValue("@kitapid", kitapid);
                cmd.Parameters.AddWithValue("@kitapad", kitapad);
                cmd.Parameters.AddWithValue("@kategoriid", selectKategoriId);
                cmd.Parameters.AddWithValue("@yayineviid", selectYayineviId);
                cmd.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Kitap başarıyla eklendi.");
                TBkitapid.Clear();TBkitapad.Clear();
            }
        }

        private void BTyazarKaydet_Click(object sender, EventArgs e)
        {
            if (TByazarAd.Text.Trim() == "" || TByazarId.Text.Trim()=="")
                MessageBox.Show("Lütfen alanları bos bırakmayın.");
            else
            {
                baglanti.Open();
                string yazarAd;
                int yazarId;
                yazarAd = TByazarAd.Text;
                yazarId = int.Parse(TByazarId.Text);
                sql = "insert into yazar(yazarId,yazarAd) values(@yazarId, @yazarAd)";
                NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
                cmd.Parameters.AddWithValue("@yazarId", yazarId);
                cmd.Parameters.AddWithValue("@yazarAd", yazarAd);
                cmd.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Kayıt başarıyla eklendi.");
                TByazarId.Clear();TByazarAd.Clear();
            }
        }

        private void BTyayineviKaydet_Click(object sender, EventArgs e)
        {
            if (TByayineviId.Text.Trim() == "" || TByayineviAd.Text.Trim() == "")
                MessageBox.Show("Lütfen alanları bos bırakmayın.");
            else
            {
                baglanti.Open();
                string yayineviAd, lokasyon;
                int yayineviId;
                yayineviAd = TByayineviAd.Text;
                lokasyon = TBlokasyon.Text;
                yayineviId = int.Parse(TByayineviId.Text);
                sql = "insert into yayinevi(yayineviId,yayineviAd,adres) values(@yayineviId, @yayineviAd,@adres)";
                NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
                cmd.Parameters.AddWithValue("@yayineviId", yayineviId);
                cmd.Parameters.AddWithValue("@yayineviAd", yayineviAd);
                cmd.Parameters.AddWithValue("@adres", lokasyon);
                cmd.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Kayıt başarıyla eklendi.");
                TByayineviAd.Clear();TByayineviId.Clear();
            }
        }

        private void BTkategoriKaydet_Click(object sender, EventArgs e)
        {
            if (TBkategoriAd.Text.Trim() == "" || TBkategoriId.Text.Trim() == "")
                MessageBox.Show("Lütfen alanları bos bırakmayın.");
            else
            {
                baglanti.Open();
                string kategoriAd;
                int kategoriId;
                kategoriAd = TBkategoriAd.Text;
                kategoriId = int.Parse(TBkategoriId.Text);
                sql = "insert into kategori(kategoriId,kategoriAd) values(@kategoriId, @kategoriAd)";
                NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
                cmd.Parameters.AddWithValue("@kategoriId", kategoriId);
                cmd.Parameters.AddWithValue("@kategoriAd", kategoriAd);
                cmd.ExecuteNonQuery();
                baglanti.Close();
                MessageBox.Show("Kayıt başarıyla eklendi.");
                TBkategoriId.Clear();TBkategoriAd.Clear();
            }
        }

        private void BTcikisYap_Click(object sender, EventArgs e)
        {
            anasayfa ana = new anasayfa();
            ana.Show();
            this.Hide();
        }

        private void BTlisteleyazar_Click(object sender, EventArgs e)
        {
            sql ="Select * From yazar";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView2.DataSource = ds.Tables[0];
            baglanti.Close();


            sql = "SELECT * FROM toplamyazar();";
            baglanti.Open();
            cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                LByazartop.Text = "Toplam mevcut yazar : " + dr["toplamyazar"].ToString();
            }
            baglanti.Close();
        }

        private void BTlisteleyayinevi_Click(object sender, EventArgs e)
        {
            sql = "Select * From yayinevi";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView3.DataSource = ds.Tables[0];
            baglanti.Close();

            sql = "SELECT * FROM toplamyayinevi();";
            baglanti.Open();
            cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                LByayinevitop.Text = "Toplam mevcut yayinevi : " + dr["toplamyayinevi"].ToString();
            }
            baglanti.Close();
        }

        private void BTlistelekategori_Click(object sender, EventArgs e)
        {
            sql = "Select * From kategori";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView4.DataSource = ds.Tables[0];
            baglanti.Close();

            sql = "SELECT * FROM toplamkategori();";
            baglanti.Open();
            cmd = new NpgsqlCommand(sql, baglanti);
            NpgsqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                LBkategoritop.Text = "Toplam mevcut kategori : " + dr["toplamkategori"].ToString();
            }
            baglanti.Close();
        }
    }
}
