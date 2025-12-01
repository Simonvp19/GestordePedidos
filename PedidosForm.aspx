<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PedidosForm.aspx.cs" Inherits="GestorWeb.PedidosForm" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                
                <div class="card shadow-lg p-4">
                    <div class="card-body">
                        
                        <asp:Label ID="lblTituloFormulario" runat="server" Text="Registrar Pedido" CssClass="card-title h4 mb-4 text-center d-block"></asp:Label>
                        
                        <div class="mb-3">
                            <label for="<%= txtNumero.ClientID %>" class="form-label">Número:</label>
                            <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" placeholder="Introduce el número de paquete"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="<%= txtCliente.ClientID %>" class="form-label">Nombre del Cliente:</label>
                            <asp:TextBox ID="txtCliente" runat="server" CssClass="form-control" placeholder="Nombre completo del cliente"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="<%= txtFecha.ClientID %>" class="form-label">Fecha de Recepción:</label>
                            <asp:TextBox ID="txtFecha" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary w-100 mt-3" Text="Guardar Pedido" OnClick="btnGuardar_Click" />
                        
                        <div class="d-flex justify-content-between align-items-center mt-3">
                            <asp:HyperLink NavigateUrl="PedidosPendientes.aspx" Text="< Regresar a Pedidos" runat="server" CssClass="text-muted small" />
                            
                            <asp:Label ID="lblMensaje" runat="server" ForeColor="Green" CssClass="small fw-bold"></asp:Label>
                        </div>

                    </div>
                </div>
                
            </div>
        </div>
    </div>

</asp:Content>
