<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chart.aspx.cs" Inherits="Chart" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

  <head>
    <title>Pumori Report</title>
     <h1 align=center>Nepal Credit and Commerce Bank Ltd.</h1>
        <h2>Pumori Report</h2>
        <hr></hr>		
    <script type="text/vbscript">
      
      Sub btnTest2_OnClick()
	Set WshShell = CreateObject("WScript.Shell")
       WshShell.Run "D:\krishna\PumoriReport\totaldepo.vbs",1,True
	WshShell.SendKeys "% n"
	Set WshShell = Nothing
      End Sub

Sub btnTest3_OnClick()
	Set WshShell = CreateObject("WScript.Shell")
       WshShell.Run "D:\krishna\PumoriReport\totAcTypedepo.vbs",1,True
	WshShell.SendKeys "% n"
	Set WshShell = Nothing
      End Sub
Sub btnTest1_OnClick()
	Set WshShell = CreateObject("WScript.Shell")
       WshShell.Run "D:\krishna\PumoriReport\DEPO_ALL_FCY.vbs",1,True
	WshShell.SendKeys "% n"
	Set WshShell = Nothing
      End Sub
Sub btnTest6_OnClick()
	Set WshShell = CreateObject("WScript.Shell")
       WshShell.Run "D:\krishna\PumoriReport\DEPO_ALL_LCY.vbs",1,True
	WshShell.SendKeys "% n"
	Set WshShell = Nothing
      End Sub
Sub btnTest7_OnClick()
	Set WshShell = CreateObject("WScript.Shell")
       WshShell.Run "D:\krishna\PumoriReport\totaldepofcybranchwise.vbs",1,True
	WshShell.SendKeys "% n"
	Set WshShell = Nothing
      End Sub
Sub btnTest8_OnClick()
	Set WshShell = CreateObject("WScript.Shell")
       WshShell.Run "D:\krishna\PumoriReport\totaldepoRateWise.vbs",1,True
	WshShell.SendKeys "% n"
	Set WshShell = Nothing
      End Sub
Sub btnTest4_OnClick()
	Set WshShell = CreateObject("WScript.Shell")
       WshShell.Run "D:\krishna\PumoriReport\totalLoan.vbs",1,True
	WshShell.SendKeys "% n"
	Set WshShell = Nothing
      End Sub

Sub btnTest5_OnClick()
	Set WshShell = CreateObject("WScript.Shell")
       WshShell.Run "D:\krishna\PumoriReport\totAcTypeLoan.vbs",1,True
	WshShell.SendKeys "% n"
	Set WshShell = Nothing
      End Sub
Sub btnTest9_OnClick()
	Set WshShell = CreateObject("WScript.Shell")
       WshShell.Run "D:\krishna\PumoriReport\totalLoanRateWise.vbs",1,True
	WshShell.SendKeys "% n"
	Set WshShell = Nothing
      End Sub
    </script>
  </head>
  <body>
    <input type="button" value="Deposit ALL FCY" id="btnTest1">
     <input type="button" value="Deposit ALL LCY" id="btnTest6">
      <input type="button" value="Total Deposit Branch Wise FCY" id="btnTest7">
    <input type="button" value="Total Deposit Rate Wise" id="btnTest8">
    <input type="button" value="Total Deposit Branch Wise LCY" id="btnTest2">
    <input type="button" value="Total Deposit AcType Wise LCY" id= "btnTest3">
<hr></hr>
    <input type="button" value="Total Loan Branch Wise" id= "btnTest4">
    <input type="button" value="Total Loan AcType Wise" id= "btnTest5">
    <input type="button" value="Total Loan Rate Wise" id= "btnTest9">
  </body>

</html>
