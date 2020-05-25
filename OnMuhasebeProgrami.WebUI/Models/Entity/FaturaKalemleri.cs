namespace OnMuhasebeProgrami.WebUI.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FaturaKalemleri")]
    public partial class FaturaKalemleri
    {
        public int Id { get; set; }

        public int? FaturaId { get; set; }

        public int? HizmetUrunId { get; set; }

        public decimal? Miktar { get; set; }

        public decimal? BirimFiyat { get; set; }
        public decimal? Vergi { get; set; }

        public decimal? KDV { get; set; }
        public string Toplam { get; internal set; }
    }
}
