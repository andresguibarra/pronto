using System;

public class EstadoProducto
{
    private String nombre;
    private String estado;
    private int codbarras;
    private int stock;
    private int cantidad_minima;
    private int cantidad_media;
	public EstadoProducto(String p, int s, int cb, int cm, int cmed)
	{
        nombre = p;
        stock = s;
        codbarras = cb;
        cantidad_minima = cm;
        cantidad_media = cmed;
        obtener_Estado();
	}
    private void obtener_Estado()
    {
        if (this.stock <= cantidad_minima)
            this.estado = "CRITICO";
        else if (this.stock <= cantidad_media)
            this.estado = "ADVERTENCIA";
        else
            this.estado = "TODO BIEN";
    }

    public String Nombre
    {
        get { return nombre; }
    }
    public String Estado
    {
        get { return estado; }
    }
    public int cod_barras
    {
        get { return codbarras; }
    }
    public int Stock
    {
        get { return stock; }
    }
}
