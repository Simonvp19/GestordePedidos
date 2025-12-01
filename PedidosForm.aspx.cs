using System;
using System.Configuration;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace GestorWeb
{
    public partial class PedidosForm : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        // Campo privado para guardar el ID del pedido si estamos editando.
        private int PedidoID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 1. Detección de Edición/Registro y Carga Inicial
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                // Modo EDICIÓN
                if (int.TryParse(Request.QueryString["id"], out PedidoID))
                {
                    if (!IsPostBack)
                    {
                        CargarDatosPedidoParaEdicion(PedidoID);
                        lblTituloFormulario.Text = $"Editar Pedido # {PedidoID}"; // Actualizar título
                    }
                }
            }
            else
            {
                // Modo REGISTRO
                if (!IsPostBack)
                {
                    LimpiarCampos();
                    lblTituloFormulario.Text = "Registrar Nuevo Pedido"; // Actualizar título
                }
            }
        }

        private void CargarDatosPedidoParaEdicion(int id)
        {
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                MySqlCommand cmd = new MySqlCommand(
                    @"SELECT Numero, Nombre_Cliente, Fecha_Recepcion FROM pedidos WHERE Id_Pedido=@id", con);

                cmd.Parameters.AddWithValue("@id", id);
                con.Open();

                using (var dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        txtNumero.Text = dr.GetInt32("Numero").ToString();
                        txtCliente.Text = dr.GetString("Nombre_Cliente");
                        // Formateamos la fecha a "yyyy-MM-dd" para el control TextMode="Date"
                        txtFecha.Text = dr.GetDateTime("Fecha_Recepcion").ToString("yyyy-MM-dd");
                    }
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Re-evaluamos PedidoID en el PostBack
            PedidoID = 0;
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int.TryParse(Request.QueryString["id"], out PedidoID);
            }

            if (PedidoID > 0)
            {
                ActualizarPedido(PedidoID);
            }
            else
            {
                RegistrarNuevoPedido();
            }
        }

        private void ActualizarPedido(int id)
        {
            // --- 1. Validaciones Robustas ---
            if (!int.TryParse(txtNumero.Text, out int numero))
            {
                lblMensaje.Text = "🚨 ERROR: El Número de Pedido debe ser un número entero válido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string cliente = txtCliente.Text.Trim();
            if (string.IsNullOrWhiteSpace(cliente))
            {
                lblMensaje.Text = "🚨 ERROR: El Nombre del Cliente no puede estar vacío.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!DateTime.TryParse(txtFecha.Text, out DateTime fecha))
            {
                lblMensaje.Text = "🚨 ERROR: La Fecha de Recepción no tiene un formato válido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // --- 2. Actualización en Base de Datos ---
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                MySqlCommand cmd = new MySqlCommand(
                    @"UPDATE pedidos SET 
                        Numero=@n, 
                        Nombre_Cliente=@c, 
                        Fecha_Recepcion=@f 
                      WHERE Id_Pedido=@id", con); // Usando Id_Pedido

                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@n", numero);
                cmd.Parameters.AddWithValue("@c", cliente);
                cmd.Parameters.AddWithValue("@f", fecha);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // --- 3. Éxito y Redirección ---
            lblMensaje.Text = "✅ Pedido **ACTUALIZADO** correctamente. Redirigiendo...";
            lblMensaje.ForeColor = System.Drawing.Color.Green;

            ScriptManager.RegisterStartupScript(this, GetType(), "redirect", "setTimeout(function(){ window.location.href = 'PedidosPendientes.aspx'; }, 1500);", true);
        }

        private void RegistrarNuevoPedido()
        {
            // --- 1. Validaciones Robustas ---
            if (!int.TryParse(txtNumero.Text, out int numero))
            {
                lblMensaje.Text = "🚨 ERROR: El Número de Pedido debe ser un número entero válido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string cliente = txtCliente.Text.Trim();
            if (string.IsNullOrWhiteSpace(cliente))
            {
                lblMensaje.Text = "🚨 ERROR: El Nombre del Cliente no puede estar vacío.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!DateTime.TryParse(txtFecha.Text, out DateTime fecha))
            {
                lblMensaje.Text = "🚨 ERROR: La Fecha de Recepción no tiene un formato válido.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // --- 2. INSERCIÓN EN BASE DE DATOS ---
            using (MySqlConnection con = new MySqlConnection(conn))
            {
                MySqlCommand cmd = new MySqlCommand(
                    @"INSERT INTO pedidos (Numero, Nombre_Cliente, Fecha_Recepcion, Entregado)
                      VALUES (@n, @c, @f, 0)", con);

                cmd.Parameters.AddWithValue("@n", numero);
                cmd.Parameters.AddWithValue("@c", cliente);
                cmd.Parameters.AddWithValue("@f", fecha);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // --- 3. Éxito y Redirección ---
            lblMensaje.Text = "✅ Pedido **REGISTRADO** correctamente. Redirigiendo...";
            lblMensaje.ForeColor = System.Drawing.Color.Green;

            ScriptManager.RegisterStartupScript(this, GetType(), "redirect",
                "setTimeout(function(){ window.location.href = 'PedidosPendientes.aspx'; }, 1500);", true);
        }

        private void LimpiarCampos()
        {
            txtNumero.Text = string.Empty;
            txtCliente.Text = string.Empty;
            txtFecha.Text = string.Empty;
            // No se limpia lblMensaje aquí para que los mensajes de error/éxito persistan en el PostBack.
        }
    }
}