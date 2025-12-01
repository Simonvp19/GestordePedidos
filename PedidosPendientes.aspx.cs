using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorWeb
{
    public partial class PedidosPendientes : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CargarTabla();
        }

        void CargarTabla()
        {
            // Filtramos solo los pedidos pendientes (Entregado = 0)
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                MySqlCommand cmd = new MySqlCommand(
                    "SELECT Id_Pedido, Numero, Nombre_Cliente, Fecha_Recepcion FROM pedidos WHERE Entregado = 0 ORDER BY Fecha_Recepcion ASC", con);

                con.Open();
                gridPedidos.DataSource = cmd.ExecuteReader();
                gridPedidos.DataBind();
            }
        }

        protected void gridPedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string accion = e.CommandName;

            if (!int.TryParse(e.CommandArgument.ToString(), out int Id_Pedido))
            {
                return;
            }

            if (accion == "Entregar")
            {
                // Guardar el Id_Pedido en el HiddenField
                hfIdPedido.Value = Id_Pedido.ToString();

                // Limpiar campos y errores antes de abrir el modal
                txtConfirmNumero.Text = "";
                txtConfirmCliente.Text = "";
                lblError.Text = "";

                // Forzar la actualización del UpdatePanel del Modal y abrirlo
                if (updConfirmacion != null)
                {
                    updConfirmacion.Update();
                }

                ScriptManager.RegisterStartupScript(this.Page, GetType(), "modal", "abrirModal('modalConfirmarEntrega');", true);
            }

            else if (accion == "Editar")
            {
                Response.Redirect("PedidosForm.aspx?id=" + Id_Pedido);
            }

            else if (accion == "Eliminar")
            {
                using (MySqlConnection con = new MySqlConnection(conn))
                {
                    MySqlCommand cmd = new MySqlCommand("DELETE FROM pedidos WHERE Id_Pedido=@id", con);
                    cmd.Parameters.AddWithValue("@id", Id_Pedido);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                CargarTabla();
                if (updGrid != null) updGrid.Update(); // Actualizar la grilla
            }
        }

        protected void btnConfirmarEntrega_Click(object sender, EventArgs e)
        {
            // --- 1. Lógica de Validación (Id_Pedido es la clave) ---
            if (!int.TryParse(hfIdPedido.Value, out int Id_Pedido) || Id_Pedido == 0)
            {
                lblError.Text = "Error interno: ID de pedido no válido. Recargue la página.";
                goto FinalizarAccion;
            }

            // Validar que el Número sea un entero
            if (!int.TryParse(txtConfirmNumero.Text, out int numeroConfirmado))
            {
                lblError.Text = "🚨 Error: Ingrese el número de pedido correctamente (solo números).";
                goto FinalizarAccion;
            }

            // Validar que el Cliente no esté vacío
            string clienteConfirmado = txtConfirmCliente.Text.Trim();
            if (string.IsNullOrWhiteSpace(clienteConfirmado))
            {
                lblError.Text = "🚨 Error: Ingrese el nombre del cliente.";
                goto FinalizarAccion;
            }

            // --- 2. Verificación de Coincidencia de Datos en la BD ---
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                MySqlCommand cmd = new MySqlCommand(
                    "SELECT COUNT(Id_Pedido) FROM pedidos WHERE Id_Pedido=@id AND Numero=@num AND Nombre_Cliente=@cli AND Entregado = 0", con);

                cmd.Parameters.AddWithValue("@id", Id_Pedido);
                cmd.Parameters.AddWithValue("@num", numeroConfirmado);
                cmd.Parameters.AddWithValue("@cli", clienteConfirmado);

                con.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count == 0)
                {
                    lblError.Text = "❌ Error: Los datos ingresados no coinciden con el pedido pendiente.";
                    goto FinalizarAccion;
                }
            }

            // --- 3. Actualización a Entregado = 1 (¡Éxito!) ---
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                // Usamos la versión segura de la consulta que funciona con tu DB (Opción B)
                MySqlCommand cmd = new MySqlCommand(
                    "UPDATE pedidos SET Entregado = 1 WHERE Id_Pedido=@Id_Pedido", con);

                cmd.Parameters.AddWithValue("@Id_Pedido", Id_Pedido);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Éxito:
            txtConfirmNumero.Text = "";
            txtConfirmCliente.Text = "";
            lblError.Text = "";

            CargarTabla();
            if (updGrid != null) updGrid.Update();

            // FIX CLAVE: Cerrar el modal programáticamente
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "CloseModalScript", "cerrarModal('modalConfirmarEntrega');", true);
            return;


        FinalizarAccion:
            // **Solo actualizamos el UpdatePanel si hay un ERROR**
            if (updConfirmacion != null) updConfirmacion.Update();
            // Aseguramos que el modal se mantenga abierto.
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "Pop", "abrirModal('modalConfirmarEntrega');", true);
            return;
        }
    }
}
