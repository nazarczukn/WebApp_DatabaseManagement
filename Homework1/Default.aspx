<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Homework1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
   <div style="font-size:xx-large" align="center"> MOVIES</div>
            <p style="margin-left: 160px; font-size: medium;">
                SEARCH BY&nbsp; 
   

         </p>
        <p style="margin-left: 160px; font-size: medium;">
                TITLE:
                <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SEARCH" Width="110px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GENRE: <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 50" Width="120px"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="SEARCH" Width="110px" />
   

         </p>
        <p style="margin-left: 160px; font-size: medium;">
                RELEASED:
                <asp:TextBox ID="TextBox3" runat="server" Width="80px"></asp:TextBox>
&nbsp;-
                <asp:TextBox ID="TextBox4" runat="server" Width="80px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="SEARCH" Width="110px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RANK:
                <asp:TextBox ID="TextBox5" runat="server" Width="33px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="SEARCH" Width="110px" />
   

         </p>
        <p style="margin-left: 160px; font-size: medium;">
            <br />
   

         </p>
   

         <asp:GridView ID="ViewMovies" runat="server" BackColor="White" BorderColor="#CCFFFF" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="978px">
             <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
             <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
             <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F7F7F7" />
             <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
             <SortedDescendingCellStyle BackColor="#E5E5E5" />
             <SortedDescendingHeaderStyle BackColor="#242121" />
         </asp:GridView>

          


           <br />
 
 <table style="width:30%; background-color: #5D7B9D; font-size: 16px;" border="1" id="table_insert" aria-live="off">
                <tr>
                    <td class="modal-lg" style="width: 2606px; text-align:center; font-weight: bolder; color: #FFFFFF;">SELECT MOVIE ID</td>
               
                    <td class="modal-sm" style="width: 66px">
                        <asp:TextBox ID="TextMovieID" runat="server" TextMode="Number" Width="47px"></asp:TextBox>
                    </td>
               
                    <td class="modal-sm" style="width: 187px">
                        <asp:Button ID="insert_button" runat="server" Text="BUY" BackColor="#5D7B9D" BorderStyle="None" Font-Bold="True" style="margin-left:0px" Width="130px" ForeColor="White" OnClick="insert_button_Click" />
                    </td>
               
                </tr>
                </table>  

      
      <br />
    
        <asp:GridView ID="ViewOrders" runat="server" AutoGenerateColumns="False" OnRowDeleting="ViewOrders_RowDeleting" Width="981px" OnRowCancelingEdit="ViewOrders_RowCancelingEdit" OnRowEditing="ViewOrders_RowEditing" OnRowUpdating="ViewOrders_RowUpdating" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
         <Columns>

             <asp:TemplateField HeaderText="ORDER_ID">
                 <ItemTemplate>
                     <asp:Label ID="lblID" runat="server" Text='<%#Eval("ORDER_ID") %>' />
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:Label ID="lblID" runat="server" Text='<%#Eval("ORDER_ID") %>' />
                 </EditItemTemplate>
             </asp:TemplateField>

             <asp:TemplateField HeaderText="ORDER_DATE">
                 <ItemTemplate>
                     <%#Eval("ORDER_DATE") %>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtDate" Text='<%# Eval("ORDER_DATE") %>' runat="server" />
                 </EditItemTemplate>
             </asp:TemplateField>

              <asp:TemplateField HeaderText="MOVIE_ID">
                 <ItemTemplate>
                     <%#Eval("MOVIE_ID") %>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtMovie" Text='<%# Eval("MOVIE_ID") %>' runat="server" />
                 </EditItemTemplate>
             </asp:TemplateField>

              <asp:TemplateField HeaderText="NET_AMOUNT">
                 <ItemTemplate>
                     <%#Eval("NET_AMOUNT") %>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtNet" Text='<%# Eval("NET_AMOUNT") %>' runat="server" />
                 </EditItemTemplate>
             </asp:TemplateField>

              <asp:TemplateField HeaderText="DISCOUNT">
                 <ItemTemplate>
                     <%#Eval("DISCOUNT") %>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtDisc" Text='<%# Eval("DISCOUNT") %>' runat="server" />
                 </EditItemTemplate>
             </asp:TemplateField>

              <asp:TemplateField HeaderText="GROSS_AMOUNT">
                 <ItemTemplate>
                     <%#Eval("GROSS_AMOUNT") %>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="txtGross" Text='<%# Eval("GROSS_AMOUNT") %>' runat="server" />
                 </EditItemTemplate>
             </asp:TemplateField>

               <asp:TemplateField HeaderText="EDIT">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" CommandName="Edit" runat="server" >Edit</asp:LinkButton>
                    </ItemTemplate>
                   <EditItemTemplate>
                       <asp:LinkButton ID="lnkEdit" CommandName="Update" runat="server">Update</asp:LinkButton>
                       <asp:LinkButton ID="LinkButton1" CommandName="Cancel" runat="server">Cancel</asp:LinkButton>
                   </EditItemTemplate>
               </asp:TemplateField>
          
              <asp:TemplateField HeaderText="DELETE">
                <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" CommandName="Delete" runat="server" >Delete</asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>
                   
         </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>


<%--           <asp:GridView ID="ViewOrders" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="985px" OnRowDeleting="ViewOrders_RowDeleting" OnRowUpdating="ViewOrders_RowUpdating">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               <Columns>
                   <asp:ButtonField ButtonType="Button" CommandName="Delete" ShowHeader="True" Text="DELETE" />
                   <asp:ButtonField ButtonType="Button" CommandName="Update" ShowHeader="True" Text="UPDATE" />              
               </Columns>
               <EditRowStyle BackColor="#999999" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#E9E7E2" />
               <SortedAscendingHeaderStyle BackColor="#506C8C" />
               <SortedDescendingCellStyle BackColor="#FFFDF8" />
               <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
           </asp:GridView>--%>


           </div>

           <br />

    </div>
    
</asp:Content>
