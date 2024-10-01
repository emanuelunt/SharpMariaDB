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
    }
}
