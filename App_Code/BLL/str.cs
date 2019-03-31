using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class str
{
    //If you need it then here is SQLi preventation-- by Preeti Kumari @ C# corner
    public static Boolean checkSQLI(string userInput)
    {
        bool isSQLInjection = false;
        string[] sqlCheckList = { "--",";--",";","/*","*/","@@","@","char","nchar","varchar","nvarchar", "alter", "begin", "cast", "create", "cursor", "declare", "delete", "drop", "end", "exec", "execute", "fetch",      "insert",   "kill",       "select",     "sys",      "sysobjects",      "syscolumns",     "table",     "update" };

        string CheckString = userInput.Replace("'", "''");
        for (int i = 0; i <= sqlCheckList.Length - 1; i++)
        {
            if ((CheckString.IndexOf(sqlCheckList[i],StringComparison.OrdinalIgnoreCase) >= 0))
            {
                isSQLInjection = true; 
            }
        }
        return isSQLInjection;
    }

    public static Boolean checkSpace(string a)
    {
        bool b=false;
        if (a != string.Empty && a != "" && a != null && !a.Contains(" "))
        {
            b = true;
        }
        return b;


    }
}
