<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CircularDisplay.aspx.cs" Inherits="CircularDisplay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
      <embed src="<%= "Uploads/"+Request.QueryString["link"]+"#toolbar=0&navpanes=0&scrollbar=0" %>" height="600px" width="800px"/>
 <br />
      
 <div style="padding-left : 10px" id="checkforReview">
     <asp:CheckBox ID="confirm" runat="server"/>
  <asp:Label id="test" runat="server">I and my team have read, understand, and agree to abide by this circular.</asp:Label>
 </div>

    <script src="js/axios.js"></script>
    <script src="js/alertify.min.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            obj  = {CirNo : localStorage.getItem('CirNo')}
            if('<%=Session["Status"].ToString() %>' == 'IsBM'){
            axios.post("http://localhost:7000/api/tracefile/circularDetail/",obj)
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
                  alertify.success('Ok')
                 
                  $('#ContentPlaceHolder1_confirm').prop('checked', true);
                  let obj = {
                      'CirId': localStorage.getItem('CirNo'),
                      'BranchCode': '<%=Session["BranchCode"].ToString() %>',
                      'UserId': '<%=Session["UserId"].ToString() %>',
                      'Status' : ' 1 '
                  };
                  axios.post("http://localhost:7000/api/tracefile/circularViewed",obj)
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
              });
                
            }else{
                alertify.error('Unchecked');
            }
        })
    </script>
</asp:Content>

