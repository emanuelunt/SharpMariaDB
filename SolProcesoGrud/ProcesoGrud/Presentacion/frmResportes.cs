using ProcesoGrud.Datos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProcesoGrud.Presentacion
{
    public partial class frmProductos : Form
    {
        public frmProductos()
        {
            InitializeComponent();
        }

        #region "Mis Variables"
        int nEstadoguarda = 0;
        int nCodigo_pr = 0;
        int nCodigo_me = 0;
        int nCodigo_ca = 0;
        #endregion

        #region "Mis metodos"
        private void Formato()
        {
            dataGridListar.Columns[0].Width = 100;
            dataGridListar.Columns[0].HeaderText = "Código_pr";

            dataGridListar.Columns[1].Width = 180;
            dataGridListar.Columns[1].HeaderText = "PRODUCTO";

            dataGridListar.Columns[2].Width = 110;
            dataGridListar.Columns[2].HeaderText = "MARCA";

            dataGridListar.Columns[3].Width = 100;
            dataGridListar.Columns[3].HeaderText = "MEDIDA";

            dataGridListar.Columns[4].Width = 110;
            dataGridListar.Columns[4].HeaderText = "CATEGORIA";

            dataGridListar.Columns[5].Width = 110;
            dataGridListar.Columns[5].HeaderText = "STOCK ACTUAL";

            dataGridListar.Columns[6].Visible = false;
            dataGridListar.Columns[7].Visible = false;            
        }

        private void listado_pr(string cTexto)
        { 
            D_Productos datos = new D_Productos();
            dataGridListar.DataSource = datos.listado_pro(cTexto);
            this.Formato();
        }

        private void listado_me() // Método para cargar el combo para la medida
        {
            D_Productos datos = new D_Productos();
            cmbMedida.DataSource = datos.listado_me();
            cmbMedida.ValueMember = "idCodigo_me";
            cmbMedida.DisplayMember = "descripcion_me";            
        }

        private void listado_ca() // Método para cargar el combo para la categoria
        {
            D_Productos datos = new D_Productos();
            cmbCategorias.DataSource = datos.listado_ca();
            cmbCategorias.ValueMember = "idCategoria_ca";
            cmbCategorias.DisplayMember = "descripcion_ca";
        }
        private void limpir_Texto()
        {
            txtDescripcion.Text = "";
            txtMarca.Text = "";
            cmbMedida.Text = "";
            cmbCategorias.Text = "";
            txtStock_Actual.Text = "0.00";
        }
        private void estado_Texto(bool estado)
        {
            txtDescripcion.Enabled = estado;
            txtMarca.Enabled = estado;
            cmbMedida.Enabled = estado;
            cmbCategorias.Enabled = estado;
            txtStock_Actual.Enabled = estado;
        }
        private void estado_botonesProcesos(bool estado)
        {
            btnCancelar.Visible = estado;
            btnGuardar.Visible = estado;
        }
        private void estado_botonesPrincipales(bool estado)
        {
            btnNuevo.Enabled = estado;
            btnActualizar.Enabled = estado;
            btnEliminar.Enabled = estado;
            btnReporte.Enabled = estado;
            btnSalir.Enabled = estado;          
        }
        #endregion

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            nEstadoguarda = 1; // Nuevo registro
            this.limpir_Texto();
            this.estado_Texto(true);
            this.estado_botonesProcesos(true);
            this.estado_botonesPrincipales(false);
            txtDescripcion.Focus();           
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            nEstadoguarda = 0;
            this.limpir_Texto();
            this.estado_Texto(false);
            this.estado_botonesProcesos(false);
            this.estado_botonesPrincipales(true);
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmProductos_Load(object sender, EventArgs e)
        {
            this.listado_me();
            this.listado_ca();
            this.listado_pr("%");
        }
        
    }
}
