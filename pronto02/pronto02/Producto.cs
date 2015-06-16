using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pronto02
{
    public class Producto
    {
        #region ATRIBUTO
        private decimal cod_barras;
        private String nombre;
        private Categoria categoria;
        private decimal precio_costo;
        private decimal precio_venta;
        private decimal ganancia;
        private decimal stock;
        #endregion

        #region CONSTRUCTOR
        public Producto(decimal cod_barras, String nombre, Categoria categoria, decimal precio_costo, decimal precio_venta, decimal stock)
        {
            this.cod_barras = cod_barras;
            this.nombre = nombre;
            this.categoria = categoria;
            this.precio_costo = precio_costo;
            this.precio_venta = precio_venta;
            this.ganancia = precio_venta - precio_costo;
            this.stock = stock;
        }
        #endregion

        #region METODO
        private void calcular_ganancia()
        {
            this.ganancia = this.precio_venta - this.precio_costo;
        }
        #endregion

        #region PROPIEDAD
        public decimal CodigoDeBarras
        {
            get
            {
                return this.cod_barras;
            }
            private set
            {
                this.cod_barras = value;
            }
        }

        public String Nombre
        {
            get
            {
                return this.nombre;
            }
            private set
            {
                this.nombre = value;
            }
        }

        public Categoria Categoria
        {
            get
            {
                return this.categoria;
            }
            private set
            {
                this.categoria = value;
            }
        }

        public decimal Precio_Costo
        {
            get
            {
                return this.precio_costo;
            }
            private set
            {
                this.precio_costo = value;
            }
        }
        public decimal Precio_Venta
        {
            get
            {
                return this.precio_venta;
            }
            private set
            {
                this.precio_venta = value;
            }
        }
        public decimal Ganancia
        {
            get
            {
                return this.ganancia;
            }
            private set
            {
                this.ganancia = value;
            }
        }
        public decimal Stock
        {
            get
            {
                return this.stock;
            }
            private set
            {
                this.stock = value;
            }
        }

        #endregion
    }
}