using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace pronto02
{
    public class Categoria
    {
        #region ATRIBUTO
        private int id;
        private String nombre;
        #endregion

        #region CONSTRUCTOR
        public Categoria(int id, String nombre)
        {
            this.id = id;
            this.nombre = nombre;
        }
        #endregion

        #region METODO
        public void Alta(){
            
        }

        public void Baja(){

        }

        public void Modificar(){

        }
        #endregion

        #region PROPIEDAD
        public int ID
        {
            get
            {
                return this.id;
            }
            private set
            {
                this.id = value;
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
        #endregion
    }
}