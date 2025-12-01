using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using GestorWeb.Models;

namespace GestorWeb.DAL
{
    public class PedidosDAL
    {
        private string cadena = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        // =============== LISTAR TODOS ==================
        public List<Pedido> Listar()
        {
            List<Pedido> lista = new List<Pedido>();

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Pedidos ORDER BY Fecha_Recepcion DESC", cn);
                cn.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Pedido()
                    {
                        Id_Pedido = Convert.ToInt32(dr["Id_Pedido"]),
                        Numero = Convert.ToInt32(dr["Numero"]),
                        Nombre_Cliente = dr["Nombre_Cliente"].ToString(),
                        Fecha_Recepcion = Convert.ToDateTime(dr["Fecha_Recepcion"]),
                        Entregado = Convert.ToBoolean(dr["Entregado"])
                    });
                }
            }

            return lista;
        }

        // =============== AGREGAR ==================
        public void Agregar(Pedido p)
        {
            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand(@"
                    INSERT INTO Pedidos(Numero, Nombre_Cliente, Fecha_Recepcion, Entregado)
                    VALUES(@Numero, @Nombre_Cliente, @Fecha_Recepcion, @Entregado)", cn);

                cmd.Parameters.AddWithValue("@Numero", p.Numero);
                cmd.Parameters.AddWithValue("@Nombre_Cliente", p.Nombre_Cliente);
                cmd.Parameters.AddWithValue("@Fecha_Recepcion", p.Fecha_Recepcion);
                cmd.Parameters.AddWithValue("@Entregado", p.Entregado);

                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // =============== OBTENER POR ID ==================
        public Pedido Obtener(int id)
        {
            Pedido p = null;

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Pedidos WHERE Id_Pedido=@id", cn);
                cmd.Parameters.AddWithValue("@id", id);
                cn.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    p = new Pedido()
                    {
                        Id_Pedido = Convert.ToInt32(dr["Id_Pedido"]),
                        Numero = Convert.ToInt32(dr["Numero"]),
                        Nombre_Cliente = dr["Nombre_Cliente"].ToString(),
                        Fecha_Recepcion = Convert.ToDateTime(dr["Fecha_Recepcion"]),
                        Entregado = Convert.ToBoolean(dr["Entregado"])
                    };
                }
            }

            return p;
        }

        // =============== EDITAR ==================
        public void Editar(Pedido p)
        {
            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand(@"
                    UPDATE Pedidos SET
                        Numero=@Numero,
                        Nombre_Cliente=@Nombre_Cliente,
                        Fecha_Recepcion=@Fecha_Recepcion,
                        Entregado=@Entregado
                    WHERE Id_Pedido=@Id", cn);

                cmd.Parameters.AddWithValue("@Id", p.Id_Pedido);
                cmd.Parameters.AddWithValue("@Numero", p.Numero);
                cmd.Parameters.AddWithValue("@Nombre_Cliente", p.Nombre_Cliente);
                cmd.Parameters.AddWithValue("@Fecha_Recepcion", p.Fecha_Recepcion);
                cmd.Parameters.AddWithValue("@Entregado", p.Entregado);

                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // =============== ELIMINAR ==================
        public void Eliminar(int id)
        {
            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Pedidos WHERE Id_Pedido=@id", cn);
                cmd.Parameters.AddWithValue("@id", id);

                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // =============== ENTREGAR ==================
        public void MarcarComoEntregado(int id)
        {
            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Pedidos SET Entregado=1 WHERE Id_Pedido=@id", cn);

                cmd.Parameters.AddWithValue("@id", id);
                cn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}

