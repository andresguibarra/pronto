//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace pronto02
{
    using System;
    using System.Collections.Generic;
    
    public partial class PRODUCTO
    {
        public decimal Id { get; set; }
        public string cod_barras { get; set; }
        public string Nombre { get; set; }
        public decimal Precio_costo { get; set; }
        public decimal Precio_venta { get; set; }
        public decimal Ganancia { get; set; }
        public decimal Stock { get; set; }
        public Nullable<decimal> Precio_Mayor { get; set; }
        public string IdPrioridad { get; set; }
    
        public virtual CATEGORIA CATEGORIA { get; set; }
    }
}
