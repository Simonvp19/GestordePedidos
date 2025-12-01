<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="About.aspx.cs" Inherits="GestordePedidos.About" %>

<asp:Content ID="ContentBody" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- 🛑 Eliminamos <html>, <head>, <body> y la referencia a Bootstrap JS, ya que la Master Page los proporciona. --%>

    <style>
        /* El estilo es importante, lo mantenemos aquí para que se aplique SOLAMENTE a esta página. */
        .hero { background: #0d6efd; color: white; }
        .hero .lead { color: #e9f2ff; }
    </style>
    
    <div class="container py-4">
        
        <%-- Encabezado --%>
        <div class="row mb-4">
            <div class="col-12 text-center">
                <h1 class="h3">OneOnline</h1>
                <p class="mb-0">Servicio online para recepción y entrega de paquetes</p>
            </div>
        </div>

        <%-- Sección Héroe/Destacado --%>
        <div class="row align-items-center hero rounded p-4 mb-4">
            <div class="col-md-6">
                <h2 class="h4">Recibe y envía paquetes desde tu cuenta</h2>
                <p class="lead">Administra tus envíos, programa recolecciones y rastrea todo en un mismo lugar, accesible desde la web o la app.</p>
                <div class="d-grid gap-2 d-md-block">
                    <%-- Corrección de enlaces a rutas ASP.NET --%>
                    <a runat="server" href="~/PedidosPendientes.aspx" class="btn btn-light">Ir al panel</a>
                    <a runat="server" href="~/Contact.aspx" class="btn btn-outline-light">Contáctanos</a>
                </div>
            </div>
            <div class="col-md-6 text-center">
                <div style="height:140px; background:#ffffff22; border-radius:8px; display:flex; align-items:center; justify-content:center; color:#fff;">
                    [Espacio para imagen o ícono representativo]
                </div>
            </div>
        </div>

        <%-- Características --%>
        <div class="row text-center mb-4">
            <div class="col-md-4 mb-3">
                <h5 class="mb-1">Rastreo</h5>
                <p class="small text-muted mb-0">Estado en tiempo real de tus paquetes.</p>
            </div>
            <div class="col-md-4 mb-3">
                <h5 class="mb-1">Recolecciones</h5>
                <p class="small text-muted mb-0">Programa recolecciones desde tu perfil.</p>
            </div>
            <div class="col-md-4 mb-3">
                <h5 class="mb-1">Puntos de entrega</h5>
                <p class="small text-muted mb-0">Red de puntos para recoger paquetes.</p>
            </div>
        </div>

        <%-- FAQ (Acordeón) --%>
        <div class="row mb-4">
            <div class="col-md-8">
                <h6>Preguntas frecuentes</h6>
                <div class="accordion" id="faqSimple">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="faq1"><button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#f1">¿Cómo solicito una recolección?</button></h2>
                        <div id="f1" class="accordion-collapse collapse" data-bs-parent="#faqSimple"><div class="accordion-body">Desde el panel selecciona 'Solicitar recolección' e indica dirección y horario.</div></div>
                    </div>
                    <%-- Puedes agregar más ítems de FAQ aquí --%>
                </div>
            </div>
            <div class="col-md-4 text-md-end align-self-center">
                <%-- Corrección de enlace a ruta ASP.NET --%>
                <a class="btn btn-primary" runat="server" href="~/Contact.aspx">Soporte</a>
            </div>
        </div>

        <%-- Información adicional --%>
        <div class="row">
            <div class="col-12 text-center small text-muted"> — Términos · Privacidad</div>
        </div>
    </div>

    <%-- 🛑 El script de Bootstrap NO va aquí, ya está en la Master Page. --%>
    
</asp:Content>