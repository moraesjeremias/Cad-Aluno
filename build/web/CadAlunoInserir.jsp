<%-- 
    Document   : CadAlunoInserir
    Created on : 29 de out de 2019, 19:52:21
    Author     : Jeremias Moraes
--%>

<%@page import="java.util.Set"%>
<%@page import="modelo_aluno.clsAluno"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CadAlunoInserir</title>
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
            <table width="1024" border="1" align="center">
                <tr>
                    <td colspan="2" align="center">Cadastro de Aluno</td>
                </tr>
                <tr>
                    <td width="126">Código</td>
                    <td width="483"><input type="text" name="txtCodigoAluno" value=""/></td>
                </tr>
                <tr>
                    <td>Nome</td>
                    <td><input type="text" name="txtNomeAluno" value=""/></td>
                </tr>
                <tr>
                    <td>Avaliação 1</td>
                    <td><input type="text" name="txtAvaliacao1" value=""/></td>
                </tr>
                <tr>
                    <td>Avaliação 2</td>
                    <td><input type="text" name="txtAvaliacao2" value=""/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Inserir" name="btnOperacao"/></td>
                </tr>
            </table>
        </form>
        <br><br>
        <table width="1024" border="1" align="center">
            <tr>
                <td colspan="7" align="center">Lista de Alunos</td>
            </tr>
            <tr>
                <td width="70" align="center">Cód</td>
                <td align="center">Nome</td>
                <td width="50" align="center">A1</td>
                <td width="50" align="center">A2</td>
                <td width="50" align="center">Média</td>
                <td width="70" align="center">Alterar</td>
                <td width="70" align="center">Excluir</td>
            </tr>
            <%
                Hashtable<Integer, clsAluno> hstAluno = null;
                hstAluno = (Hashtable<Integer, clsAluno>) getServletContext().getAttribute("hstAluno");
                if (hstAluno != null) {
                    Set<Integer> setCodAluno = hstAluno.keySet();
                    
                    for (Integer CodAluno : setCodAluno) {
                        clsAluno o_Aluno = hstAluno.get(CodAluno);
                        if (o_Aluno.Avaliacao1 == null) {
                            o_Aluno.Avaliacao1 = 0.0f;
                        }
                        
                        if (o_Aluno.Avaliacao2 == null) {
                            o_Aluno.Avaliacao2 = 0.0f;
                        }
                        
                        Float Media;
                        
                        if (o_Aluno.Avaliacao1 > 0 || o_Aluno.Avaliacao1 > 0) {
                            Media = (float) (o_Aluno.Avaliacao1 + o_Aluno.Avaliacao2)/ 2;
                        } 
                        
                        else {
                            Media = 0.0f;
                        }
                        
                        out.println("<tr>");
                        out.println("<td width=70 align=center>&nbsp; " + o_Aluno.CodAluno + "</td>");
                        out.println("<td>&nbsp;" + o_Aluno.NomeAluno + "</td>");
                        out.println("<td width=50 align=center>&nbsp;" + o_Aluno.Avaliacao1 + "</td>");
                        out.println("<td width=50 align=center>&nbsp;" + o_Aluno.Avaliacao2 + "</td>");
                        out.println("<td width=50 align=center>&nbsp;" + Media + "</td>");
                        out.println("<td width=70 align=center><a href=CadAlunoAlterar.jsp?CodAluno=" + o_Aluno.CodAluno + " > Alterar </a></td>");
                        out.println("<td width=70 align=center><a href=CadAlunoExcluir.jsp?CodAluno=" + o_Aluno.CodAluno + " > Excluir </a></td> ");
                        out.println("</tr>");
                    }
                }
            %>
        </table>
    </body>
</html>