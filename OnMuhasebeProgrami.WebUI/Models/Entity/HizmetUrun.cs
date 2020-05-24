namespace OnMuhasebeProgrami.WebUI.Models.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HizmetUrun")]
    public partial class HizmetUrun
    {
        public int Id { get; set; }

        public string Ad { get; set; }
    }
}
