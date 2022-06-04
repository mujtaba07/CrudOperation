<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="program.aspx.cs" Inherits="insertUpdateDelete.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> WEBFORM</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />

    <style type="text/css">
        .auto-style2 {
            margin-left: 15px;
        }
        .auto-style3 {
            margin-left: 15px;
        }
        .auto-style4 {
            margin-left: 15px;
        }
        .auto-style5 {
            margin-left: 15px;
        }
        </style>
</head>
   
<body style="height: 458px">
  <form id="form1" runat="server">
      <div>
           <table> 
            <tr>
                <td>
                    <h1 align="center" text-align="center" aria-multiline="False" style="font-size: 35px; font-family: Arial">User Data</h1>
                </td>
            </tr>
                           

      <tr>
          <td>
               <asp:Label ID="lblID" runat="server" Text="ID:"  ForeColor="Black" Height="35px" ></asp:Label>             
              
              &nbsp;&nbsp;             
              
              <asp:TextBox ID="txtID" runat="server" placeholder="enter Id" CssClass="auto-style5" aria-required="true" Width="180px" BorderStyle="Solid" Height="20px" ValidationGroup="allValidation"></asp:TextBox>           
                    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtID" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>            
            
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtID" ErrorMessage="Enter number" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="allValidation"></asp:RegularExpressionValidator>
          </td>
      </tr>
            
      
      
     <tr>
         <td>
                 <asp:Label ID="lblName" runat="server" Text="Name :" ForeColor="Black" Height="35px"></asp:Label>
           
                  <asp:TextBox ID="txtName" runat="server" placeholder="entername" CssClass="auto-style3" ValidationGroup="allValidation" BorderStyle="Solid" Height="20px" Width="180px"></asp:TextBox>         
         
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtName" ErrorMessage=" Enter valid Name" ForeColor="#FF3300" ValidationExpression="^[a-zA-Z'.\s]{1,50}" ValidationGroup="allValidation"></asp:RegularExpressionValidator>
         </td>
     </tr>


        <tr>
            <td>
                        <asp:Label ID="lblPhone" runat="server" Text="Phone :" ForeColor="Black" Height="35px"></asp:Label>
            
                       <asp:TextBox ID="txtPhone" runat="server" placeholder="enter phone number" CssClass="auto-style2" ValidationGroup="allValidation" BorderStyle="Solid" Height="20px" Width="180px" ></asp:TextBox>
            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>        
            
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter numbers" ForeColor="#FF3300" ValidationExpression="^\d+$" ValidationGroup="allValidation"></asp:RegularExpressionValidator>
            </td>
        </tr>
   
            <tr>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Text="Address:" ForeColor="Black" Height="35px"></asp:Label>

                    <asp:TextBox ID="txtAddress" runat="server" placeholder="enter Address" CssClass="auto-style4" ValidationGroup="allValidation" BorderStyle="Solid" Height="20px" Width="180px"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>

            
           <tr>
               <td>
                   <asp:Label ID="lblEmail" runat="server" Text="Email :" Height="35px"></asp:Label>
              
                   <asp:TextBox ID="txtEmail" runat="server" placeholder="enter email" CssClass="auto-style5" ValidationGroup="allValidation" BorderStyle="Solid" Height="20px" Width="180px"></asp:TextBox>
              
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtEmail" display="Static"></asp:RequiredFieldValidator>
              
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic" ErrorMessage="Enter valid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ValidationGroup="allValidation"></asp:RegularExpressionValidator>

               </td>
           </tr>
      
            
            <tr>
               <td>
                    <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click"  backcolor="CornflowerBlue" Text="Insert" style ="height:26px" Width="60px" Font-Bold="true" BorderStyle="Inset" ValidationGroup="allValidation" />
                <td>
                     <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click"  backcolor="CornflowerBlue" Text="Delete" style="height: 26px" Width="60px" Font-Bold="true" BorderStyle="Inset" ValidationGroup="allValidation" />
                <td>
                     <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click"  backcolor="CornflowerBlue" Text="Update" style ="height:26px" Width="60px" Font-Bold="true" BorderStyle="Inset" ValidationGroup="allValidation"/>
                <td>
                     <asp:Button ID="btnView"   runat="server" OnClick="btnView_Click"  backcolor="CornflowerBlue" Text="View" style ="height:26px" Width="60px" Font-Bold="true" BorderStyle="Inset" ValidationGroup="allValidation"/>
                </tr>
            
               <tr>
                   <td>
                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="500px">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Email ID" HeaderText="Email ID" SortExpression="Email ID" />
                </Columns>
            </asp:GridView>
                   </td>                 
               </tr>         
        </table>
      </div>      
    </form>
</body>
</html>


