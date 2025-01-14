#include 'Protheus.ch'


/*/{Protheus.docn CustomerVendor
CustomerVendor é o nome do ID do Model dentro do fonte padrao do cadastro de fornecedor(mata010)
@type user function
@author Priscila Zavitoski
@since 14/01/2025
@version version
@param param_name, param_type, param_descr
@return return_var, return_type, return_description
@example
(examples)
@see (links_or_references)
/*/
User Function CustomerVendor()
Local xRet   := .T. 
Local aParam := PARAMIXB
Local cRazSoc  := AllTrim(M->A2_NOME) //RAZÃO SOCIAL
Local cFantasia := AllTrim(M->A2_NREDUZ) //NOME REDUZIDO

Local oObject    := aParam[1] //Objeto de formulario ou do modelo, conforme o caso
Local cIdPonto   := aParam[2] //ID do local de execução do ponto de entrada (se é pos validação, pre validação, comit, etc)
Local cIdModel   := aParam[3] //Id do formulario

IF aParam[2] <> Nil //(se clicar em incluir/alterar/excluir/visualizar)
    IF CidPonto == "MODELPOS" //se estiver na pos validação(clicou em confirma)
        IF Len (cRazSoc) <20
             Help(Nil,Nil,"RAZSOC",Nil,"Razao social invalida",;
            1,0,Nil,Nil,Nil,Nil,Nil,{"A Razão Social <b> "+cRazSoc+ "</b> deve ter no minimo <b>20</b20> caracteres"})
            xRet :=.F.
                     
        ELSEIF Len (cFantasia) <10
            Help(Nil,Nil,"NOMEFAN",Nil,"Nome Fnatasia Invalido",;
            1,0,Nil,Nil,Nil,Nil,Nil,{"O Nome Fantasia <b> "+cFantasia+ "</b> deve ter no minimo <b>10</b10>10 caracteres"})
              
        
             xRet := .F.
        ENDIF   

    ELSEIF cIdPonto == "BUTTONBAR"
        xRet := {{"Produto x Fornecedor","Produto x Fornecedor",{||MATA061()},"Cahama a amarração Prod x Forn"}}
    ENDIF
ENDIF    


Return xRet
