using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pronto02
{
    public partial class Linea_Venta
    {
        #region ATRIBUTOS
        private String nombre_producto;
        private int unidades;
        private float precio;
        private float subtotal;
        #endregion

        #region METODOS
        public Linea_Venta(string np, int u, float p)
        {
            this.nombre_producto = np;
            this.unidades = u;
            this.precio = p;
            this.subtotal = u * p;
        }
        public Linea_Venta(){
        }
        #endregion

        #region PROPIEDADES
        public String Nombre_Producto
        {
            get
            {
                return this.nombre_producto;
            }
            set
            {
                this.nombre_producto = value;
            }
        }

        public int Unidades
        {
            get
            {
                return this.unidades;
            }
            set
            {
                this.unidades = value;
                this.subtotal = unidades * precio;
            }
        }

        public float Precio
        {
            get
            {
                return this.precio;
            }
            set
            {
                this.precio = value;
                this.subtotal = unidades * precio;
            }
        }

        public float Subtotal
        {
            get
            {
                return this.subtotal;
            }               
        }
        #endregion
    }
}