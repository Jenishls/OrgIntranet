<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CircularMain.aspx.cs" Inherits="CircualarMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">--%>
    <div id="createCircular" runat="server">
    <h3 class="auto-style2">Add Circular</h3>
  <table class="tablecss" >

    <tr>
        <td class="risklefttd">
            <div style="float: left">Circular Type</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:dropdownlist id="drpCircularType" runat="server" cssclass="dropboxcss">
                <asp:ListItem>Choose Type</asp:ListItem>
                <asp:ListItem Value="A"> Administration Circular</asp:ListItem>
                <asp:ListItem Value="O">Office Instruction Memo</asp:ListItem>
            </asp:dropdownlist>
        </td>
        <td class="riskrighttd">
            <asp:requiredfieldvalidator id="requiredfieldvalidator2" runat="server" controltovalidate="drpCircularType" errormessage="select circular type" forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>
        </td>
    </tr>
          <tr>
        <td class="risklefttd">
            <div style="float: left">Year</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:Textbox id="lbYear" runat="server" cssclass="textboxcss" text="" ></asp:Textbox>
        </td>
        <td class="riskrighttd">
            <%--<asp:requiredfieldvalidator id="requiredfieldvalidator1" runat="server" controltovalidate="lbYear" errormessage="Enter year" forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>--%>
        </td>
    </tr>
    <tr>
        <td class="risklefttd">
            <div style="float: left">Circular No.</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:Textbox id="lbCircularNo" runat="server" cssclass="textboxcss" text=""></asp:Textbox>
        </td>
        <td class="riskrighttd">
            <%--<asp:requiredfieldvalidator id="requiredfieldvalidator3" runat="server" controltovalidate="lbCircularNo" errormessage="Enter circular no " forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>--%>
        </td>
    </tr>
    <tr>
        <td class="risklefttd">
            <div style="float: left">Subject</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
         
            <asp:Textbox id="lbSubject" runat="server" cssclass="textboxcss" text=""></asp:Textbox>
        </td>
        <td class="riskrighttd">
            <%--<asp:requiredfieldvalidator id="requiredfieldvalidator4" runat="server" controltovalidate="lbSubject" errormessage="enter subject" forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>--%>
        </td>
    </tr>
    <tr>
        <td class="risklefttd">
            <div style="float: left">File</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        <td class="riskrighttd">
            <%--<asp:requiredfieldvalidator id="requiredfieldvalidator5" runat="server" controltovalidate="FileUpload1" errormessage="select file" forecolor="red" initialvalue="choose branch" validationgroup="a">*</asp:requiredfieldvalidator>--%>
        </td>
    </tr>
      <tr>
        <td class="risklefttd">
            <div style="float: left">Is For Review</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" />
        </td>
      </tr>
       <tr>
        <td class="risklefttd">
            <div style="float: left">Send Mail</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="CheckBox2_CheckedChanged" />
        </td>
      </tr>
       <tr>
        <td class="risklefttd">
            <div style="float: left">Is Addendum</div>
            <div style="float: right">:</div>
        </td>
        <td class="riskrighttd">
            <asp:CheckBox ID="CheckBox3" runat="server" OnCheckedChanged="CheckBox3_CheckedChanged" />
        </td>
      </tr>
  </table>
<asp:Button ID="CircularSave" runat="server" Text="Upload"
    OnClick="CircularSave_Click" CssClass="btnMain btnGreen" />
<br />
<br />
   </div>

    <a href="http://192.168.103.77/HRD/2007%20circular/HRD%20TOPIC.htm" target="_blank"><u><h3>Old Circulars</h3></u></a>
    

    <h3><u> New Circulars</u></h3>
