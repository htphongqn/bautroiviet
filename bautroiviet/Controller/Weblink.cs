using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;

namespace Controller
{
    public class Weblink
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        //public List<ESHOP_WEBLINK> Loadweblink()
        //{
        //    try
        //    {
        //        var list = db.ESHOP_WEBLINKs.ToList();
        //        return list;
        //    }
        //    catch (Exception)
        //    {
                
        //        throw;
        //    }
        //}
        public List<ESHOP_WEBLINK> LoadWeblink(int position, string lang)
        {
            try
            {
                int _iLang = -1;
                switch (lang)
                {
                    case "VN": _iLang = 1;
                        break;
                    case "EN": _iLang = 2;
                        break;
                    default: _iLang = -1;
                        break;
                }
                var list = db.ESHOP_WEBLINKs.Where(o => (o.WEBSITE_LINKS_LANGUAGE == _iLang || _iLang == -1) /*&& (o.WEBSITE_LINKS_POSITION == position || position == -1)*/).OrderByDescending(o => o.WEBSITE_LINKS_ORDER).ToList();
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
    }
}
