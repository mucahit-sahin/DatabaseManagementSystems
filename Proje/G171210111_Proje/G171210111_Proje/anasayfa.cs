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
using Npgsql;
namespace G171210111_Proje
{
    public partial class anasayfa : Form
    {
        public anasayfa()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("Server=localhost;User ID=postgres;password=1591;Database=G171210111_Proje");
        string sql;
        int kullaniciAdi;
            string sifre;
        private void BTgirisOgr_Click(object sender, EventArgs e)
        {
            kullaniciAdi =int.Parse( TBkullanici.Text);
            sifre = TBsifre.Text;
            sql = "SELECT * FROM public.kullanici WHERE kullaniciid = @kullaniciNo and sifre = @sifre";
            NpgsqlCommand sorgu = new NpgsqlCommand(sql,baglanti);

            sorgu.Parameters.AddWithValue("@kullaniciNo", kullaniciAdi);
            sorgu.Parameters.AddWithValue("@sifre", sifre);

            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                MessageBox.Show("OGR Giriş yapıldı");
                ogrenci ogr = new ogrenci(kullaniciAdi);
                ogr.Show();
                this.Hide();
            }
            else
                MessageBox.Show("Kullanici Bulunamadi.");
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            baglanti.Open();
        }

        private void BTgirisAdm_Click(object sender, EventArgs e)
        {
            kullaniciAdi =int.Parse(TBkullanici2.Text);
            sifre = TBsifre2.Text;
            sql = "SELECT * FROM public.kutuphaneci WHERE kullaniciid = @kullaniciNo";
            NpgsqlCommand sorgu = new NpgsqlCommand(sql, baglanti);

            sorgu.Parameters.AddWithValue("@kullaniciNo", kullaniciAdi);

            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                    sql = "SELECT * FROM public.kullanici WHERE kullaniciid = @kullaniciNo and sifre = @sifre";
                    sorgu = new NpgsqlCommand(sql, baglanti);

                    sorgu.Parameters.AddWithValue("@kullaniciNo", kullaniciAdi);
                    sorgu.Parameters.AddWithValue("@sifre", sifre);
                    da = new NpgsqlDataAdapter(sorgu);
                    dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        MessageBox.Show("kutuphanicisin alfa");
                        kutuphaneci ktp = new kutuphaneci();
                        ktp.Show();
                        this.Hide();
                    }
                    else
                        MessageBox.Show("Kullanici Bulunamadi. kutuphanede varsın amma");
            }
            else
                MessageBox.Show("Kullanici Bulunamadi.");
        }
    }
}
