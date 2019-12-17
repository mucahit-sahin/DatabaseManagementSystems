namespace G171210111_Proje
{
    partial class anasayfa
    {
        /// <summary>
        ///Gerekli tasarımcı değişkeni.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///Kullanılan tüm kaynakları temizleyin.
        /// </summary>
        ///<param name="disposing">yönetilen kaynaklar dispose edilmeliyse doğru; aksi halde yanlış.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer üretilen kod

        /// <summary>
        /// Tasarımcı desteği için gerekli metot - bu metodun 
        ///içeriğini kod düzenleyici ile değiştirmeyin.
        /// </summary>
        private void InitializeComponent()
        {
            this.TBkullanici = new System.Windows.Forms.TextBox();
            this.TBsifre = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.BTgirisOgr = new System.Windows.Forms.Button();
            this.TBkullanici2 = new System.Windows.Forms.TextBox();
            this.TBsifre2 = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.BTgirisAdm = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // TBkullanici
            // 
            this.TBkullanici.Location = new System.Drawing.Point(133, 199);
            this.TBkullanici.Name = "TBkullanici";
            this.TBkullanici.Size = new System.Drawing.Size(167, 22);
            this.TBkullanici.TabIndex = 0;
            // 
            // TBsifre
            // 
            this.TBsifre.Location = new System.Drawing.Point(133, 248);
            this.TBsifre.Name = "TBsifre";
            this.TBsifre.Size = new System.Drawing.Size(167, 22);
            this.TBsifre.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(49, 203);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(82, 17);
            this.label1.TabIndex = 2;
            this.label1.Text = "Kullanıcı No";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.White;
            this.label2.Location = new System.Drawing.Point(49, 253);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(37, 17);
            this.label2.TabIndex = 2;
            this.label2.Text = "Sifre";
            // 
            // BTgirisOgr
            // 
            this.BTgirisOgr.Location = new System.Drawing.Point(52, 293);
            this.BTgirisOgr.Name = "BTgirisOgr";
            this.BTgirisOgr.Size = new System.Drawing.Size(248, 51);
            this.BTgirisOgr.TabIndex = 3;
            this.BTgirisOgr.Text = "Giriş Yap";
            this.BTgirisOgr.UseVisualStyleBackColor = true;
            this.BTgirisOgr.Click += new System.EventHandler(this.BTgirisOgr_Click);
            // 
            // TBkullanici2
            // 
            this.TBkullanici2.Location = new System.Drawing.Point(131, 195);
            this.TBkullanici2.Name = "TBkullanici2";
            this.TBkullanici2.Size = new System.Drawing.Size(167, 22);
            this.TBkullanici2.TabIndex = 0;
            // 
            // TBsifre2
            // 
            this.TBsifre2.Location = new System.Drawing.Point(131, 244);
            this.TBsifre2.Name = "TBsifre2";
            this.TBsifre2.Size = new System.Drawing.Size(167, 22);
            this.TBsifre2.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.White;
            this.label3.Location = new System.Drawing.Point(47, 199);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(82, 17);
            this.label3.TabIndex = 2;
            this.label3.Text = "Kullanıcı No";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.BackColor = System.Drawing.Color.White;
            this.label4.Location = new System.Drawing.Point(47, 249);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(37, 17);
            this.label4.TabIndex = 2;
            this.label4.Text = "Sifre";
            // 
            // BTgirisAdm
            // 
            this.BTgirisAdm.Location = new System.Drawing.Point(50, 289);
            this.BTgirisAdm.Name = "BTgirisAdm";
            this.BTgirisAdm.Size = new System.Drawing.Size(248, 51);
            this.BTgirisAdm.TabIndex = 3;
            this.BTgirisAdm.Text = "Giriş Yap";
            this.BTgirisAdm.UseVisualStyleBackColor = true;
            this.BTgirisAdm.Click += new System.EventHandler(this.BTgirisAdm_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.pictureBox1);
            this.groupBox1.Controls.Add(this.TBkullanici);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.BTgirisOgr);
            this.groupBox1.Controls.Add(this.TBsifre);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.ForeColor = System.Drawing.Color.Black;
            this.groupBox1.Location = new System.Drawing.Point(35, 70);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(350, 399);
            this.groupBox1.TabIndex = 6;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "ÖGRENCİ GİRİŞİ";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::G171210111_Proje.Properties.Resources.student;
            this.pictureBox1.Location = new System.Drawing.Point(98, 21);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(150, 150);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 4;
            this.pictureBox1.TabStop = false;
            // 
            // groupBox2
            // 
            this.groupBox2.BackColor = System.Drawing.Color.Transparent;
            this.groupBox2.Controls.Add(this.pictureBox2);
            this.groupBox2.Controls.Add(this.TBkullanici2);
            this.groupBox2.Controls.Add(this.TBsifre2);
            this.groupBox2.Controls.Add(this.BTgirisAdm);
            this.groupBox2.Controls.Add(this.label3);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Location = new System.Drawing.Point(404, 70);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(350, 399);
            this.groupBox2.TabIndex = 7;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Admin Girişi";
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = global::G171210111_Proje.Properties.Resources.kutuphaneci;
            this.pictureBox2.Location = new System.Drawing.Point(106, 15);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(150, 150);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 4;
            this.pictureBox2.TabStop = false;
            // 
            // anasayfa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::G171210111_Proje.Properties.Resources.kitaplar;
            this.ClientSize = new System.Drawing.Size(782, 529);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "anasayfa";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TextBox TBkullanici;
        private System.Windows.Forms.TextBox TBsifre;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button BTgirisOgr;
        private System.Windows.Forms.TextBox TBkullanici2;
        private System.Windows.Forms.TextBox TBsifre2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button BTgirisAdm;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.PictureBox pictureBox2;
    }
}

