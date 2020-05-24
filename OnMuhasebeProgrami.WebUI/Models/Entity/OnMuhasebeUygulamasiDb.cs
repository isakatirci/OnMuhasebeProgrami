namespace OnMuhasebeProgrami.WebUI.Models.Entity
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class OnMuhasebeUygulamasiDb : DbContext
    {
        public OnMuhasebeUygulamasiDb()
            : base("name=OnMuhasebeUygulamasiDb")
        {
        }

        public virtual DbSet<Fatura> Fatura { get; set; }
        public virtual DbSet<FaturaKalemleri> FaturaKalemleri { get; set; }
        public virtual DbSet<FaturaKategori> FaturaKategori { get; set; }
        public virtual DbSet<HizmetUrun> HizmetUrun { get; set; }
        public virtual DbSet<MusteriTedarikci> MusteriTedarikci { get; set; }
        public virtual DbSet<FaturaEtiket> FaturaEtiket { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FaturaKalemleri>()
                .Property(e => e.Miktar)
                .HasPrecision(18, 6);

            modelBuilder.Entity<FaturaKalemleri>()
                .Property(e => e.BirimFiyat)
                .HasPrecision(18, 6);

            modelBuilder.Entity<FaturaKalemleri>()
                .Property(e => e.KDV)
                .HasPrecision(18, 6);
        }
    }
}
