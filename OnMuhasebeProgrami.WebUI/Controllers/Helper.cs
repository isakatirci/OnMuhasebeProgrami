using System;
using System.Globalization;

namespace OnMuhasebeProgrami.WebUI.Controllers
{
    internal class Helper
    {
        internal static int? IntParse(string str)
        {
            return (int)DecimalParse(str);
        }

        internal static decimal? DecimalParse(string str)
        {
            decimal value;
            Decimal.TryParse(str, NumberStyles.Any, CultureInfo.InvariantCulture, out value);
            return value;
        }

        internal static DateTime? DateTimeParse(string str)
        {
            DateTime value;
            DateTime.TryParseExact(str, new string[] { "dd/mm/yyyy", "dd.mm.yyyy" }, null, DateTimeStyles.AllowWhiteSpaces, out value);
            return value;
        }
    }
}