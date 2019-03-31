using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EmiCalculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btncalculate_Click(object sender, EventArgs e)
    {
        {
            double LoanAmount = 0;
            double Payment = 0;
            double InterestRate = 0;
            int PaymentPeriods = 0;
            try
            {
                InterestRate = Convert.ToDouble(txtRate.Text);
                PaymentPeriods = Convert.ToInt16(Convert.ToDouble(txtTime.Text) * 12);
                LoanAmount = Convert.ToDouble(txtLoan.Text);
                if (InterestRate > 1)
                {
                    InterestRate = InterestRate / 100;
                }
                Payment = (LoanAmount * Math.Pow((InterestRate / 12) + 1,
                          (PaymentPeriods)) * InterestRate / 12) / (Math.Pow
                          (InterestRate / 12 + 1, (PaymentPeriods)) - 1);
                lblMonthlyPayment.Text = "Rs.:" + Payment.ToString("N2");
            }
            catch
            {

            }

        }
    }

    protected void btnreset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/EmiCalculator.aspx");
    }
}