using System;

public class EstadoProducto
{
    private String producto;
    private String estado;
    private int codigo_barras;
    private int stock;
    private PRIORIDAD prioridad;
	public EstadoProducto(String p, int s, int cb, PRIORIDAD pr)
	{
        producto = p;
        stock = s;
        codigo_barras = cb;
        prioridad = pr;
        obtener_Estado();
	}

    public String Producto{
        get { return producto; }
    }

    public String Estado
    {
        get { return estado; }
    }
    public int Codigo_Barras
    {
        get { return codigo_barras; }
    }
    public int Stock
    {
        get { return stock; }
    }

    private void obtener_Estado()
    {
        if (this.stock <= prioridad.cantidadMinima)
            this.estado = "CRITICO";
        else if (this.stock <= prioridad.cantidadMedia)
            this.estado = "ADVERTENCIA";
        else
            this.estado = "TODO BIEN";
    }
}
