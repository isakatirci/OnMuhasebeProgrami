using System;
using System.Collections.Generic;
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
    }
}