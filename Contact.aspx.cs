using System;
using System.Web.UI;

namespace GestordePedidos
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Código de inicialización
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Lógica de envío del formulario (ej. enviar email)

            // 1. Obtener los valores:
            string nombre = txtName.Text;
            string email = txtEmail.Text;
            string tipoSolicitud = ddlServiceType.SelectedValue;
            string mensaje = txtMessage.Text;

            // Aquí iría tu lógica para enviar el email o guardar en base de datos.

            // 2. Mostrar feedback (alerta de Bootstrap)
            formFeedback.Text = "<div class='alert alert-success mt-3'>Gracias. Tu solicitud ha sido enviada (" + nombre + "). Nuestro equipo te contactará pronto.</div>";

            // 3. Limpiar el formulario
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtMessage.Text = "";
        }

        protected void trackBtn_Click(object sender, EventArgs e)
        {
            // Lógica para el rastreo del paquete
            string trackingIdValue = trackingId.Text.Trim();

            if (string.IsNullOrEmpty(trackingIdValue))
            {
                // Muestra un error si está vacío
                trackingResult.InnerHtml = "<div class='alert alert-warning'>Introduce un número de guía válido.</div>";
                trackingResult.Style["display"] = "block";
                return;
            }

            // Simulación de resultado
            trackingResult.InnerHtml = $"<div class='alert alert-info'><strong>Estado:</strong> En tránsito<br><small>Número de guía: {trackingIdValue}</small></div>";
            trackingResult.Style["display"] = "block";
        }
    }
}