using System;
using System.Web.UI;

namespace GestordePedidos //  
{
    // La clase debe llamarse _Default para que coincida con la directiva Inherits.
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Este código se ejecuta cada vez que la página se carga.
            if (!IsPostBack)
            {
                // Código solo en la primera carga
            }
        }

        // Si implementas el formulario de contacto con C#, este es el método:
        /*
        protected void btnSubmitService_Click(object sender, EventArgs e)
        {
            // Lógica para procesar el formulario de servicio
            // ...
        }
        */
    }
}