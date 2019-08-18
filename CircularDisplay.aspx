<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CircularDisplay.aspx.cs" Inherits="CircularDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="panel">
      <embed src="<%= "Uploads/"+Request.QueryString["link"]+"#toolbar=0&navpanes=0&scrollbar=0" %>" height="600px" width="800px"/>
 <br />
        </div>
      
 <div style="padding : 10px;margin-top: 20px;background: #28a745;color: #fff;" id="checkforReview">
     <asp:CheckBox ID="confirm" runat="server"/>
  <asp:Label id="test" runat="server">I and my team have read, understand, and agree to abide by this circular.</asp:Label>
 </div>

    <script src="js/axios.js"></script>
    <script src="js/alertify.min.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            $('#panel1').before(`<div id="over" style="height:600px;width: 790px;position:relative;"></div>`)
            $('#panel1').css('margin-top','-600px')

            obj  = {CirNo : localStorage.getItem('CirNo')}
            if('<%=Session["Status"].ToString() %>' == 'IsBM'){
            axios.post("http://192.168.103.17:7000/api/tracefile/circularDetail/",obj)
            .then(data => {
                
                if(data.data[0].CheckForReview == 0 )
                    $('#checkforReview').hide();
                else{
                    $('#checkForReview').show()
                    if(data.data[0].CirNo[0] == data.data[0].CirNo[1] && data.data[0].BranchCode == '<%=Session["BranchCode"].ToString() %>')
                        $('#ContentPlaceHolder1_confirm').attr('checked', 'checked').attr('disabled','disabled')
                }

        })
        }
        else
        $('#checkforReview').hide();
        });
        $('#ContentPlaceHolder1_confirm').change(function (e) {
            e.preventDefault()
            if (this.checked) {
              alertify.confirm("Do you want to confirm?",
              function(){
                  alertify.success('Confirmed')
                 
                  $('#ContentPlaceHolder1_confirm').prop('checked', true);
                  let obj = {
                      'CirId': localStorage.getItem('CirNo'),
                      'BranchCode': '<%=Session["BranchCode"].ToString() %>',
                      'UserId': '<%=Session["UserId"].ToString() %>',
                      'Status' : ' 1 '
                  };
                  axios.post("http://192.168.103.17:7000/api/tracefile/circularViewed",obj)
                  .then(data => console.log(data)  )
                  console.log({
                      'CirId': localStorage.getItem('CirNo'),
                      'BranchCode': '<%=Session["BranchCode"].ToString() %>',
                      'UserId': '<%=Session["UserId"].ToString() %>',
                      'Status' : ' 1 '
                  })
                  $('#ContentPlaceHolder1_confirm').attr('checked', 'checked').attr('disabled','disabled')
              },
              function(){
                  $('#ContentPlaceHolder1_confirm').prop('checked', false);
                  alertify.error('Cancelled');
              }).setHeader("Confirmation");
                
            }else{
                alertify.error('Unchecked');
            }
        })
    </script>
</asp:Content>

