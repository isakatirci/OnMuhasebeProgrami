namespace OnMuhasebeProgrami.WebUI.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Fatura")]
    public partial class Fatura
    {
        public int Id { get; set; }

        public string FaturaAciklamasi { get; set; }

        public int? MusteriId { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? DuzenlenmeTarihi { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? TahsilatTarihi { get; set; }

        public string FaturaNoSeri { get; set; }

        public string FaturaNoSira { get; set; }
    }
}
