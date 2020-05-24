namespace OnMuhasebeProgrami.WebUI.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MusteriTedarikci")]
    public partial class MusteriTedarikci
    {
        public int Id { get; set; }

        public string Ad { get; set; }

        public string Soyad { get; set; }

        public string Adres { get; set; }

        public string Il { get; set; }

        public string Ilce { get; set; }

        public string Telefon { get; set; }

        public string VKNTCKN { get; set; }

        public string VergiDairesi { get; set; }
    }
}
