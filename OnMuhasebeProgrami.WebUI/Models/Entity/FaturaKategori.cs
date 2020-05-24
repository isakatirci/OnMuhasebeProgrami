namespace OnMuhasebeProgrami.WebUI.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FaturaKategori")]
    public partial class FaturaKategori
    {
        public int Id { get; set; }

        public string Ad { get; set; }
    }
}
