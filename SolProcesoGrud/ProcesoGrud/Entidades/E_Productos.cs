using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoGrud.Entidades
{
    public class E_Productos
    {
        public int idCodigo_pr { get; set; }
        public string descripcion_pr { get; set; }
        public string marca_pr { get; set; }
        public int codigo_me { get; set; }
        public int codigo_ca { get; set; }
        public decimal stock_actual { get; set; }
    }
}
