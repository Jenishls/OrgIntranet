using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
/// <summary>
/// Summary description for BLLCircular
/// </summary>
public class BLLCircular
{

	public BLLCircular()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int insertCircular(int year, String type, String cirNo, String subject, String filename, String username)
    {
        SqlParameter[] param = new SqlParameter[]
        {
           new SqlParameter("@year",year),
             new SqlParameter("@type",type),
              new SqlParameter("@cirNo",cirNo),
              new SqlParameter("@subject",subject),
              new SqlParameter("@filename",filename),
              new SqlParameter("@username",username),
        };
        return DAO.IUD(param, "insert into Circular(Year, Type, CirNo, Subject, Filename, Username) values(@year, @type,@cirNo, @subject, @filename,@username)", CommandType.Text);
    }

    public DataTable GetAllCircular(String type, String year)
    {

        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@year",year),
            new SqlParameter("@type", type)
        };
        DataTable dt = DAO.GetTable(param, @"
                    SELECT * from Circular where Type = @type and Year = @year order by Id DESC", CommandType.Text);
        return dt;
    }

    public DataTable GetMainCircularList()
    {
        DataTable dt = DAO.GetTable(null, @"
                    select Year,'Type'= Case when Type='O' then 'Office Instruction Memo'
                    when Type='A' then 'Administration Circular'
                    else 'Unknown' end ,
                    Type as SType,
                    count('Year') 
                    from Circular
                    group by Year, Type", CommandType.Text);

        return dt;
    }

    public string SendMail(string Subject, string Body)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add("jenish.shrestha@nccbank.com.np");
            mailMessage.From = new MailAddress("hrd@nccbank.com.np");
            mailMessage.Subject = Subject;
            mailMessage.Body = Body;
            SmtpClient smtpClient = new SmtpClient("192.168.100.2");
            smtpClient.Send(mailMessage);
            return ("E-mail sent!");
        }
        catch (Exception ex)
        {
            return ("Could not send the e-mail - error: " + ex.Message);
        }
    }
}