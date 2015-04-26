using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Web;
using System.Web.UI;
using vpro.functions;

namespace Controller
{
    public class Account
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public  bool Login(string Email, string MatKhau)
        {
            var dangnhap = from a in db.ESHOP_CUSTOMERs
                           where a.CUSTOMER_EMAIL == Email && a.CUSTOMER_PW == MatKhau
                           select a;
            if (dangnhap.ToList().Count > 0)
            {
                Load_All_Cuss(Email);
                return true;
            }
            else
                return false;
        }
        public void Load_All_Cuss(string email)
        {
            try
            {
                var _cus = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_EMAIL == email);
                if (_cus.ToList().Count > 0)
                {
                    HttpContext.Current.Session["User_Name"] = _cus.ToList()[0].CUSTOMER_FULLNAME;
                    HttpContext.Current.Session["User_ID"] = _cus.ToList()[0].CUSTOMER_ID;
                    HttpContext.Current.Session["User_Phone"] = _cus.ToList()[0].CUSTOMER_PHONE1;
                    HttpContext.Current.Session["User_Email"] = _cus.ToList()[0].CUSTOMER_EMAIL;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public bool Check_email(string _email)
        {
            try
            {
                var _user = db.GetTable<ESHOP_CUSTOMER>().Where(u => u.CUSTOMER_EMAIL == _email.Trim());

                if (_user.ToList().Count > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return true;
            }
        }
        public ESHOP_CUSTOMER getById(int ID)
        {
            try
            {
                var _user = db.GetTable<ESHOP_CUSTOMER>().Single(u => u.CUSTOMER_ID == ID);

                return _user;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public bool Check_username(string username)
        {
            try
            {
                var _user = db.GetTable<ESHOP_CUSTOMER>().Where(u => u.CUSTOMER_UN == username.Trim());

                if (_user.ToList().Count > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return true;
            }
        }
        public int Doimatkhau(int userId, string pass)
        {
            try
            {
                ESHOP_CUSTOMER user = getById(userId);
                if (user != null)
                {
                    user.CUSTOMER_PW = pass;
                    user.CUSTOMER_UPDATE = DateTime.Now;

                    db.SubmitChanges();
                    return 1;
                }
                return 0;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return 0;
            }
        }   
        public bool Register(string _sFullName, DateTime ngaysinh, string _Address, string _Phone, string cityId, string _Pass, string _Email)
        {
            try
            {
                ESHOP_CUSTOMER user = new ESHOP_CUSTOMER();

                user.CUSTOMER_FULLNAME = _sFullName;
                if(ngaysinh != DateTime.MinValue)
                    user.CUSTOMER_BIRTHDAY = ngaysinh;
                user.CUSTOMER_ADDRESS = _Address;
                user.CUSTOMER_PHONE1 = _Phone;
                user.CUSTOMER_FIELD1 = cityId;

                user.CUSTOMER_PW = _Pass;
                user.CUSTOMER_EMAIL = _Email;
                user.CUSTOMER_PUBLISHDATE = DateTime.Now;
                user.CUSTOMER_SHOWTYPE = 1;
                db.ESHOP_CUSTOMERs.InsertOnSubmit(user);
                db.SubmitChanges();
                Load_All_Cuss(_Email);
                return true;
            }
            catch (Exception)
            {

                return false;
            }
                
            
        }
        public int updateCustomerNTV(int userId, string fullname, DateTime birthday, string phone, string email, string yahoo, string skype, string facebook)
        {
            try
            {
                ESHOP_CUSTOMER user = getById(userId);
                if (user != null)
                {
                    user.CUSTOMER_FULLNAME = fullname;
                    user.CUSTOMER_BIRTHDAY = birthday;
                    user.CUSTOMER_PHONE1 = phone;
                    user.CUSTOMER_EMAIL = email;
                    user.CUSTOMER_FIELD1 = yahoo;
                    user.CUSTOMER_FIELD2 = skype;
                    user.CUSTOMER_FIELD3 = facebook;

                    user.CUSTOMER_PUBLISHDATE = DateTime.Now;

                    db.SubmitChanges();
                    return 1;
                }
                return 0;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return 0;
            }
        }
        public List<ESHOP_ORDER> loadHistory(int USER_ID)
        {
            try
            {
                var _cus = (from o in db.ESHOP_ORDERs
                            join o_i in db.ESHOP_ORDER_ITEMs on o.ORDER_ID equals o_i.ORDER_ID
                            where o.CUSTOMER_ID == USER_ID
                            orderby o.ORDER_PUBLISHDATE descending
                            select o).Distinct();
                if (_cus != null)
                    return _cus.ToList();
                return null;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
    }
}
