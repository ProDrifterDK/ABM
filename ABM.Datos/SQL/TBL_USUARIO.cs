//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ABM.Datos.SQL
{
    using System;
    using System.Collections.Generic;
    
    public partial class TBL_USUARIO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TBL_USUARIO()
        {
            this.TBL_LISTA_COMPRA = new HashSet<TBL_LISTA_COMPRA>();
            this.TBL_ORDEN_STOCK = new HashSet<TBL_ORDEN_STOCK>();
            this.TBL_RECEPCION = new HashSet<TBL_RECEPCION>();
        }
    
        public int usu_id { get; set; }
        public string usu_nombre { get; set; }
        public string usu_rut { get; set; }
        public string usu_telefono { get; set; }
        public string usu_correo { get; set; }
        public Nullable<int> rol_id { get; set; }
        public string usu_clave { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TBL_LISTA_COMPRA> TBL_LISTA_COMPRA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TBL_ORDEN_STOCK> TBL_ORDEN_STOCK { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TBL_RECEPCION> TBL_RECEPCION { get; set; }
        public virtual TBL_ROL TBL_ROL { get; set; }
    }
}
