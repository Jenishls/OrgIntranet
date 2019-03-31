using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RiskOp : System.Web.UI.Page
{
    DBOpRiskAssess dra = new DBOpRiskAssess();
    DBBranchTable dbt = new DBBranchTable();
    UserTable dusert = new UserTable();
    DBRiskindicators dbri = new DBRiskindicators();
    DBYear dy = new DBYear();
    public string listFilter = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadStep1();
        LoadWizard();

    }

    private void LoadStep1()
    {
        if (!IsPostBack)
        {
            string branch = Session["BranchCode"].ToString();
            //string year = ddlYear.SelectedValue.ToString();
            if (branch == "000")
            {
                DataTable dt = dbt.GetAllBranch();
                ddlBranchCode.DataSource = dt;
                ddlBranchCode.DataValueField = "BranchCode";
                ddlBranchCode.DataTextField = "Branch";
                ddlBranchCode.DataBind();
                ddlBranchCode.Items.Insert(0, "Choose Branch");
            }
            else
            {
                DataTable dt = dbt.GetBranchByBranchCode(branch);
                ddlBranchCode.DataSource = dt;
                ddlBranchCode.DataValueField = "BranchCode";
                ddlBranchCode.DataTextField = "Branch";
                ddlBranchCode.DataBind();

                DataTable dbm = dusert.GetBranchBM(branch);
                if (dbm.Rows.Count > 0)
                {
                    lblBM.Text = dbm.Rows[0]["FullName"].ToString();
                }
                DataTable dty = dy.GetAllYear();
                ddlYear.DataSource = dty;
                ddlYear.DataValueField = "Year";
                ddlYear.DataTextField = "Year";
                ddlYear.DataBind();
                ddlYear.Items.Insert(0, "Choose Year");

                //string year = ddlYear.SelectedItem.Text;
                DataTable dtm = dy.GetRestMonth(branch);
                ddlMonth.DataSource = dtm;
                ddlMonth.DataValueField = "Month";
                ddlMonth.DataTextField = "Month";
                ddlMonth.DataBind();
                ddlMonth.Items.Insert(0, "Choose Month");

            }
        }

    }

    private void LoadWizard()
    {
        if (!IsPostBack)
        {
            string idA1 = "A1";
            DataTable dria1 = dbri.GetIndicatorByRId(idA1);

            //string id = "";
            //string rid = "";
            //DataTable dria1 = dbri.GetIndicatorByRId(id);
            //foreach (DataRow dr in dria1.Rows)
            //{
            //    if (rid == dr["Indicator"].ToString())
            //        id = rid;
            //}
            DataTable drwa1 = dbri.GetWeightByRId(idA1);

            {
                lblGA1.Text = dria1.Rows[0]["Indicator"].ToString();
                lblW1.Text = drwa1.Rows[0]["Weight"].ToString();
                ddlA1.Items.Insert(0, "Choose One");
            }
            string idA2 = "A2";
            DataTable dria2 = dbri.GetIndicatorByRId(idA2);
            DataTable drwa2 = dbri.GetWeightByRId(idA2);
            {

                lblGA2.Text = dria2.Rows[0]["Indicator"].ToString();
                lblW2.Text = drwa2.Rows[0]["Weight"].ToString();
                ddlA2.Items.Insert(0, "Choose One");
            }
            string idA3 = "A3";
            DataTable dria3 = dbri.GetIndicatorByRId(idA3);
            DataTable drwa3 = dbri.GetWeightByRId(idA3);
            {

                lblGA3.Text = dria3.Rows[0]["Indicator"].ToString();
                lblW3.Text = drwa3.Rows[0]["Weight"].ToString();
                ddlA3.Items.Insert(0, "Choose One");
            }
            string idA4 = "A4";
            DataTable dria4 = dbri.GetIndicatorByRId(idA4);
            DataTable drwa4 = dbri.GetWeightByRId(idA4);
            {

                lblGA4.Text = dria4.Rows[0]["Indicator"].ToString();
                lblW4.Text = drwa4.Rows[0]["Weight"].ToString();
                ddlA4.Items.Insert(0, "Choose One");
            }
            //string idA5 = "A5";
            //DataTable dria5 = dbri.GetIndicatorByRId(idA5);
            //DataTable drwa5 = dbri.GetWeightByRId(idA5);
            //{

            //    lblGA5.Text = dria5.Rows[0]["Indicator"].ToString();
            //    lblW5.Text = drwa5.Rows[0]["Weight"].ToString();
            //    ddlA5.Items.Insert(0, "Choose One");
            //}
            string idB1 = "B1";
            DataTable drib1 = dbri.GetIndicatorByRId(idB1);
            DataTable drwb1 = dbri.GetWeightByRId(idB1);
            {

                lblGB1.Text = drib1.Rows[0]["Indicator"].ToString();
                lblWB1.Text = drwb1.Rows[0]["Weight"].ToString();
                ddlB1.Items.Insert(0, "Choose One");
            }
            string idB2 = "B2";
            DataTable drib2 = dbri.GetIndicatorByRId(idB2);
            DataTable drwb2 = dbri.GetWeightByRId(idB2);
            {

                lblGB2.Text = drib2.Rows[0]["Indicator"].ToString();
                lblWB2.Text = drwb2.Rows[0]["Weight"].ToString();
                ddlB2.Items.Insert(0, "Choose One");
            }
            string idB3 = "B3";
            DataTable drib3 = dbri.GetIndicatorByRId(idB3);
            DataTable drwb3 = dbri.GetWeightByRId(idB3);
            {

                lblGB3.Text = drib3.Rows[0]["Indicator"].ToString();
                lblWB3.Text = drwb3.Rows[0]["Weight"].ToString();
                ddlB3.Items.Insert(0, "Choose One");
            }
            string idB4 = "B4";
            DataTable drib4 = dbri.GetIndicatorByRId(idB4);
            DataTable drwb4 = dbri.GetWeightByRId(idB4);
            {

                lblGB4.Text = drib4.Rows[0]["Indicator"].ToString();
                lblWB4.Text = drwb4.Rows[0]["Weight"].ToString();
                ddlB4.Items.Insert(0, "Choose One");
            }
            string idB5 = "B5";
            DataTable drib5 = dbri.GetIndicatorByRId(idB5);
            DataTable drwb5 = dbri.GetWeightByRId(idB5);
            {

                lblGB5.Text = drib5.Rows[0]["Indicator"].ToString();
                lblWB5.Text = drwb5.Rows[0]["Weight"].ToString();
                ddlB5.Items.Insert(0, "Choose One");
            }
            string idC1 = "C1";
            DataTable dric1 = dbri.GetIndicatorByRId(idC1);
            DataTable drwc1 = dbri.GetWeightByRId(idC1);
            {

                lblGC1.Text = dric1.Rows[0]["Indicator"].ToString();
                lblWC1.Text = drwc1.Rows[0]["Weight"].ToString();
                ddlC1.Items.Insert(0, "Choose One");
            }
            string idC2 = "C2";
            DataTable dric2 = dbri.GetIndicatorByRId(idC2);
            DataTable drwc2 = dbri.GetWeightByRId(idC2);
            {

                lblGC2.Text = dric2.Rows[0]["Indicator"].ToString();
                lblWC2.Text = drwc2.Rows[0]["Weight"].ToString();
                ddlC2.Items.Insert(0, "Choose One");
            }
            string idC3 = "C3";
            DataTable dric3 = dbri.GetIndicatorByRId(idC3);
            DataTable drwc3 = dbri.GetWeightByRId(idC3);
            {

                lblGC3.Text = dric3.Rows[0]["Indicator"].ToString();
                lblWC3.Text = drwc3.Rows[0]["Weight"].ToString();
                ddlC3.Items.Insert(0, "Choose One");
            }
            string idC4 = "C4";
            DataTable dric4 = dbri.GetIndicatorByRId(idC4);
            DataTable drwc4 = dbri.GetWeightByRId(idC4);
            {

                lblGC4.Text = dric4.Rows[0]["Indicator"].ToString();
                lblWC4.Text = drwc4.Rows[0]["Weight"].ToString();
                ddlC4.Items.Insert(0, "Choose One");
            }
            string idC5 = "C5";
            DataTable dric5 = dbri.GetIndicatorByRId(idC5);
            DataTable drwc5 = dbri.GetWeightByRId(idC5);
            {

                lblGC5.Text = dric5.Rows[0]["Indicator"].ToString();
                lblWC5.Text = drwc5.Rows[0]["Weight"].ToString();
                ddlC5.Items.Insert(0, "Choose One");
            }
            string idC6 = "C6";
            DataTable dric6 = dbri.GetIndicatorByRId(idC6);
            DataTable drwc6 = dbri.GetWeightByRId(idC6);
            {

                lblGC6.Text = dric6.Rows[0]["Indicator"].ToString();
                lblWC6.Text = drwc6.Rows[0]["Weight"].ToString();
                ddlC6.Items.Insert(0, "Choose One");
            }
            //string idC7 = "C7";
            //DataTable dric7 = dbri.GetIndicatorByRId(idC7);
            //DataTable drwc7 = dbri.GetWeightByRId(idC7);
            //{

            //    lblGC7.Text = dric7.Rows[0]["Indicator"].ToString();
            //    lblWC7.Text = drwc7.Rows[0]["Weight"].ToString();
            //    ddlC7.Items.Insert(0, "Choose One");
            //}
            string idD1 = "D1";
            DataTable drid1 = dbri.GetIndicatorByRId(idD1);
            DataTable drwd1 = dbri.GetWeightByRId(idD1);
            {

                lblGD1.Text = drid1.Rows[0]["Indicator"].ToString();
                lblWD1.Text = drwd1.Rows[0]["Weight"].ToString();
                ddlD1.Items.Insert(0, "Choose One");
            }
            string idD2 = "D2";
            DataTable drid2 = dbri.GetIndicatorByRId(idD2);
            DataTable drwd2 = dbri.GetWeightByRId(idD2);
            {

                lblGD2.Text = drid2.Rows[0]["Indicator"].ToString();
                lblWD2.Text = drwd2.Rows[0]["Weight"].ToString();
                ddlD2.Items.Insert(0, "Choose One");
            }
            string idD3 = "D3";
            DataTable drid3 = dbri.GetIndicatorByRId(idD3);
            DataTable drwd3 = dbri.GetWeightByRId(idD3);
            {

                lblGD3.Text = drid3.Rows[0]["Indicator"].ToString();
                lblWD3.Text = drwd3.Rows[0]["Weight"].ToString();
                ddlD3.Items.Insert(0, "Choose One");
            }
            string idD4 = "D4";
            DataTable drid4 = dbri.GetIndicatorByRId(idD4);
            DataTable drwd4 = dbri.GetWeightByRId(idD4);
            {

                lblGD4.Text = drid4.Rows[0]["Indicator"].ToString();
                lblWD4.Text = drwd4.Rows[0]["Weight"].ToString();
                ddlD4.Items.Insert(0, "Choose One");
            }
            string idD5 = "D5";
            DataTable drid5 = dbri.GetIndicatorByRId(idD5);
            DataTable drwd5 = dbri.GetWeightByRId(idD5);
            {

                lblGD5.Text = drid5.Rows[0]["Indicator"].ToString();
                lblWD5.Text = drwd5.Rows[0]["Weight"].ToString();
                ddlD5.Items.Insert(0, "Choose One");
            }
            string idD6 = "D6";
            DataTable drid6 = dbri.GetIndicatorByRId(idD6);
            DataTable drwd6 = dbri.GetWeightByRId(idD6);
            {

                lblGD6.Text = drid6.Rows[0]["Indicator"].ToString();
                lblWD6.Text = drwd6.Rows[0]["Weight"].ToString();
                ddlD6.Items.Insert(0, "Choose One");
            }
            string idD7 = "D7";
            DataTable drid7 = dbri.GetIndicatorByRId(idD7);
            DataTable drwd7 = dbri.GetWeightByRId(idD7);
            {

                lblGD7.Text = drid7.Rows[0]["Indicator"].ToString();
                lblWD7.Text = drwd7.Rows[0]["Weight"].ToString();
                ddlD7.Items.Insert(0, "Choose One");
            }
            string idD8 = "D8";
            DataTable drid8 = dbri.GetIndicatorByRId(idD8);
            DataTable drwd8 = dbri.GetWeightByRId(idD8);
            {

                lblGD8.Text = drid8.Rows[0]["Indicator"].ToString();
                lblWD8.Text = drwd8.Rows[0]["Weight"].ToString();
                ddlD8.Items.Insert(0, "Choose One");
            }
            string idE1 = "E1";
            DataTable drie1 = dbri.GetIndicatorByRId(idE1);
            DataTable drwe1 = dbri.GetWeightByRId(idE1);
            {

                lblGE1.Text = drie1.Rows[0]["Indicator"].ToString();
                lblWE1.Text = drwe1.Rows[0]["Weight"].ToString();
                ddlE1.Items.Insert(0, "Choose One");
            }
            string idE2 = "E2";
            DataTable drie2 = dbri.GetIndicatorByRId(idE2);
            DataTable drwe2 = dbri.GetWeightByRId(idE2);
            {

                lblGE2.Text = drie2.Rows[0]["Indicator"].ToString();
                lblWE2.Text = drwe2.Rows[0]["Weight"].ToString();
                ddlE2.Items.Insert(0, "Choose One");
            }
            string idE3 = "E3";
            DataTable drie3 = dbri.GetIndicatorByRId(idE3);
            DataTable drwe3 = dbri.GetWeightByRId(idE3);
            {

                lblGE3.Text = drie3.Rows[0]["Indicator"].ToString();
                lblWE3.Text = drwe3.Rows[0]["Weight"].ToString();
                ddlE3.Items.Insert(0, "Choose One");
            }
            string idE4 = "E4";
            DataTable drie4 = dbri.GetIndicatorByRId(idE4);
            DataTable drwe4 = dbri.GetWeightByRId(idE4);
            {

                lblGE4.Text = drie4.Rows[0]["Indicator"].ToString();
                lblWE4.Text = drwe4.Rows[0]["Weight"].ToString();
                ddlE4.Items.Insert(0, "Choose One");
            }
            string idE5 = "E5";
            DataTable drie5 = dbri.GetIndicatorByRId(idE5);
            DataTable drwe5 = dbri.GetWeightByRId(idE5);
            {

                lblGE5.Text = drie5.Rows[0]["Indicator"].ToString();
                lblWE5.Text = drwe5.Rows[0]["Weight"].ToString();
                ddlE5.Items.Insert(0, "Choose One");
            }
            string idE6 = "E6";
            DataTable drie6 = dbri.GetIndicatorByRId(idE6);
            DataTable drwe6 = dbri.GetWeightByRId(idE6);
            {

                lblGE6.Text = drie6.Rows[0]["Indicator"].ToString();
                lblWE6.Text = drwe6.Rows[0]["Weight"].ToString();
                ddlE6.Items.Insert(0, "Choose One");
            }
            string idE7 = "E7";
            DataTable drie7 = dbri.GetIndicatorByRId(idE7);
            DataTable drwe7 = dbri.GetWeightByRId(idE7);
            {

                lblGE7.Text = drie7.Rows[0]["Indicator"].ToString();
                lblWE7.Text = drwe7.Rows[0]["Weight"].ToString();
                ddlE7.Items.Insert(0, "Choose One");
            }
            string idE8 = "E8";
            DataTable drie8 = dbri.GetIndicatorByRId(idE8);
            DataTable drwe8 = dbri.GetWeightByRId(idE8);
            {

                lblGE8.Text = drie8.Rows[0]["Indicator"].ToString();
                lblWE8.Text = drwe8.Rows[0]["Weight"].ToString();
                ddlE8.Items.Insert(0, "Choose One");
            }
            string idF1 = "F1";
            DataTable drif1 = dbri.GetIndicatorByRId(idF1);
            DataTable drwf1 = dbri.GetWeightByRId(idF1);
            {

                lblGF1.Text = drif1.Rows[0]["Indicator"].ToString();
                lblWF1.Text = drwf1.Rows[0]["Weight"].ToString();
                ddlF1.Items.Insert(0, "Choose One");
            }
            string idF2 = "F2";
            DataTable drif2 = dbri.GetIndicatorByRId(idF2);
            DataTable drwf2 = dbri.GetWeightByRId(idF2);
            {

                lblGF2.Text = drif2.Rows[0]["Indicator"].ToString();
                lblWF2.Text = drwf2.Rows[0]["Weight"].ToString();
                ddlF2.Items.Insert(0, "Choose One");
            }
            string idF3 = "F3";
            DataTable drif3 = dbri.GetIndicatorByRId(idF3);
            DataTable drwf3 = dbri.GetWeightByRId(idF3);
            {

                lblGF3.Text = drif3.Rows[0]["Indicator"].ToString();
                lblWF3.Text = drwf3.Rows[0]["Weight"].ToString();
                ddlF3.Items.Insert(0, "Choose One");
            }
            string idF4 = "F4";
            DataTable drif4 = dbri.GetIndicatorByRId(idF4);
            DataTable drwf4 = dbri.GetWeightByRId(idF4);
            {

                lblGF4.Text = drif4.Rows[0]["Indicator"].ToString();
                lblWF4.Text = drwf4.Rows[0]["Weight"].ToString();
                ddlF4.Items.Insert(0, "Choose One");
            }
            string idF5 = "F5";
            DataTable drif5 = dbri.GetIndicatorByRId(idF5);
            DataTable drwf5 = dbri.GetWeightByRId(idF5);
            {

                lblGF5.Text = drif5.Rows[0]["Indicator"].ToString();
                lblWF5.Text = drwf5.Rows[0]["Weight"].ToString();
                ddlF5.Items.Insert(0, "Choose One");
            }
            string idF6 = "F6";
            DataTable drif6 = dbri.GetIndicatorByRId(idF6);
            DataTable drwf6 = dbri.GetWeightByRId(idF6);
            {

                lblGF6.Text = drif6.Rows[0]["Indicator"].ToString();
                lblWF6.Text = drwf6.Rows[0]["Weight"].ToString();
                ddlF6.Items.Insert(0, "Choose One");
            }
            string idF7 = "F7";
            DataTable drif7 = dbri.GetIndicatorByRId(idF7);
            DataTable drwf7 = dbri.GetWeightByRId(idF7);
            {

                lblGF7.Text = drif7.Rows[0]["Indicator"].ToString();
                lblWF7.Text = drwf7.Rows[0]["Weight"].ToString();
                ddlF7.Items.Insert(0, "Choose One");
            }
            string idG1 = "G1";
            DataTable drig1 = dbri.GetIndicatorByRId(idG1);
            DataTable drwg1 = dbri.GetWeightByRId(idG1);
            {

                lblGG1.Text = drig1.Rows[0]["Indicator"].ToString();
                lblWG1.Text = drwg1.Rows[0]["Weight"].ToString();
                ddlG1.Items.Insert(0, "Choose One");
            }
            string idG2 = "G2";
            DataTable drig2 = dbri.GetIndicatorByRId(idG2);
            DataTable drwg2 = dbri.GetWeightByRId(idG2);
            {

                lblGG2.Text = drig2.Rows[0]["Indicator"].ToString();
                lblWG2.Text = drwg2.Rows[0]["Weight"].ToString();
                ddlG2.Items.Insert(0, "Choose One");
            }
            string idH1 = "H1";
            DataTable drih1 = dbri.GetIndicatorByRId(idH1);
            DataTable drwh1 = dbri.GetWeightByRId(idH1);
            {

                lblGH1.Text = drih1.Rows[0]["Indicator"].ToString();
                lblWH1.Text = drwh1.Rows[0]["Weight"].ToString();
                ddlH1.Items.Insert(0, "Choose One");
            }
            string idH2 = "H2";
            DataTable drih2 = dbri.GetIndicatorByRId(idH2);
            DataTable drwh2 = dbri.GetWeightByRId(idH2);
            {

                lblGH2.Text = drih2.Rows[0]["Indicator"].ToString();
                lblWH2.Text = drwh2.Rows[0]["Weight"].ToString();
                ddlH2.Items.Insert(0, "Choose One");
            }
            string idH3 = "H3";
            DataTable drih3 = dbri.GetIndicatorByRId(idH3);
            DataTable drwh3 = dbri.GetWeightByRId(idH3);
            {

                lblGH3.Text = drih3.Rows[0]["Indicator"].ToString();
                lblWH3.Text = drwh3.Rows[0]["Weight"].ToString();
                ddlH3.Items.Insert(0, "Choose One");
            }
            string idH4 = "H4";
            DataTable drih4 = dbri.GetIndicatorByRId(idH4);
            DataTable drwh4 = dbri.GetWeightByRId(idH4);
            {

                lblGH4.Text = drih4.Rows[0]["Indicator"].ToString();
                lblWH4.Text = drwh4.Rows[0]["Weight"].ToString();
                ddlH4.Items.Insert(0, "Choose One");
            }
            string idH5 = "H5";
            DataTable drih5 = dbri.GetIndicatorByRId(idH5);
            DataTable drwh5 = dbri.GetWeightByRId(idH5);
            {

                lblGH5.Text = drih5.Rows[0]["Indicator"].ToString();
                lblWH5.Text = drwh5.Rows[0]["Weight"].ToString();
                ddlH5.Items.Insert(0, "Choose One");
            }
            string idH6 = "H6";
            DataTable drih6 = dbri.GetIndicatorByRId(idH6);
            DataTable drwh6 = dbri.GetWeightByRId(idH6);
            {

                lblGH6.Text = drih6.Rows[0]["Indicator"].ToString();
                lblWH6.Text = drwh6.Rows[0]["Weight"].ToString();
                ddlH6.Items.Insert(0, "Choose One");
            }
            string idI1 = "I1";
            DataTable drii1 = dbri.GetIndicatorByRId(idI1);
            DataTable drwi1 = dbri.GetWeightByRId(idI1);
            {

                lblGI1.Text = drii1.Rows[0]["Indicator"].ToString();
                lblWI1.Text = drwi1.Rows[0]["Weight"].ToString();
                ddlI1.Items.Insert(0, "Choose One");
            }
            string idI2 = "I2";
            DataTable drii2 = dbri.GetIndicatorByRId(idI2);
            DataTable drwi2 = dbri.GetWeightByRId(idI2);
            {

                lblGI2.Text = drii2.Rows[0]["Indicator"].ToString();
                lblWI2.Text = drwi2.Rows[0]["Weight"].ToString();
                ddlI2.Items.Insert(0, "Choose One");
            }
            string idI3 = "I3";
            DataTable drii3 = dbri.GetIndicatorByRId(idI3);
            DataTable drwi3 = dbri.GetWeightByRId(idI3);
            {

                lblGI3.Text = drii3.Rows[0]["Indicator"].ToString();
                lblWI3.Text = drwi3.Rows[0]["Weight"].ToString();
                ddlI3.Items.Insert(0, "Choose One");
            }
            string idJ1 = "J1";
            DataTable drij1 = dbri.GetIndicatorByRId(idJ1);
            DataTable drwj1 = dbri.GetWeightByRId(idJ1);
            {

                lblGJ1.Text = drij1.Rows[0]["Indicator"].ToString();
                lblWJ1.Text = drwj1.Rows[0]["Weight"].ToString();
                ddlJ1.Items.Insert(0, "Choose One");
            }
            string idJ2 = "J2";
            DataTable drij2 = dbri.GetIndicatorByRId(idJ2);
            DataTable drwj2 = dbri.GetWeightByRId(idJ2);
            {

                lblGJ2.Text = drij2.Rows[0]["Indicator"].ToString();
                lblWJ2.Text = drwj2.Rows[0]["Weight"].ToString();
                ddlJ2.Items.Insert(0, "Choose One");
            }
            string idK1 = "K1";
            DataTable drik1 = dbri.GetIndicatorByRId(idK1);
            DataTable drwk1 = dbri.GetWeightByRId(idK1);
            {

                lblGK1.Text = drik1.Rows[0]["Indicator"].ToString();
                lblWK1.Text = drwk1.Rows[0]["Weight"].ToString();
                ddlK1.Items.Insert(0, "Choose One");
            }
            string idK2 = "K2";
            DataTable drik2 = dbri.GetIndicatorByRId(idK2);
            DataTable drwk2 = dbri.GetWeightByRId(idK2);
            {

                lblGK2.Text = drik2.Rows[0]["Indicator"].ToString();
                lblWK2.Text = drwk2.Rows[0]["Weight"].ToString();
                ddlK2.Items.Insert(0, "Choose One");
            }
        }
        
    }

    private void SummaryBranch()
    {
        lblBrName.Text = ddlBranchCode.SelectedItem.Text;
        lblYear.Text = ddlYear.SelectedItem.Text;
        lblMonth.Text = ddlMonth.SelectedItem.Text;
        lblNameBM.Text = lblBM.Text;
       
    }
    private void SummaryA()
    {
        
        lblBrName.Text = ddlBranchCode.SelectedItem.Text;
        lblYear.Text = ddlYear.SelectedItem.Text;
        lblMonth.Text = ddlMonth.SelectedItem.Text;
        lblNameBM.Text = lblBM.Text;
        //int a1 = int.Parse(lblW1.Text);
        lblA1.Text = Convert.ToInt32(lblW1.Text).ToString();
        //int wa1 = int.Parse(ddlA1.SelectedValue.ToString());
        lblWA1.Text = ddlA1.SelectedItem.Text;
        A1RWE.Text = ((Convert.ToInt32(ddlA1.SelectedValue.ToString())) * (Convert.ToInt32(lblW1.Text))).ToString();
        //A1RWE.Text = (a1 * wa1).ToString();
        lblA2.Text =  Convert.ToInt32(lblW2.Text).ToString();
        lblWA2.Text = ddlA2.SelectedItem.Text;
        A2RWE.Text = ((Convert.ToInt32(ddlA2.SelectedValue.ToString())) * (Convert.ToInt32(lblW2.Text))).ToString();
        lblA3.Text =  Convert.ToInt32(lblW3.Text).ToString();
        lblWA3.Text = ddlA3.SelectedItem.Text;
        A3RWE.Text = ((Convert.ToInt32(ddlA3.SelectedValue.ToString())) * (Convert.ToInt32(lblW3.Text))).ToString();
        lblA4.Text =  Convert.ToInt32(lblW4.Text).ToString();
        lblWA4.Text = ddlA4.SelectedItem.Text;
        A4RWE.Text = ((Convert.ToInt32(ddlA4.SelectedValue.ToString())) * (Convert.ToInt32(lblW4.Text))).ToString();
        //lblA5.Text =  Convert.ToInt32(lblW5.Text).ToString();
        //lblWA5.Text = ddlA5.SelectedItem.Text;
        //A5RWE.Text = ((Convert.ToInt32(ddlA5.SelectedValue.ToString())) * (Convert.ToInt32(lblW5.Text))).ToString();
        //double A = Convert.ToDouble(A1RWE.Text) + Convert.ToDouble(A2RWE.Text) + Convert.ToDouble(A3RWE.Text) + Convert.ToDouble(A4RWE.Text) + Convert.ToDouble(A5RWE.Text) * Convert.ToDouble(lblAW.Text) ;
        int A = Convert.ToInt32(A1RWE.Text) + Convert.ToInt32(A2RWE.Text) + Convert.ToInt32(A3RWE.Text) + Convert.ToInt32(A4RWE.Text); //* (Convert.ToInt32(lblAW.Text).ToString());
        decimal B = Convert.ToDecimal(lblA.Text);//Convert.ToInt32(lblAW.Text);
        decimal C = A * B;
        lblATW.Text = C.ToString("0.00");
    }

    private void SummaryB()
    {
        lblB1.Text = Convert.ToInt32(lblWB1.Text).ToString();
        lblBW1.Text = ddlB1.SelectedItem.Text;
        B1RWE.Text = (Convert.ToInt32(ddlB1.SelectedValue.ToString()) * (Convert.ToInt32(lblWB1.Text))).ToString();
        lblB2.Text = Convert.ToInt32(lblWB2.Text).ToString();
        lblBW2.Text = ddlB2.SelectedItem.Text;
        B2RWE.Text = ((Convert.ToInt32(ddlB2.SelectedValue.ToString())) * (Convert.ToInt32(lblWB2.Text))).ToString();
        lblB3.Text = Convert.ToInt32(lblWB3.Text).ToString();
        lblBW3.Text = ddlB3.SelectedItem.Text;
        B3RWE.Text = ((Convert.ToInt32(ddlB3.SelectedValue.ToString())) * (Convert.ToInt32(lblWB3.Text))).ToString();
        lblB4.Text = Convert.ToInt32(lblWB4.Text).ToString();
        lblBW4.Text = ddlB4.SelectedItem.Text;
        B4RWE.Text = ((Convert.ToInt32(ddlB4.SelectedValue.ToString())) * (Convert.ToInt32(lblWB4.Text))).ToString();
        lblB5.Text = Convert.ToInt32(lblWB5.Text).ToString();
        lblBW5.Text = ddlB5.SelectedItem.Text;
        B5RWE.Text = ((Convert.ToInt32(ddlB5.SelectedValue.ToString())) * (Convert.ToInt32(lblWB5.Text))).ToString();
        int A = Convert.ToInt32(B1RWE.Text) + Convert.ToInt32(B2RWE.Text) + Convert.ToInt32(B3RWE.Text) + Convert.ToInt32(B4RWE.Text) + Convert.ToInt32(B5RWE.Text); 
        decimal B = Convert.ToDecimal(lblB.Text);//Convert.ToInt32(lblAW.Text);
        decimal C = A * B;
        lblBTW.Text = C.ToString("0.00");
    }
    private void SummaryC()
    {
        lblC1.Text = Convert.ToInt32(lblWC1.Text).ToString();
        lblCW1.Text = ddlC1.SelectedItem.Text;
        C1RWE.Text = (Convert.ToInt32(ddlC1.SelectedValue.ToString()) * (Convert.ToInt32(lblWC1.Text))).ToString();
        lblC2.Text = Convert.ToInt32(lblWC2.Text).ToString();
        lblCW2.Text = ddlC2.SelectedItem.Text;
        C2RWE.Text = ((Convert.ToInt32(ddlC2.SelectedValue.ToString())) * (Convert.ToInt32(lblWC2.Text))).ToString();
        lblC3.Text = Convert.ToInt32(lblWC3.Text).ToString();
        lblCW3.Text = ddlC3.SelectedItem.Text;
        decimal C3 = Convert.ToDecimal(ddlC3.SelectedValue);
        C3RWE.Text = (C3 * (Convert.ToInt32(lblWC3.Text))).ToString();
        lblC4.Text = Convert.ToInt32(lblWC4.Text).ToString();
        lblCW4.Text = ddlC4.SelectedItem.Text;
        C4RWE.Text = ((Convert.ToInt32(ddlC4.SelectedValue.ToString())) * (Convert.ToInt32(lblWC4.Text))).ToString();
        lblC5.Text = Convert.ToInt32(lblWC5.Text).ToString();
        lblCW5.Text = ddlC5.SelectedItem.Text;
        C5RWE.Text = ((Convert.ToInt32(ddlC5.SelectedValue.ToString())) * (Convert.ToInt32(lblWC5.Text))).ToString();
        lblC6.Text = Convert.ToInt32(lblWC6.Text).ToString();
        lblCW6.Text = ddlC6.SelectedItem.Text;
        decimal C6 = Convert.ToDecimal(ddlC6.SelectedValue);
        C6RWE.Text = (C6 * (Convert.ToInt32(lblWC6.Text))).ToString();
        //lblC7.Text = Convert.ToInt32(lblWC7.Text).ToString();
        //lblCW7.Text = ddlC7.SelectedItem.Text;
        //decimal C7 = Convert.ToDecimal(ddlC7.SelectedValue);
        //C7RWE.Text = (C7 * (Convert.ToInt32(lblWC7.Text))).ToString();
        decimal A = Convert.ToDecimal(C1RWE.Text) + Convert.ToDecimal(C2RWE.Text) + Convert.ToDecimal(C3RWE.Text) + Convert.ToDecimal(C4RWE.Text) + Convert.ToDecimal(C5RWE.Text) + Convert.ToDecimal(C6RWE.Text);
        //int A = Convert.ToInt32(C1RWE.Text) + Convert.ToInt32(C2RWE.Text) + Convert.ToInt32(C3RWE.Text) + Convert.ToInt32(C4RWE.Text) + Convert.ToInt32(C5RWE.Text) + Convert.ToInt32(C6RWE.Text) + Convert.ToInt32(C7RWE.Text);
        decimal B = Convert.ToDecimal(lblC.Text);//Convert.ToInt32(lblAW.Text);
        decimal C = A * B;
        lblCTW.Text = C.ToString("0.00");
    }

    private void SummaryD()
    {
        lblD1.Text = Convert.ToInt32(lblWD1.Text).ToString();
        lblDW1.Text = ddlD1.SelectedItem.Text;
        decimal D1 = Convert.ToDecimal(ddlD1.SelectedValue);
        D1RWE.Text = (D1 * (Convert.ToInt32(lblWD1.Text))).ToString();
        lblD2.Text = Convert.ToInt32(lblWD2.Text).ToString();
        lblDW2.Text = ddlD2.SelectedItem.Text;
        D2RWE.Text = ((Convert.ToInt32(ddlD2.SelectedValue.ToString())) * (Convert.ToInt32(lblWD2.Text))).ToString();
        lblD3.Text = Convert.ToInt32(lblWD3.Text).ToString();
        lblDW3.Text = ddlD3.SelectedItem.Text;
        D3RWE.Text = ((Convert.ToInt32(ddlD3.SelectedValue.ToString())) * (Convert.ToInt32(lblWD3.Text))).ToString();
        lblD4.Text = Convert.ToInt32(lblWD4.Text).ToString();
        lblDW4.Text = ddlD4.SelectedItem.Text;
        D4RWE.Text = ((Convert.ToInt32(ddlD4.SelectedValue.ToString())) * (Convert.ToInt32(lblWD4.Text))).ToString();
        lblD5.Text = Convert.ToInt32(lblWD5.Text).ToString();
        lblDW5.Text = ddlD5.SelectedItem.Text;
        D5RWE.Text = ((Convert.ToInt32(ddlD5.SelectedValue.ToString())) * (Convert.ToInt32(lblWD5.Text))).ToString();
        lblD6.Text = Convert.ToInt32(lblWD6.Text).ToString();
        lblDW6.Text = ddlD6.SelectedItem.Text;
        D6RWE.Text = ((Convert.ToInt32(ddlD6.SelectedValue.ToString())) * (Convert.ToInt32(lblWD6.Text))).ToString();
        lblD7.Text = Convert.ToInt32(lblWD7.Text).ToString();
        lblDW7.Text = ddlD7.SelectedItem.Text;
        D7RWE.Text = ((Convert.ToInt32(ddlD7.SelectedValue.ToString())) * (Convert.ToInt32(lblWD7.Text))).ToString();
        lblD8.Text = Convert.ToInt32(lblWD8.Text).ToString();
        lblDW8.Text = ddlD8.SelectedItem.Text;
        D8RWE.Text = ((Convert.ToInt32(ddlD8.SelectedValue.ToString())) * (Convert.ToInt32(lblWD8.Text))).ToString();
        decimal A = Convert.ToDecimal(D1RWE.Text) + Convert.ToDecimal(D2RWE.Text) + Convert.ToDecimal(D3RWE.Text) + Convert.ToDecimal(D4RWE.Text) + Convert.ToDecimal(D5RWE.Text) + Convert.ToDecimal(D6RWE.Text) + Convert.ToDecimal(D7RWE.Text) + Convert.ToDecimal(D8RWE.Text);
        //int A = Convert.ToInt32(D1RWE.Text) + Convert.ToInt32(D2RWE.Text) + Convert.ToInt32(D3RWE.Text) + Convert.ToInt32(D4RWE.Text) + Convert.ToInt32(D5RWE.Text) + Convert.ToInt32(D6RWE.Text) + Convert.ToInt32(D7RWE.Text);
        decimal B = Convert.ToDecimal(lblD.Text);
        decimal C = A * B;
        lblDTW.Text = C.ToString("0.00");
    }
    private void SummaryE()
    {
        lblE1.Text = Convert.ToInt32(lblWE1.Text).ToString();
        lblEW1.Text = ddlE1.SelectedItem.Text;
        decimal E1 = Convert.ToDecimal(ddlE1.SelectedValue);
        E1RWE.Text = (E1 * (Convert.ToInt32(lblWE1.Text))).ToString();
        lblE2.Text = Convert.ToInt32(lblWE2.Text).ToString();
        lblEW2.Text = ddlE2.SelectedItem.Text;
        decimal E2 = Convert.ToDecimal(ddlE2.SelectedValue);
        E2RWE.Text = (E1 * (Convert.ToInt32(lblWE2.Text))).ToString();
        lblE3.Text = Convert.ToInt32(lblWE3.Text).ToString();
        lblEW3.Text = ddlE3.SelectedItem.Text;
        E3RWE.Text = ((Convert.ToInt32(ddlE3.SelectedValue.ToString())) * (Convert.ToInt32(lblWE3.Text))).ToString();
        lblE4.Text = Convert.ToInt32(lblWE4.Text).ToString();
        lblEW4.Text = ddlE4.SelectedItem.Text;
        E4RWE.Text = ((Convert.ToInt32(ddlE4.SelectedValue.ToString())) * (Convert.ToInt32(lblWE4.Text))).ToString();
        lblE5.Text = Convert.ToInt32(lblWE5.Text).ToString();
        lblEW5.Text = ddlE5.SelectedItem.Text;
        E5RWE.Text = ((Convert.ToInt32(ddlE5.SelectedValue.ToString())) * (Convert.ToInt32(lblWE5.Text))).ToString();
        lblE6.Text = Convert.ToInt32(lblWE6.Text).ToString();
        lblEW6.Text = ddlE6.SelectedItem.Text;
        E6RWE.Text = ((Convert.ToInt32(ddlE6.SelectedValue.ToString())) * (Convert.ToInt32(lblWE6.Text))).ToString();
        lblE7.Text = Convert.ToInt32(lblWE7.Text).ToString();
        lblEW7.Text = ddlE7.SelectedItem.Text;
        E7RWE.Text = ((Convert.ToInt32(ddlE7.SelectedValue.ToString())) * (Convert.ToInt32(lblWE7.Text))).ToString();
        lblE8.Text = Convert.ToInt32(lblWE8.Text).ToString();
        lblEW8.Text = ddlE8.SelectedItem.Text;
        decimal E8 = Convert.ToDecimal(ddlE8.SelectedValue);
        E8RWE.Text = (E8 * (Convert.ToInt32(lblWE8.Text))).ToString();
        decimal A = Convert.ToDecimal(E1RWE.Text) + Convert.ToDecimal(E2RWE.Text) + Convert.ToDecimal(E3RWE.Text) + Convert.ToDecimal(E4RWE.Text) + Convert.ToDecimal(E5RWE.Text) + Convert.ToDecimal(E6RWE.Text) + Convert.ToDecimal(E7RWE.Text) + Convert.ToDecimal(E8RWE.Text);
        //int A = Convert.ToInt32(E1RWE.Text) + Convert.ToInt32(E2RWE.Text) + Convert.ToInt32(E3RWE.Text) + Convert.ToInt32(E4RWE.Text) + Convert.ToInt32(E5RWE.Text) + Convert.ToInt32(E6RWE.Text) + Convert.ToInt32(E7RWE.Text) + Convert.ToInt32(E8RWE.Text);
        decimal B = Convert.ToDecimal(lblD.Text);//Convert.ToInt32(lblAW.Text);
        decimal C = A * B;
        lblETW.Text = C.ToString("0.00");
    }
    private void SummaryF()
    {
        lblF1.Text = Convert.ToInt32(lblWF1.Text).ToString();
        lblFW1.Text = ddlF1.SelectedItem.Text;
        decimal F1 = Convert.ToDecimal(ddlF1.SelectedValue);
        F1RWE.Text = (F1 * (Convert.ToInt32(lblWF1.Text))).ToString();
        lblF2.Text = Convert.ToInt32(lblWF2.Text).ToString();
        lblFW2.Text = ddlF2.SelectedItem.Text;
        decimal F2 = Convert.ToDecimal(ddlF2.SelectedValue);
        F2RWE.Text = (F2 * (Convert.ToInt32(lblWF2.Text))).ToString();
        lblF3.Text = Convert.ToInt32(lblWF3.Text).ToString();
        lblFW3.Text = ddlF3.SelectedItem.Text;
        decimal F3 = Convert.ToDecimal(ddlF3.SelectedValue);
        F3RWE.Text = (F3 * (Convert.ToInt32(lblWF3.Text))).ToString();
        lblF4.Text = Convert.ToInt32(lblWF4.Text).ToString();
        lblFW4.Text = ddlF4.SelectedItem.Text;
        decimal F4 = Convert.ToDecimal(ddlF4.SelectedValue);
        F4RWE.Text = (F4 * (Convert.ToInt32(lblWF4.Text))).ToString();
        lblF5.Text = Convert.ToInt32(lblWF5.Text).ToString();
        lblFW5.Text = ddlF5.SelectedItem.Text;
        decimal F5 = Convert.ToDecimal(ddlF5.SelectedValue);
        F5RWE.Text = (F5 * (Convert.ToInt32(lblWF5.Text))).ToString();
        lblF6.Text = Convert.ToInt32(lblWF6.Text).ToString();
        lblFW6.Text = ddlF6.SelectedItem.Text;
        F6RWE.Text = ((Convert.ToInt32(ddlF6.SelectedValue.ToString())) * (Convert.ToInt32(lblWF6.Text))).ToString();
        lblF7.Text = Convert.ToInt32(lblWF7.Text).ToString();
        lblFW7.Text = ddlF7.SelectedItem.Text;
        F7RWE.Text = ((Convert.ToInt32(ddlF7.SelectedValue.ToString())) * (Convert.ToInt32(lblWF7.Text))).ToString();
        decimal A = Convert.ToDecimal(F1RWE.Text) + Convert.ToDecimal(F2RWE.Text) + Convert.ToDecimal(F3RWE.Text) + Convert.ToDecimal(F4RWE.Text) + Convert.ToDecimal(F5RWE.Text) + Convert.ToDecimal(F6RWE.Text) + Convert.ToDecimal(F7RWE.Text);
        //int A = Convert.ToInt32(F1RWE.Text) + Convert.ToInt32(F2RWE.Text) + Convert.ToInt32(F3RWE.Text) + Convert.ToInt32(F4RWE.Text) + Convert.ToInt32(F5RWE.Text) + Convert.ToInt32(F6RWE.Text) + Convert.ToInt32(E7RWE.Text);
        decimal B = Convert.ToDecimal(lblF.Text);//Convert.ToInt32(lblAW.Text);
        decimal C = A * B;
        lblFTW.Text = C.ToString("0.00");
    }
    private void SummaryG()
    {
        lblG1.Text = Convert.ToInt32(lblWG1.Text).ToString();
        lblGW1.Text = ddlG1.SelectedItem.Text;
        G1RWE.Text = (Convert.ToInt32(ddlG1.SelectedValue.ToString()) * (Convert.ToInt32(lblWG1.Text))).ToString();
        lblG2.Text = Convert.ToInt32(lblWG2.Text).ToString();
        lblGW2.Text = ddlG2.SelectedItem.Text;
        G2RWE.Text = (Convert.ToInt32(ddlG2.SelectedValue.ToString()) * (Convert.ToInt32(lblWG2.Text))).ToString();

        decimal A = Convert.ToDecimal(G1RWE.Text) + Convert.ToDecimal(G2RWE.Text);
        decimal B = Convert.ToDecimal(lblG.Text);
        decimal C = A * B;
        lblGTW.Text = C.ToString("0.00");
    }
    private void SummaryH()
    {
        lblH1.Text = Convert.ToInt32(lblWH1.Text).ToString();
        lblHW1.Text = ddlH1.SelectedItem.Text;
        H1RWE.Text = (Convert.ToInt32(ddlH1.SelectedValue.ToString()) * (Convert.ToInt32(lblWH1.Text))).ToString();
        lblH2.Text = Convert.ToInt32(lblWH2.Text).ToString();
        lblHW2.Text = ddlH2.SelectedItem.Text;
        H2RWE.Text = ((Convert.ToInt32(ddlH2.SelectedValue.ToString())) * (Convert.ToInt32(lblWH2.Text))).ToString();
        lblH3.Text = Convert.ToInt32(lblWH3.Text).ToString();
        lblHW3.Text = ddlH3.SelectedItem.Text;
        H3RWE.Text = ((Convert.ToInt32(ddlH3.SelectedValue.ToString())) * (Convert.ToInt32(lblWH3.Text))).ToString();
        lblH4.Text = Convert.ToInt32(lblWH4.Text).ToString();
        lblHW4.Text = ddlH4.SelectedItem.Text;
        H4RWE.Text = ((Convert.ToInt32(ddlH4.SelectedValue.ToString())) * (Convert.ToInt32(lblWH4.Text))).ToString();
        lblH5.Text = Convert.ToInt32(lblWH5.Text).ToString();
        lblHW5.Text = ddlH5.SelectedItem.Text;
        decimal H5 = Convert.ToDecimal(ddlH5.SelectedValue);
        H5RWE.Text = (H5 * (Convert.ToInt32(lblWH5.Text))).ToString();
        lblH6.Text = Convert.ToInt32(lblWH6.Text).ToString();
        lblHW6.Text = ddlH6.SelectedItem.Text;
        H6RWE.Text = ((Convert.ToInt32(ddlH6.SelectedValue.ToString())) * (Convert.ToInt32(lblWH6.Text))).ToString();
        decimal A = Convert.ToDecimal(H1RWE.Text) + Convert.ToDecimal(H2RWE.Text) + Convert.ToDecimal(H3RWE.Text) + Convert.ToDecimal(H4RWE.Text) + Convert.ToDecimal(H5RWE.Text) + Convert.ToDecimal(H6RWE.Text);
        //int A = Convert.ToInt32(H1RWE.Text) + Convert.ToInt32(H2RWE.Text) + Convert.ToInt32(H3RWE.Text) + Convert.ToInt32(H4RWE.Text) + Convert.ToInt32(H5RWE.Text) + Convert.ToInt32(H6RWE.Text);
        decimal B = Convert.ToDecimal(lblH.Text);
        decimal C = A * B;
        lblHTW.Text = C.ToString("0.00");
    }
    private void SummaryI()
    {
        lblI1.Text = Convert.ToInt32(lblWI1.Text).ToString();
        lblIW1.Text = ddlI1.SelectedItem.Text;
        I1RWE.Text = (Convert.ToInt32(ddlI1.SelectedValue.ToString()) * (Convert.ToInt32(lblWI1.Text))).ToString();
        lblI2.Text = Convert.ToInt32(lblWI2.Text).ToString();
        lblIW2.Text = ddlI2.SelectedItem.Text;
        decimal I2 = Convert.ToDecimal(ddlI2.SelectedValue);
        I2RWE.Text = (I2 * (Convert.ToInt32(lblWI2.Text))).ToString();
        lblI3.Text = Convert.ToInt32(lblWI3.Text).ToString();
        lblIW3.Text = ddlI3.SelectedItem.Text;
        I3RWE.Text = ((Convert.ToInt32(ddlI3.SelectedValue.ToString())) * (Convert.ToInt32(lblWI3.Text))).ToString();
        decimal A = Convert.ToDecimal(I1RWE.Text) + Convert.ToDecimal(I2RWE.Text) + Convert.ToDecimal(I3RWE.Text);
        //int A = Convert.ToInt32(I1RWE.Text) + Convert.ToInt32(I2RWE.Text) + Convert.ToInt32(I3RWE.Text);
        decimal B = Convert.ToDecimal(lblI.Text);
        decimal C = A * B;
        lblITW.Text = C.ToString("0.00");
    }
    private void SummaryJ()
    {
        lblJ1.Text = Convert.ToInt32(lblWJ1.Text).ToString();
        lblJW1.Text = ddlJ1.SelectedItem.Text;
        J1RWE.Text = (Convert.ToInt32(ddlJ1.SelectedValue.ToString()) * (Convert.ToInt32(lblWJ1.Text))).ToString();
        lblJ2.Text = Convert.ToInt32(lblWJ2.Text).ToString();
        lblJW2.Text = ddlJ2.SelectedItem.Text;
        decimal J2 = Convert.ToDecimal(ddlJ2.SelectedValue);
        J2RWE.Text = (J2 * (Convert.ToInt32(lblWJ2.Text))).ToString();
        decimal A = Convert.ToDecimal(J1RWE.Text) + Convert.ToDecimal(J2RWE.Text);
        //int A = Convert.ToInt32(J1RWE.Text) + Convert.ToInt32(J2RWE.Text);
        decimal B = Convert.ToDecimal(lblJ.Text);
        decimal C = A * B;
        lblJTW.Text = C.ToString("0.00");
    }
    private void SummaryK()
    {
        lblK1.Text = Convert.ToInt32(lblWK1.Text).ToString();
        lblKW1.Text = ddlK1.SelectedItem.Text;
        decimal K1 = Convert.ToDecimal(ddlK1.SelectedValue);
        K1RWE.Text = (K1 * (Convert.ToInt32(lblWK1.Text))).ToString();
        lblK2.Text = Convert.ToInt32(lblWK2.Text).ToString();
        lblKW2.Text = ddlK2.SelectedItem.Text;
        decimal K2 = Convert.ToDecimal(ddlK2.SelectedValue);
        K2RWE.Text = (K2 * (Convert.ToInt32(lblWK2.Text))).ToString();
        decimal A = Convert.ToDecimal(K1RWE.Text) + Convert.ToDecimal(K2RWE.Text);
        //int A = Convert.ToInt32(K1RWE.Text) + Convert.ToInt32(K2RWE.Text);
        decimal B = Convert.ToDecimal(lblK.Text);
        decimal C = A * B;
        lblKTW.Text = C.ToString("0.00");
    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        string year = ddlYear.SelectedValue.ToString();
        string month = ddlMonth.SelectedValue.ToString();

        Page.Validate("a");
        if (!Page.IsValid || year == "Choose Year" || month == "Choose Month")
        {
            e.Cancel = true;
            string Alert = "Re-check Entries" + "\\n" + "Request Rejected";
            ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
           
        }

        if (Page.IsValid && e.NextStepIndex == 12)
        {
            SummaryBranch();
            SummaryA();
            SummaryB();
            SummaryC();
            SummaryD();
            SummaryE();
            SummaryF();
            SummaryG();
            SummaryH();
            SummaryI();
            SummaryJ();
            SummaryK();
            decimal T = Convert.ToDecimal(lblATW.Text) + Convert.ToDecimal(lblBTW.Text) + Convert.ToDecimal(lblCTW.Text) + Convert.ToDecimal(lblDTW.Text) 
                + Convert.ToDecimal(lblETW.Text) + Convert.ToDecimal(lblFTW.Text) + Convert.ToDecimal(lblGTW.Text) + Convert.ToDecimal(lblHTW.Text) 
                + Convert.ToDecimal(lblITW.Text) + Convert.ToDecimal(lblJTW.Text) + Convert.ToDecimal(lblKTW.Text);
            lblGT.Text = T.ToString("0.00");
            Wizard1.DisplaySideBar = true;
        }
        
        
    }

    private string SendMail(string Sender, string Receiver, string Subject, string Body)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(Receiver);
            mailMessage.From = new MailAddress(Sender);
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

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        string branchcode = ddlBranchCode.SelectedValue.ToString();
        string year = ddlYear.SelectedValue.ToString();
        string month = ddlMonth.SelectedValue.ToString();
        DataTable dm = dy.GetIMonthByMonth(month);
        string month1 = dm.Rows[0]["Value"].ToString();
        string OpId = branchcode + year + month1;
        DataTable dt = dusert.GetBranchBM(branchcode);
        string emailbm = dt.Rows[0]["Email"].ToString();
        string msender = Session["username"].ToString();
        string receiver = emailbm;
        DataTable dt1 = dra.GetFileByOpId(OpId);
        if(dt1.Rows.Count>0)
        {
            //string Alert = "You have already posted data for this month with Id:"+ " "+OpId;
            
            //ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");
            //return;
            ScriptManager.RegisterStartupScript(this, this.GetType(),
               "alert",
               "alert('You have already posted data for this month.');window.location ='Default.aspx';",
               true);
        }
        else
        { 
       
            int i = dra.CreateOpRiskAssess(branchcode, year, month, Convert.ToDecimal(lblGT.Text),
                A1RWE.Text, A2RWE.Text, A3RWE.Text, A4RWE.Text,
                B1RWE.Text, B2RWE.Text, B3RWE.Text, B4RWE.Text, B5RWE.Text,
                C1RWE.Text, C2RWE.Text, C3RWE.Text, C4RWE.Text, C5RWE.Text, C6RWE.Text,
                D1RWE.Text, D2RWE.Text, D3RWE.Text, D4RWE.Text, D5RWE.Text, D6RWE.Text, D7RWE.Text, D8RWE.Text,
                E1RWE.Text, E2RWE.Text, E3RWE.Text, E4RWE.Text, E5RWE.Text, E6RWE.Text, E7RWE.Text, E8RWE.Text,
                F1RWE.Text, F2RWE.Text, F3RWE.Text, F4RWE.Text, F5RWE.Text, F6RWE.Text, F7RWE.Text,
                G1RWE.Text, G2RWE.Text,
                H1RWE.Text, H2RWE.Text, H3RWE.Text, H4RWE.Text, H5RWE.Text, H6RWE.Text,
                I1RWE.Text, I2RWE.Text, I3RWE.Text,
                J1RWE.Text, J2RWE.Text,
                K1RWE.Text, K2RWE.Text,
                msender, "P", OpId);

            if (i > 0)
            {
                //string branch = ddlBranchCode.SelectedItem.ToString();
                //string Subject = "New OpRiskAssess:" + branchcode;
                //string Body = "New OpRiskAssess Created of:" + " " + year + " " + month +
                //    Environment.NewLine + "Branch:" + " " + branch +
                //    Environment.NewLine + "Year:" + " " + year +
                //    Environment.NewLine + "Month:" + " " + month +
                //    Environment.NewLine + "For More Information follow: http://192.168.103.13/OpRiskApp.aspx";
                //    // Environment.NewLine +
                //string Alert = "Data Inserted Successfully. OpId:"+" "+OpId;
                //string status = SendMail(msender, receiver, Subject, Body);
                //ClientScript.RegisterStartupScript(this.GetType(), "popup", "<script type='text/javascript'>alert('" + Alert + "');</script>");

                //Response.Redirect("~/Confirmation.aspx");
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert",
                "alert('Data Inserted Successfully.');window.location ='Default.aspx';",
                true);
            }
        }
    }

    protected void Wizard1_SideBarButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Page.Validate("a");
        if (!Page.IsValid)
        {
            e.Cancel = true;
        }
        return;
    }
}
