<%@ Page Title="Servicios" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestordePedidos._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .card-img-top { height:140px; object-fit:cover; }
    </style>

    <div class="container py-4">
        <div class="row mb-3">
            <div class="col-12 d-flex justify-content-between align-items-center">
                <h1 class="h4 mb-0">Servicios</h1>
                <div>
                    <a runat="server" href="~/" class="btn btn-sm btn-outline-primary me-2">Inicio</a>
                    <a runat="server" href="~/Contact.aspx" class="btn btn-sm btn-primary">Contacto</a>
                </div>
            </div>
        </div>

        <%-- Carrusel (Sliders) --%>
        <div id="mainCarousel" class="carousel slide mb-4" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="0" class="active" aria-current="true"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#mainCarousel" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner rounded">
                <div class="carousel-item active">
                    <img src="https://tse4.mm.bing.net/th/id/OIP.u_cvAHoZzMbt3JcRK4224QHaDf?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3" class="d-block w-100" alt="Entrega rápida">
                    <div class="carousel-caption d-none d-md-block text-dark bg-white bg-opacity-75 rounded p-2">
                        <h5>Entrega rápida</h5>
                        <p>Rutas optimizadas para entregas en 24-48 horas.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://th.bing.com/th/id/R.b3801e6e4bd8f188aaf74eca1a9b543b?rik=eQ6sL1MKztYUpQ&riu=http%3a%2f%2fdemuchounpoco.com%2fwp-content%2fuploads%2f2016%2f04%2fpaqueteria-internacional.jpg&ehk=N3k6wV%2bdwpYI7oDfAlI7SN%2bsYtglbNqwjxp0ZbdBjC4%3d&risl=&pid=ImgRaw&r=0" class="d-block w-100" alt="Puntos de recogida">
                    <div class="carousel-caption d-none d-md-block text-dark bg-white bg-opacity-75 rounded p-2">
                        <h5>Puntos de recogida</h5>
                        <p>Locales seguros y convenientes para recibir tus paquetes.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://img.freepik.com/fotos-premium/infografias-isometricas-logistica-global-infografias-logistica-isometrica-diagrama-flujo-imagenes-camiones-edificios-estantes-almacenes-senales-ubicacion-ilustraciones-vectoriales-subtitulos_1036975-232108.jpg" class="d-block w-100" alt="Rastreo en tiempo real">
                    <div class="carousel-caption d-none d-md-block text-dark bg-white bg-opacity-75 rounded p-2">
                        <h5>Rastreo en tiempo real</h5>
                        <p>Sigue cada movimiento de tu envío desde el panel.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>

        <%-- Sección de Tarjetas de Servicios --%>
        <section class="mb-4">
            <h2 class="h5">Nuestros servicios</h2>
            <div class="row g-3 mt-2">
            
                <div class="col-sm-6 col-lg-4">
                    <div class="card h-100">
                        <img src="https://img.freepik.com/vector-premium/concepto-via-logistica-caja-mensajeria-pedidos-linea-camion-entrega_133260-8059.jpg?w=996" class="card-img-top" alt="Servicio 1">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">Recolección a domicilio</h5>
                            <p class="card-text">Solicita que recojamos tus paquetes en la dirección que indiques.</p>
                            <div class="mt-auto">
                                <a href="#" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#detailModal" data-title="Recolección a domicilio" data-desc="Solicita una recolección y nuestro equipo pasará en la franja horaria seleccionada.">Ver más</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-6 col-lg-4">
                    <div class="card h-100">
                        <img src="https://tse4.mm.bing.net/th/id/OIP.PfDbNcpOcTzHBKsSUNcLSgHaE-?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3" class="card-img-top" alt="Servicio 2">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">Puntos de entrega</h5>
                            <p class="card-text">Recibe tus paquetes en puntos cercanos y seguros.</p>
                            <div class="mt-auto">
                                <a href="#" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#detailModal" data-title="Puntos de entrega" data-desc="Elige un punto de recogida cercano y recoge cuando te sea conveniente.">Ver más</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-6 col-lg-4">
                    <div class="card h-100">
                        <img src="https://tse2.mm.bing.net/th/id/OIP.pwj5GOs91oDuZxEYfXA1ZQHaEI?cb=12&w=1060&h=592&rs=1&pid=ImgDetMain&o=7&rm=3" class="card-img-top" alt="Servicio 3">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title">Rastreo y notificaciones</h5>
                            <p class="card-text">Recibe actualizaciones por email/WhatsApp sobre tu envío.</p>
                            <div class="mt-auto">
                                <a href="#" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#detailModal" data-title="Rastreo y notificaciones" data-desc="Configura notificaciones y sigue el estado en tiempo real.">Ver más</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%-- Modal de Detalles --%>
        <div class="modal fade" id="detailModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalTitle">Detalle</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="modalBody">Contenido</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <a runat="server" href="~/Contact.aspx" class="btn btn-primary">Solicitar servicio</a>
                    </div>
                </div>
            </div>
        </div>

        <%-- Sección de Contacto Rápido (Manejada por JavaScript en el cliente) --%>
        <section class="mb-4">
            <h2 class="h5">Contacto</h2>
            <p class="text-muted small">Completa el formulario para que te contactemos.</p>
            <form id="serviceContact">
                <div class="row g-2">
                    <div class="col-md-6">
                        <input type="text" class="form-control" id="cname" placeholder="Nombre" required>
                    </div>
                    <div class="col-md-6">
                        <input type="email" class="form-control" id="cemail" placeholder="Correo electrónico" required>
                    </div>
                    <div class="col-12">
                        <input type="tel" class="form-control" id="cphone" placeholder="Teléfono (opcional)">
                    </div>
                    <div class="col-12">
                        <textarea class="form-control" id="cmsg" rows="3" placeholder="Mensaje / detalles" required></textarea>
                    </div>
                    <div class="col-12 text-end">
                        <button class="btn btn-primary" type="submit">Enviar</button>
                    </div>
                </div>
            </form>
            <div id="contactFeedback" class="mt-3" style="display:none;"></div>
        </section>
    </div>

    <%-- El JavaScript personalizado se queda aquí --%>
    <script>
        // Script para pasar datos al modal de detalles
        const detailModal = document.getElementById('detailModal');
        if (detailModal) { // Comprobación para evitar errores si Bootstrap no carga
            detailModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget;
                const title = button.getAttribute('data-title');
                const desc = button.getAttribute('data-desc');
                document.getElementById('modalTitle').textContent = title;
                document.getElementById('modalBody').textContent = desc;
            });
        }

        // Script para procesar el formulario de contacto (Manejo de Cliente con JS)
        const serviceContact = document.getElementById('serviceContact');
        if (serviceContact) {
            serviceContact.addEventListener('submit', function (e) {
                e.preventDefault();
                const fb = document.getElementById('contactFeedback');
                fb.style.display = 'block';
                fb.className = 'alert alert-success';
                fb.textContent = 'Gracias. Tu mensaje ha sido recibido. Te contactaremos pronto.';
                this.reset();
            });
        }
    </script>

</asp:Content>