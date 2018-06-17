using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Activities;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.IO;
using System.Drawing;


public partial class home_sending_mail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }

    protected void load_email(object sender, EventArgs e)
    {
        DataTable dtCustomers = (DataTable)(Session["StdEmail"]);
        Parallel.ForEach(dtCustomers.AsEnumerable(), row =>
        {
            SendEmail(row["Email"].ToString());// subject, string.Format(body, row["NameofTheStudent"]));
        });
    }
    private bool SendEmail(string recipient)
    {
        string subject = TxtSub.Text;
        string body = "Hello {2},<br /><br />please ignore this is a test mail<br /><br />Thanks."+ "http://localhost:26828/WebSite2/home/registration.aspx" ;

        MailMessage mm = new MailMessage("saisrineha@gmail.com", recipient);
        mm.Subject = subject;
        mm.Body = body;
          if (fuAttachment.HasFile)
          {
              string FileName = Path.GetFileName(fuAttachment.PostedFile.FileName);
              mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
          }
        mm.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = "saisrineha@gmail.com";
        NetworkCred.Password = "neha2396";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mm);
        return true;
    }

}
