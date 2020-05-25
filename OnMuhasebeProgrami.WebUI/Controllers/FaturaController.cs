using Newtonsoft.Json;
using OnMuhasebeProgrami.WebUI.Models;
using OnMuhasebeProgrami.WebUI.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnMuhasebeProgrami.WebUI.Controllers
{
    public class FaturaController : Controller
    {
        // GET: Fatura
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Ekle()
        {
            return View();
        }

        public ActionResult MusteriTedarikciAra(string q)
        {
            var list = new List<Select2Model>();
            using (OnMuhasebeUygulamasiDb db = new OnMuhasebeUygulamasiDb())
            {
                if (!(string.IsNullOrEmpty(q) || string.IsNullOrWhiteSpace(q)))
                {
                    list.AddRange(db.MusteriTedarikci.Where(x => (x.Ad + " " + x.Soyad).ToLower().Contains(q.ToLower())).ToList().Select(y =>
                    {
                        return new Select2Model
                        {
                            id = y.Id.ToString(),
                            text = y.Ad + " " + y.Soyad
                        };
                    }));
                }
            }
            return Json(new { items = list }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult HizmetUrunAra(string q)
        {
            var list = new List<Select2Model>();
            using (OnMuhasebeUygulamasiDb db = new OnMuhasebeUygulamasiDb())
            {
                if (!(string.IsNullOrEmpty(q) || string.IsNullOrWhiteSpace(q)))
                {
                    list.AddRange(db.HizmetUrun.Where(x => x.Ad.ToLower().Contains(q.ToLower())).ToList().Select(y =>
                    {
                        return new Select2Model
                        {
                            id = y.Id.ToString(),
                            text = y.Ad
                        };
                    }));
                }
            }
            return Json(new { items = list }, JsonRequestBehavior.AllowGet);
        }

        public String KalemleriKaydet(String jsonData)
        {
            Dictionary<string, string> fields = JsonConvert.DeserializeObject<Dictionary<string, string>>(jsonData);

            Fatura faturaEkleme = new Fatura();            
            var faturaEklemeKalemlerKeys = fields.Keys.Where(x => x.Trim().StartsWith("FaturaEklemeKalem"));


            List<FaturaKalemleri> faturaEklemeKalemler = new List<FaturaKalemleri>();
            for (int i = 0, length= (int)Math.Ceiling(faturaEklemeKalemlerKeys.Count() / 5m); i < length ; i++)
            {
                FaturaKalemleri faturaKalem = new FaturaKalemleri();
                InvokeKalem(faturaKalem, (kalem) =>
                {
                    var i1 = i;
                    faturaKalem.HizmetUrunId = Helper.IntParse(fields["FaturaEklemeKalem[" + i1 + "][HizmetUrun]"]);
                });
                InvokeKalem(faturaKalem, (kalem) =>
                {
                    var i1 = i;
                    faturaKalem.Miktar = Helper.DecimalParse(fields["FaturaEklemeKalem[" + i1 + "][Miktar]"]);
                });
                InvokeKalem(faturaKalem, (kalem) =>
                {
                    var i1 = i;
                    faturaKalem.BirimFiyat = Helper.DecimalParse(fields["FaturaEklemeKalem[" + i1 + "][BirimFiyat]"]);
                });
                InvokeKalem(faturaKalem, (kalem) =>
                {
                    var i1 = i;
                    faturaKalem.Vergi = Helper.DecimalParse(fields["FaturaEklemeKalem[" + i1 + "][Vergi]"]);
                });
                InvokeKalem(faturaKalem, (kalem) =>
                {
                    var i1 = i;
                    faturaKalem.Toplam = Helper.DecimalParse(fields["FaturaEklemeKalem[" + i1 + "][Toplam]"]);
                });
                faturaEklemeKalemler.Add(faturaKalem);
            }

            InvokeFatura(faturaEkleme, (fatura) =>
            {
                fatura.MusteriId = Helper.IntParse(fields["Musteri"]);
            });

            InvokeFatura(faturaEkleme, (fatura) =>
            {
                fatura.FaturaAciklamasi = fields["FaturaAciklamasi"];
            });

            InvokeFatura(faturaEkleme, (fatura) =>
            {
                fatura.DuzenlenmeTarihi = Helper.DateTimeParse(fields["DuzenlemeTarihi"]);
            });

            InvokeFatura(faturaEkleme, (fatura) =>
            {
                fatura.TahsilatTarihi = Helper.DateTimeParse(fields["TahsilatTarihi"]);
            });

            using (OnMuhasebeUygulamasiDb db = new OnMuhasebeUygulamasiDb())
            {
                db.Fatura.Add(faturaEkleme);
                db.SaveChanges();
                for (int i = 0, length = faturaEklemeKalemler.Count(); i <length ; i++)
                {
                    faturaEklemeKalemler[i].FaturaId = faturaEkleme.Id;
                    db.FaturaKalemleri.Add(faturaEklemeKalemler[i]);
                }
                db.SaveChanges();
            }
            
            return "Fatura Eklendi";
        }

        private void InvokeKalem(FaturaKalemleri kalem, Action<FaturaKalemleri> action)
        {
            try
            {
                action(kalem);
            }
            catch (Exception ex)
            {

            }
        }
        private void InvokeFatura(Fatura faturaEkleme, Action<Fatura> action)
        {
            try
            {
                action(faturaEkleme);
            }
            catch (Exception ex)
            {

            }
        }
    }
}