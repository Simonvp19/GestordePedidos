using System;

namespace GestorWeb.Models
{
    public class Pedido
    {
        public int Id_Pedido { get; set; }
        public int Numero { get; set; }
        public string Nombre_Cliente { get; set; }
        public DateTime Fecha_Recepcion { get; set; }
        public bool Entregado { get; set; }
    }
}
