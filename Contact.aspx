<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="Contacto.aspx.cs" Inherits="GestordePedidos.Contact" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- 🛑 Eliminamos <html>, <head>, y <body> porque los proporciona la Master Page. --%>
    
    <div class="container py-5">
        <div class="row">
            <div class="col-12 mb-4">
                <h1 class="h3">Contacto</h1>
                <p class="text-muted">Si necesitas soporte con envíos, solicitudes de recolección o seguimiento de paquetes, aquí tienes todas las vías para comunicarte con nosotros.</p>
                <%-- Cambiamos el enlace a la página principal de ASP.NET --%>
                <a runat="server" href="~/" class="btn btn-sm btn-primary">Inicio</a> 
            </div>
        </div>

        <div class="row g-4">

            <div class="col-lg-5">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="h5">Atención al cliente</h2>
                        <p class="mb-1"><strong>Teléfono:</strong> <a href="tel:+524491125511">+52 449 112 55 11</a></p>
                        <p class="mb-1"><strong>WhatsApp:</strong> <a href="https://wa.me/524491125511" target="_blank" rel="noopener">+52 449 112 55 11</a></p>
                        <p class="mb-1"><strong>Email:</strong> <a href="mailto:soporte@oneonline.com">soporte@oneonline.com</a></p>

                        <hr>
                        <h3 class="h6">Horario de atención</h3>
                        <p class="mb-1">Lunes a Viernes: 08:00 – 20:00</p>
                        <p class="mb-1">Sábados: 09:00 – 15:00</p>
                        <p class="mb-0 text-muted">Fuera de horario, deja un mensaje y te responderemos en el siguiente día hábil.</p>

                        <hr>
                        <h3 class="h6">Oficinas / Centros de entrega</h3>
                        <p class="mb-1"><strong>Centro Aguascalientes:</strong> Av. Principal 123, Col. Centro</p>
                        <p class="mb-1"><strong>Centro Jesus Maria:</strong> Calle Secundaria 45, Col. Industria</p>
                        

                        <hr>
                        <h3 class="h6">Redes y ayuda rápida</h3>
                        <p class="mb-1">Soporte rápido por redes: <a href="#">Facebook</a> · <a href="#">Twitter</a> · <a href="#">Instagram</a></p>
                    </div>
                </div>

                <div class="card shadow-sm mt-4">
                    <div class="card-body">
                        <h3 class="h6">Rastrea tu paquete</h3>
                        <p class="text-muted small">Introduce tu número de guía y pulsa "Rastrear".</p>
                        
                        <%-- Convertimos a control de servidor si deseas usar C# para el rastreo --%>
                        <div class="input-group">
                            <asp:TextBox ID="trackingId" runat="server" CssClass="form-control" placeholder="Ej: OO123456789MX" />
                            <asp:Button ID="trackBtn" runat="server" CssClass="btn btn-primary" Text="Rastrear" OnClick="trackBtn_Click" />
                        </div>
                        <div id="trackingResult" runat="server" class="mt-3" style="display:none;"></div>
                    </div>
                </div>
            </div>

            <div class="col-lg-7">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="h5">Enviar una solicitud</h2>
                        <p class="text-muted small">Utiliza este formulario para solicitar recolección, reportar un problema o pedir información sobre envíos.</p>

                        <%-- 🛑 NO USAR <form> aquí. EL formulario ya está en la Master Page. --%>
                        
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="txtName" class="form-label">Nombre</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required="required" />
                            </div>
                            <div class="col-md-6">
                                <label for="txtPhone" class="form-label">Teléfono</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="(opcional)" TextMode="Phone" />
                            </div>

                            <div class="col-md-6">
                                <label for="txtEmail" class="form-label">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required="required" TextMode="Email" />
                            </div>
                            <div class="col-md-6">
                                <label for="ddlServiceType" class="form-label">Tipo de solicitud</label>
                                <asp:DropDownList ID="ddlServiceType" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="consulta">Consulta</asp:ListItem>
                                    <asp:ListItem Value="recoleccion">Solicitud de recolección</asp:ListItem>
                                    <asp:ListItem Value="reclamo">Reclamo / Incidencia</asp:ListItem>
                                    <asp:ListItem Value="otro">Otro</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-12">
                                <label for="txtAddress" class="form-label">Dirección (si aplica)</label>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Calle, número, colonia, ciudad" />
                            </div>

                            <div class="col-12">
                                <label for="txtMessage" class="form-label">Mensaje / Instrucciones</label>
                                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" Rows="4" TextMode="MultiLine" required="required" />
                            </div>

                            <div class="col-12 d-flex justify-content-end">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Enviar solicitud" OnClick="btnSubmit_Click" />
                            </div>
                            
                            <asp:Literal ID="formFeedback" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-12 text-muted small">
                <p class="mb-1">Nota: Esta página es un formulario front-end de ejemplo. Para recibir las solicitudes realmente debes conectar el formulario a tu servicio de correo/CRM o a un endpoint en servidor (por ejemplo una API REST).</p>
                <p class="mb-0">Privacidad: Tratamos tus datos con confidencialidad. Al enviar un formulario aceptas que usemos los datos para el propósito indicado.</p>
            </div>
        </div>
    </div>

    <%-- 🛑 El script de Bootstrap y el script personalizado NO van aquí. --%>
    <%-- Ya pusimos el JS de Bootstrap 5 en la Master Page. --%>
    <%-- Si necesitas el script de rastreo (trackBtn), lo implementaremos en C# o lo moveremos al code-behind. --%>

</asp:Content>
