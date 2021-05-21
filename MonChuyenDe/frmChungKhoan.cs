﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MonChuyenDe
{
    public partial class frmChungKhoan : Form
    {
        private const string TABLE_NAME = "BANG_GIA_TRUC_TUYEN";
        private SqlConnection _connection = null;
        private SqlCommand _command = null;
    
        private int _vitriRow;
        private int _vitriColumn;

        public frmChungKhoan()
        {
            InitializeComponent();
        }

        private void frmBGTT_Load(object sender, EventArgs e)
        {
            // disable group control
            this.groupBox1.Enabled = this.groupBox2.Enabled = false;

            // clear error provider
            errorProvider1.Clear();

            //set ngày
            DateTime dateTime = DateTime.Now.Date;
            lblNgay.Text = "Đặt lệnh cho ngày: " + dateTime.ToString("dd/MM/yyyy");

            // set loại lệnh trong Combobox 
            cmbLoaiLenh1.DisplayMember = "Text";
            cmbLoaiLenh1.ValueMember = "Value";
            cmbLoaiLenh1.Items.Add(new { Text = "Lệnh giới hạn(LO)", Value = "LO" });
            cmbLoaiLenh1.SelectedIndex = 0;

            cmbLoaiLenh2.DisplayMember = "Text";
            cmbLoaiLenh2.ValueMember = "Value";
            cmbLoaiLenh2.Items.Add(new { Text = "Lệnh giới hạn(LO)", Value = "LO" });
            cmbLoaiLenh2.SelectedIndex = 0;

            this.btnDatlenh1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.btnDatlenh1.ColumnHeadersHeight = this.btnDatlenh1.ColumnHeadersHeight * 2;
            this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.BottomCenter;


            // DEPENDENCY
            if (CanRequestNotifications() == true)
                BatDau();
            else
                MessageBox.Show("Bạn chưa kích hoạt dịch vụ Broker", "", MessageBoxButtons.OK);
         
        }
      

        private void BatDau()
        {
            // Remove any existing dependency connection, then create a new one.
            SqlDependency.Stop(GetConnectionString());
            try
            {
                SqlDependency.Start(GetConnectionString());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Loi", MessageBoxButtons.OK);
                return;
            }
            if (_connection == null)
            {
                _connection = new SqlConnection(GetConnectionString());
                _connection.Open();
            }

            if (_command == null)
            {
                _command = new SqlCommand(GetSQL(), _connection);
                _command.CommandType = CommandType.Text;
                _command.CommandTimeout = 600;

            }



            GetData();
        }

        private void GetData()
        {
            _command.Notification = null;
            SqlDependency dependency = new SqlDependency(_command);
            dependency.OnChange += dependency_OnChange;

            DataTable dt = new DataTable();
            dt.Load(_command.ExecuteReader());    // vì chỉ đọc nên dùng data Reader. ko cần phải dùng dataset
            this.btnDatlenh1.DataSource = dt;

            // giữ vị trí cursor
            try
            {
                btnDatlenh1.ClearSelection();
                btnDatlenh1.Rows[_vitriRow].Cells[_vitriColumn].Selected = true;

            }
            catch (Exception ex)
            {
                // neu co loi thi reset lai
                this.btnDatlenh1.ClearSelection();
            }

        }

        //Lấy ra các bản ghi để đưa vào data grip view Bảng giá trực tuyến
        private string GetSQL()
        {
            return " SELECT MACP AS[    - - - - - - -], DM_GIA3 AS[Giá Mua 3], DM_KL3 AS[KLM 3],DM_GIA2 AS[Giá Mua 2], DM_KL2 AS[KLM 2], DM_GIA1 AS[Giá Mua 1], DM_KL1 AS[KLM 1], KL_GIA AS[Giá Khớp], "
                    + " KL_KL AS[KL khớp], DB_GIA1 AS[Giá Bán 1], DB_KL1 AS[KLB 1], DB_GIA2 AS[Giá Bán 2], DB_KL2 AS[KLB 2], DB_GIA3 AS[Giá Bán 3], DB_KL3 AS[KLB 3] " +
                    " FROM dbo.BANG_GIA_TRUC_TUYEN ORDER BY MACP ASC ";
        }

        private void dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            ISynchronizeInvoke i = (ISynchronizeInvoke)this;
            if (i.InvokeRequired)
            {
                OnChangeEventHandler tempDelegate = new OnChangeEventHandler(dependency_OnChange);

                object[] args = new[] { sender, e };
                i.BeginInvoke(tempDelegate, args);

                return;
            }
            SqlDependency dependency = (SqlDependency)sender;
            dependency.OnChange -= dependency_OnChange;
            GetData();
        }



        //kiểm tra dịch vụ SQL Broker
        private bool CanRequestNotifications()
        {
            try
            {
                SqlClientPermission perm = new SqlClientPermission(PermissionState.Unrestricted);

                perm.Demand();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        private string GetConnectionString()
        {
            return @"Data Source=DESKTOP-V1L6PR0;Initial Catalog=CHUNGKHOAN;User ID=sa;Password=123";
        }
        private void dataGridView1_Paint(object sender, PaintEventArgs e)
        {
            // format text
            StringFormat format = new StringFormat();
            format.Alignment = StringAlignment.Center;
            format.LineAlignment = StringAlignment.Center;

            // độ rộng mỗi ô
            int w = this.btnDatlenh1.GetCellDisplayRectangle(2, -1, true).Width;

            // vẽ viền
            Pen pen = new Pen(Color.Brown, 1);
            pen.Alignment = PenAlignment.Inset;

            // ==> ô header Mã cổ phiếu
            // lấy đối tượng rectangle....
            Rectangle r1 = this.btnDatlenh1.GetCellDisplayRectangle(0, -1, true);


            //  chiều dài và rộng...
            r1.Width = r1.Width;
            r1.Height = r1.Height / 2 - 2;

            // vẽ ô header
            e.Graphics.FillRectangle(new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.BackColor), r1);
            e.Graphics.DrawString("MÃ CỔ PHIẾU", this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Font, new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.ForeColor),
            r1, format);
            e.Graphics.DrawRectangle(pen, r1);
            //==>  ô header Dư mua

            Rectangle r2 = this.btnDatlenh1.GetCellDisplayRectangle(1, -1, true);
            r2.Width = 6 * w;
            r2.Height = r2.Height / 2 - 2;

            e.Graphics.FillRectangle(new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.BackColor), r2);
            e.Graphics.DrawString("DƯ MUA", this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Font, new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.ForeColor),
            r2, format);
            e.Graphics.DrawRectangle(pen, r2);

            Rectangle r3 = this.btnDatlenh1.GetCellDisplayRectangle(7, -1, true);
            r3.Width = 2 * w;
            r3.Height = r3.Height / 2 - 2;

            e.Graphics.FillRectangle(new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.BackColor), r3);
            e.Graphics.DrawString("KHỚP LỆNH", this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Font, new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.ForeColor),
            r3, format);
            e.Graphics.DrawRectangle(pen, r3);

            Rectangle r4 = this.btnDatlenh1.GetCellDisplayRectangle(9, -1, true);

            r4.Width = 6 * w;
            r4.Height = r4.Height / 2 - 2;

            e.Graphics.FillRectangle(new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.BackColor), r4);
            e.Graphics.DrawString("DƯ BÁN", this.btnDatlenh1.ColumnHeadersDefaultCellStyle.Font, new SolidBrush(this.btnDatlenh1.ColumnHeadersDefaultCellStyle.ForeColor),
            r4, format);
            e.Graphics.DrawRectangle(pen, r4);
        }

        private void dataGridView1_Scroll(object sender, ScrollEventArgs e)
        {
            Rectangle rtHeader = this.btnDatlenh1.DisplayRectangle;
            rtHeader.Height = this.btnDatlenh1.ColumnHeadersHeight / 2;
            this.btnDatlenh1.Invalidate(rtHeader);

        }

        //Chọn 1 records
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            _vitriColumn = btnDatlenh1.CurrentCell.ColumnIndex;
            _vitriRow = btnDatlenh1.CurrentRow.Index;
        }

        //Dịch chuyển vị trí các records
        private void dataGridView1_ColumnWidthChanged(object sender, DataGridViewColumnEventArgs e)
        {
            Rectangle rtHeader = this.btnDatlenh1.DisplayRectangle;
            rtHeader.Height = this.btnDatlenh1.ColumnHeadersHeight / 2;
            this.btnDatlenh1.Invalidate(rtHeader);
        }

        private void dataGridView1_CellPainting(object sender, DataGridViewCellPaintingEventArgs e)
        {
            if (e.RowIndex == -1 && e.ColumnIndex > -1)
            {
                Rectangle r2 = e.CellBounds;
                r2.Y += e.CellBounds.Height / 2;
                r2.Height = e.CellBounds.Height / 2;

                e.PaintBackground(r2, true);
                e.PaintContent(r2);
                e.Handled = true;
            }
        }

        private void rdbMua_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = sender as RadioButton;
            if (rb.Checked)
            {
                this.groupBox1.Enabled = true;
                this.groupBox2.Enabled = false;
                return;
            }
        }

        private void Reset()
        {
            txtMaCK1.Text = txtMaCK2.Text = "";
            numSoluong1.Value = numSoluong2.Value = 0;
            numGia1.Value = numGia2.Value = 0;
        }
        private void rdbBan_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton rb = sender as RadioButton;
            if (rb.Checked)
            {
                this.groupBox1.Enabled = false;
                this.groupBox2.Enabled = true;
                return;
            }
        }

        private bool KiemTraLoi(TextBox txtCK, ComboBox cmbLenhDat, NumericUpDown numSoluong, NumericUpDown numGia)
        {
            errorProvider1.Clear();

            // TODO : Check khoảng trống ở textField
            if (txtCK.Text.Trim().Equals(""))
            {
                errorProvider1.SetError(txtCK, "Mã Cổ Phiếu không được để trống !");
                txtCK.Focus();
                return false;
            }
            //if (!(cmbLenhDat.SelectedIndex > -1))
            //{
            //    errorProvider1.SetError(cmbLenhDat, "Bạn chưa chọn lệnh đặt !");
            //    cmbLenhDat.Focus();
            //    return false;
            //}
            if (numSoluong.Value == 0)
            {
                errorProvider1.SetError(numSoluong, "Bạn chưa điền số lượng Cổ Phiếu !");
                numSoluong.Focus();
                return false;
            }
            if (numGia.Value == 0)
            {
                errorProvider1.SetError(numGia, "Bạn chưa điền giá  !");
                numGia.Focus();
                return false;
            }

            return true;

        }


        //Lệnh đặt mua
        private void button1_Click(object sender, EventArgs e)
        {
            // validate
            bool check = this.KiemTraLoi(txtMaCK1, cmbLoaiLenh1, numSoluong1, numGia1);
            if (check)
            {
                //do something
           
                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_KHOPLENH_LO", _connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;                
                        //Lấy ngày giờ
                        DateTime time = DateTime.Now;            
                        string format = "yyyy-MM-dd HH:mm:ss.mmm";
                            
                        cmd.Parameters.Add(new SqlParameter("@macp", txtMaCK1.Text.Trim()));
                        cmd.Parameters.Add(new SqlParameter("@Ngay", time.ToString(format) ));
                        cmd.Parameters.Add(new SqlParameter("@LoaiGD","M" ));
                        cmd.Parameters.Add(new SqlParameter("@soluongMB", numSoluong1.Value));
                        cmd.Parameters.Add(new SqlParameter("@giadatMB", numGia1.Value));

                        con.Open();
                        cmd.ExecuteNonQuery();

                        Reset();
                    }
            }

            }
            else
            {
                // lỗi return;
                return;
            }
        }

        //Lệnh đặt bán
        private void btnDatlenh2_Click(object sender, EventArgs e)
        {
            // validate
            bool check = this.KiemTraLoi(txtMaCK2, cmbLoaiLenh2, numSoluong2, numGia2);
            if (check)
            {
                //do something

                using (SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_KHOPLENH_LO", _connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //Lấy ngày giờ
                        DateTime time = DateTime.Now;
                        string format = "yyyy-MM-dd HH:mm:ss.mmm";

                        cmd.Parameters.Add(new SqlParameter("@macp", txtMaCK2.Text.Trim()));
                        cmd.Parameters.Add(new SqlParameter("@Ngay", time.ToString(format)));
                        cmd.Parameters.Add(new SqlParameter("@LoaiGD", "B"));
                        cmd.Parameters.Add(new SqlParameter("@soluongMB", numSoluong2.Value));
                        cmd.Parameters.Add(new SqlParameter("@giadatMB", numGia2.Value));

                        con.Open();
                        cmd.ExecuteNonQuery();

                        Reset();
                    }
                }
                }else
            {
                // lỗi return;
                return;
            }
        }

        private void btnDatlenh1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
