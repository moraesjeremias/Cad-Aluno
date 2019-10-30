<%-- 
    Document   : CadAlunoExcluir
    Created on : 29 de out de 2019, 19:52:52
    Author     : Jeremias Moraes
--%>

<%@page import="modelo_aluno.clsAluno"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CadAlunoExcluir</title>
    </head>
    <body>
        <table width="1024" border="1" align="center">
            <tr>
                <td width="119" height="99">&nbsp;</td>
                <td width="781">&nbsp;</td>
                <td width="102" align="center">&nbsp;</td>
            </tr>
        </table>
        <br><br>
        <form name="frmCadastro" action="ControleAluno" method="POST">
            <%
                String pCodAluno = request.getParameter("CodAluno");
                Integer CodAluno = Integer.parseInt(pCodAluno);
                Hashtable<Integer, clsAluno> hstAluno = null;
                hstAluno = (Hashtable<Integer, clsAluno>) getServletContext().getAttribute("hstAluno");
                clsAluno o_Aluno = hstAluno.get(CodAluno);
            %>
            <table width="1024" border="1" align="center">
                <tr>
                    <td colspan="2" align="center">Excluir Dados de Aluno</td>
                </tr>
                <tr>
                    <td width="126">Código</td>
                    <td width="483"><input type="text" readonly="readonly" name="txtCodigoAluno" value="<%= o_Aluno.CodAluno%>"/></td>
                </tr>
                <tr>
                    <td>Nome</td>
                    <td><input type="text" readonly="readonly" name="txtNomeAluno" value="<%= o_Aluno.NomeAluno%>"/></td>
                </tr>
                <tr>
                    <td>Avaliação 1</td>
                    <td><input type="text" readonly="readonly" name="txtAvaliacao1" value="<%= o_Aluno.Avaliacao1%>"/></td>
                </tr>
                <tr>
                    <td>Avaliação 2</td>
                    <td><input type="text" readonly="readonly" name="txtAvaliacao2" value="<%= o_Aluno.Avaliacao2%>"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Cancelar" name="btnOperacao"/> &nbsp;&nbsp; <input type="submit" value="Excluir" name="btnOperacao"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">Deseja realmente excluir este registro?</td>
                </tr>
            </table>
        </form>
        <br><br>
    </body>
</html>