<asp:GridView ID="CircularMainGridView" runat="server" AutoGenerateColumns="False" 
    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="10" AllowSorting="True" >
            <Columns>
                <asp:TemplateField HeaderText="S.N.">
                    <ItemTemplate><%#Container.DataItemIndex+1 %> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="False" 
                    CommandName = '<%#Eval("SType") %>'
                    CommandArgument='<%#Eval("Year") %>'
                    Text=' <%#Eval("Type") %> '
                    OnCommand="CircularMainClick" 
                    >
                    </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <%--<asp:TemplateField HeaderText="Subject">
                        <ItemTemplate>
                            <a href="CircularDisplay.aspx?link=<%#Eval("Type") %>">  <%#Eval("Type") %>  <%#Eval("Year") %>  </a>
                        </ItemTemplate>
                </asp:TemplateField>--%>
                <%--<asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />--%>
            </Columns>
    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" 
        ForeColor="#FFFFCC" />
    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" 
        HorizontalAlign="Center" />
    <RowStyle BackColor="White" ForeColor="#330099" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" 
        ForeColor="#663399" />
    <SortedAscendingCellStyle BackColor="#FEFCEB" />
    <SortedAscendingHeaderStyle BackColor="#AF0101" />
    <SortedDescendingCellStyle BackColor="#F6F0C0" />
    <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
    
    <script src="js/axios.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/notify.min.js"></script>


    <script type="text/javascript">
        const setA = () => {
            $('#ContentPlaceHolder1_lbYear').val(moment().year())
            
            $('#ContentPlaceHolder1_lbCircularNo').val(dateIncrease('A')+'/'+moment().year())
        }

        const setB = () => {
            $('#ContentPlaceHolder1_lbYear').val(2076)
            
            //axios.get('http://192.168.103.17:7000/api/tracefile/year/')
            //.then(data => {
            //    console.log(data.data[0].Year)
            //    $('#ContentPlaceHolder1_lbCircularNo').val(dateIncrease('O')+'/'+data.data[0].Year)
            //})
            
        $.ajax({
            url: '<%=ResolveUrl("~/WebService.asmx/Year") %>',
                         dataType: "json",
                         type: "POST",
                         contentType: "application/json; charset=utf-8",
                         success: function (data) {
                             //console.log(data.d[0])
                             $('#ContentPlaceHolder1_lbCircularNo').val(dateIncrease('O')+'/'+data.d[0])
                         },
                         error: function (response) {
                             alert(response.responseText);
                         },
                         failure: function (response) {
                             alert(response.responseText);
                         }
                     });

        }

        const dateIncrease = (type) => {
            let a = localStorage.getItem(type)
            let res = a.split("/")
            res[0] = parseInt(res[0]) + 1
            return res[0]
        }

        $('#ContentPlaceHolder1_drpCircularType').change(function () {
            //console.log($('#ContentPlaceHolder1_drpCircularType').val())
            if ($('#ContentPlaceHolder1_drpCircularType').val() == 'A'){
                setA(); 
            }
            else if ($('#ContentPlaceHolder1_drpCircularType').val() == 'O')
            {
                setB();
            }
            })


        //axios.get('http://192.168.103.17:7000/api/tracefile/new/ACircular/')
		//.then(data => {
        //                if(!moment(data.data[0].Created_at).isBefore(moment(), "day")){

        //        $.each($('#ContentPlaceHolder1_CircularMainGridView').find('td:nth-child(3)'), function(index, val) {
        //            //console.log(val.innerHTML)

        //            localStorage.setItem('A',data.data[0].CirNo);
        //            if(data.data[0].Year == val.innerHTML){
        //                $.notify.defaults({elementPosition: "right", autoHide: false})
        //                //$.notify("Alert!", {type:"info"});

        //                $(this).parent().notify("New","info",{elementPosition: "right", autoHide: false })	
        //            }				
        //        });
        //            }
        //});

        //    axios.get('http://192.168.103.17:7000/api/tracefile/new/OCircular/')
        //    .then(data => {
                
        //    if(!moment(data.data[0].Created_at).isBefore(moment(), "day")){
        //        $.each($('#ContentPlaceHolder1_CircularMainGridView').find('td:nth-child(3)'), function(index, val) {
        //            localStorage.setItem('O',data.data[0].CirNo);
        //            if(data.data[0].Year == val.innerHTML){
        //                $.notify.defaults({elementPosition: "right", autoHide: false})
                       
        //                $(this).parent().notify("New","info",{elementPosition: "right", autoHide: false })	
        //            }				
        //        });
        //    }
               
        //});

         $.ajax({
                url: '<%=ResolveUrl("~/WebService.asmx/ACircular") %>',
             dataType: "json",
             type: "POST",
             contentType: "application/json; charset=utf-8",
             success: function (data) {
                 //console.log(data.d[0])
                 if(!moment(data.d[0].split('|')[0]).isBefore(moment(), "day")){

                     $.each($('#ContentPlaceHolder1_CircularMainGridView').find('td:nth-child(3)'), function(index, val) {
                         //console.log(val.innerHTML)

                         localStorage.setItem('A',data.d[0].split('|')[1]);
                         if(data.d[0].split('|')[2] == val.innerHTML){
                             $.notify.defaults({elementPosition: "right", autoHide: false})
                             //$.notify("Alert!", {type:"info"});

                             $(this).parent().notify("New","info",{elementPosition: "right", autoHide: false })	
                         }				
                     });
                 }
             },
             error: function (response) {
                 alert(response.responseText);
             },
             failure: function (response) {
                 alert(response.responseText);
             }
         });

        $.ajax({
            url: '<%=ResolveUrl("~/WebService.asmx/OCircular") %>',
             dataType: "json",
             type: "POST",
             contentType: "application/json; charset=utf-8",
             success: function (data) {
                 //console.log(data.d[0])
                 if(!moment(data.d[0].split('|')[0]).isBefore(moment(), "day")){

                     $.each($('#ContentPlaceHolder1_CircularMainGridView').find('td:nth-child(3)'), function(index, val) {
                         //console.log(val.innerHTML)

                         localStorage.setItem('O',data.d[0].split('|')[1]);
                         if(data.d[0].split('|')[2] == val.innerHTML){
                             $.notify.defaults({elementPosition: "right", autoHide: false})
                             //$.notify("Alert!", {type:"info"});

                             $(this).parent().notify("New","info",{elementPosition: "right", autoHide: false })	
                         }				
                     });
                 }
             },
             error: function (response) {
                 alert(response.responseText);
             },
             failure: function (response) {
                 alert(response.responseText);
             }
         });
         

    </script>

</asp:Content>

