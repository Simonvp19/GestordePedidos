<%@ Page Title="Pedidos Pendientes" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="PedidosPendientes.aspx.cs" Inherits="GestorWeb.PedidosPendientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container py-4">
        <h1 class="mb-4">📋 Pedidos Pendientes</h1>

        <asp:UpdatePanel ID="updGrid" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                
                <div class="d-flex justify-content-end mb-3">
                    <asp:HyperLink NavigateUrl="PedidosForm.aspx" Text="Registrar Nuevo Paquete" CssClass="btn btn-success" runat="server" />
                </div>
                
                <asp:GridView ID="gridPedidos" runat="server" 
                    AutoGenerateColumns="False" 
                    CssClass="table table-hover table-striped"
                    DataKeyNames="Id_Pedido" 
                    OnRowCommand="gridPedidos_RowCommand">
                    
                    <Columns>
                        <asp:BoundField DataField="Numero" HeaderText="Número" SortExpression="Numero" />
                        <asp:BoundField DataField="Nombre_Cliente" HeaderText="Cliente" SortExpression="Nombre_Cliente" />
                        <asp:BoundField DataField="Fecha_Recepcion" HeaderText="Recepción" DataFormatString="{0:d}" />
                        
                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                
                                <asp:Button ID="btnEditar" runat="server" CommandName="Editar" CommandArgument='<%# Eval("Id_Pedido") %>' Text="Editar" CssClass="btn btn-sm btn-info me-2" />
                                
                                <asp:Button ID="btnEntregar" runat="server" CommandName="Entregar" CommandArgument='<%# Eval("Id_Pedido") %>' Text="Entregar" CssClass="btn btn-sm btn-success me-2" />
                                
                                <asp:LinkButton ID="btnEliminar" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("Id_Pedido") %>' Text="Eliminar" CssClass="btn btn-sm btn-outline-danger" 
                                    OnClientClick='<%# "return confirm(\"¿Estás seguro de eliminar el pedido #" + Eval("Numero") + "?\");" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <asp:UpdatePanel ID="updConfirmacion" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <asp:HiddenField ID="hfIdPedido" runat="server" Value="0" />
            <asp:Label ID="lblDummy" runat="server" Visible="false" /> 
            
            <div class="modal fade" id="modalConfirmarEntrega" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirmar Entrega</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p class="small text-muted">Confirme el número de pedido y el cliente para finalizar la entrega.</p>
                            
                            <div class="mb-3">
                                <label class="form-label small fw-bold">Número de Pedido:</label>
                                <asp:TextBox ID="txtConfirmNumero" runat="server" CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold">Nombre del Cliente:</label>
                                <asp:TextBox ID="txtConfirmCliente" runat="server" CssClass="form-control" />
                            </div>

                            <asp:Label ID="lblError" runat="server" ForeColor="Red" CssClass="small fw-bold"></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            
                            <asp:Button ID="btnConfirmarEntrega" runat="server" OnClick="btnConfirmarEntrega_Click" Text="Marcar como Entregado" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
            
        </ContentTemplate>
    </asp:UpdatePanel>

   <script type="text/javascript">
       // Función de apertura (llamada desde C#)
       function abrirModal(modalId) {
           var modalElement = document.getElementById(modalId);
           if (modalElement) {
               var modal = new bootstrap.Modal(modalElement);
               modal.show();
           }
       }

       // FIX DEFINITIVO DE CONGELAMIENTO: Oculta el modal directamente
       function cerrarModal(modalId) {
           var modalElement = document.getElementById(modalId);
           if (modalElement) {
               // Oculta el modal usando la función nativa de Bootstrap
               var modal = bootstrap.Modal.getInstance(modalElement);
               if (!modal) {
                   // Si la instancia no existe, la creamos y la cerramos
                   modal = new bootstrap.Modal(modalElement);
               }
               modal.hide();

               // Opcional: Remueve la clase 'modal-open' del body para asegurar que el scroll vuelva
               document.body.classList.remove('modal-open');
               document.body.style.overflow = '';
           }
       }

       // Limpiar al cerrar el modal (Buena práctica de limpieza)
       var modal = document.getElementById('modalConfirmarEntrega');
       if (modal) {
           modal.addEventListener('hidden.bs.modal', function (event) {
               // Limpiar campos para la próxima apertura
               document.getElementById('<%= hfIdPedido.ClientID %>').value = '0';
            document.getElementById('<%= lblError.ClientID %>').innerHTML = '';
            var txtNum = document.getElementById('<%= txtConfirmNumero.ClientID %>');
            var txtCli = document.getElementById('<%= txtConfirmCliente.ClientID %>');
            if (txtNum) txtNum.value = '';
            if (txtCli) txtCli.value = '';
        });
       }
   </script>
</asp:Content>