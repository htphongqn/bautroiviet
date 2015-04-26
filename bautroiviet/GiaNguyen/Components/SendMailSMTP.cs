using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Net.Configuration;
using System.Configuration;
using vpro.functions;
using System.Text;
using Model;

namespace GiaNguyen.Components
{
    public class SendMailSMTP
    {
        //private dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        private SmtpClient MailClient = new SmtpClient();

        public void SendMailAll(string recipientin, string ccAddress, string subject, string message, string displayname)
        {
            try
            {
                string emailDomain = "thvvietnam.vn";

                MailAddress source = new MailAddress("no-reply@" + emailDomain, displayname);
                MailAddress recipient = new MailAddress(recipientin);

                MailMessage msg = new MailMessage();

                msg.From = source;
                msg.To.Add(recipient);
                if (ccAddress != "")
                {
                    msg.CC.Add(ccAddress);
                }
                //if (bccAddress != "")
                //{
                //    mail.Bcc.Add(bccAddress);
                //}
                msg.Subject = subject;
                msg.Body = message;
                msg.IsBodyHtml = true;

                MailClient.Send(msg);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw ex;
            }
        }
        //public ESHOP_EMAILTEMPLATE getEmailTemplateByCode(string code, int lang)
        //{
        //    try
        //    {
        //        ESHOP_EMAILTEMPLATE item = db.ESHOP_EMAILTEMPLATEs.SingleOrDefault(n => n.CODE == code && n.LANGUAGE == lang);
        //        return item;
        //    }
        //    catch
        //    {

        //        return null;
        //    }
            
        //}
    }
}