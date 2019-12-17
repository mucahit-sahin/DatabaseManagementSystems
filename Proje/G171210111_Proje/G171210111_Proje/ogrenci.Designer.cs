namespace G171210111_Proje
{
    partial class ogrenci
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.BTtumlistele = new System.Windows.Forms.Button();
            this.BTkitaplarim = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label1 = new System.Windows.Forms.Label();
            this.TBodunc = new System.Windows.Forms.TextBox();
            this.BToduncAl = new System.Windows.Forms.Button();
            this.BTcikisYap = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.BTgeriVer = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 179);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(782, 282);
            this.dataGridView1.TabIndex = 0;
            // 
            // BTtumlistele
            // 
            this.BTtumlistele.Location = new System.Drawing.Point(12, 64);
            this.BTtumlistele.Name = "BTtumlistele";
            this.BTtumlistele.Size = new System.Drawing.Size(273, 57);
            this.BTtumlistele.TabIndex = 1;
            this.BTtumlistele.Text = "Tümünü Listele";
            this.BTtumlistele.UseVisualStyleBackColor = true;
            this.BTtumlistele.Click += new System.EventHandler(this.BTtumlistele_Click);
            // 
            // BTkitaplarim
            // 
            this.BTkitaplarim.Location = new System.Drawing.Point(672, 104);
            this.BTkitaplarim.Name = "BTkitaplarim";
            this.BTkitaplarim.Size = new System.Drawing.Size(110, 57);
            this.BTkitaplarim.TabIndex = 1;
            this.BTkitaplarim.Text = "Kitaplarim";
            this.BTkitaplarim.UseVisualStyleBackColor = true;
            this.BTkitaplarim.Click += new System.EventHandler(this.BTkitaplarim_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.TBodunc);
            this.groupBox1.Controls.Add(this.BTgeriVer);
            this.groupBox1.Controls.Add(this.BToduncAl);
            this.groupBox1.Location = new System.Drawing.Point(291, 24);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(342, 149);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Kitap Ödünç Al";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(49, 40);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 17);
            this.label1.TabIndex = 2;
            this.label1.Text = "KitapId";
            // 
            // TBodunc
            // 
            this.TBodunc.Location = new System.Drawing.Point(180, 40);
            this.TBodunc.Name = "TBodunc";
            this.TBodunc.Size = new System.Drawing.Size(100, 22);
            this.TBodunc.TabIndex = 1;
            // 
            // BToduncAl
            // 
            this.BToduncAl.Location = new System.Drawing.Point(52, 89);
            this.BToduncAl.Name = "BToduncAl";
            this.BToduncAl.Size = new System.Drawing.Size(119, 38);
            this.BToduncAl.TabIndex = 0;
            this.BToduncAl.Text = "Ödünç Al";
            this.BToduncAl.UseVisualStyleBackColor = true;
            this.BToduncAl.Click += new System.EventHandler(this.BToduncAl_Click);
            // 
            // BTcikisYap
            // 
            this.BTcikisYap.Location = new System.Drawing.Point(672, 24);
            this.BTcikisYap.Name = "BTcikisYap";
            this.BTcikisYap.Size = new System.Drawing.Size(110, 57);
            this.BTcikisYap.TabIndex = 1;
            this.BTcikisYap.Text = "Çıkış Yap";
            this.BTcikisYap.UseVisualStyleBackColor = true;
            this.BTcikisYap.Click += new System.EventHandler(this.BTcikisYap_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(112, 134);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(0, 17);
            this.label2.TabIndex = 3;
            // 
            // BTgeriVer
            // 
            this.BTgeriVer.Location = new System.Drawing.Point(180, 89);
            this.BTgeriVer.Name = "BTgeriVer";
            this.BTgeriVer.Size = new System.Drawing.Size(119, 38);
            this.BTgeriVer.TabIndex = 0;
            this.BTgeriVer.Text = "Geri Ver";
            this.BTgeriVer.UseVisualStyleBackColor = true;
            // 
            // ogrenci
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(806, 495);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.BTcikisYap);
            this.Controls.Add(this.BTkitaplarim);
            this.Controls.Add(this.BTtumlistele);
            this.Controls.Add(this.dataGridView1);
            this.Name = "ogrenci";
            this.Text = "ogrenci";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button BTtumlistele;
        private System.Windows.Forms.Button BTkitaplarim;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox TBodunc;
        private System.Windows.Forms.Button BToduncAl;
        private System.Windows.Forms.Button BTcikisYap;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button BTgeriVer;
    }
}