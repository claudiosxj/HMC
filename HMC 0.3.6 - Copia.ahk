



SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  





Gui, Add, Tab2, w275 h535, HUAWEI |JUNIPER | RADIUS | COMERCIAL
Gui, Add, Button, x20 y50 w250 h30 gBUSCAR_->_CTOP_/_COD_/_NOME , BUSCAR -> CTOP / COD / NOME 
Gui, Add, Button, x20 y80 w250 h30 gSINAL , SINAL  -> 1 CLIENTE OU 1 CAIXA
Gui, Add, Button, x20 y110 w250 h30 gSTATUS_DA_PORTA_DA_ONU , STATUS DA PORTA DA ONU
Gui, Add, Button, x20 y140 w250 h30 gREINICIAR_ONU , REINICIAR ONU
Gui, Add, Button, x20 y170 w250 h30 GBUSCAR_->_SN ,  BUSCAR -> SN 
Gui, Add, Button, x20 y200 w250 h30 gBUSCAR_->_MAC_DO_ROTEADOR , BUSCAR -> BUSCAR COM O MAC DO ROTEADOR
Gui, Add, Button, x20 y230 w250 h30 gBUSCAR_O_MAC_DO_ROTEADOR , BUSCAR O MAC DO ROTEADOR
Gui, Add, Button, x20 y260 w250 h30 gVER_PON , VER PON 
Gui, Add, Button, x20 y290 w250 h30 gVER_SUMMARY , VER SUMMARY
Gui, Add, Button, x20 y320 w250 h30 gCLIENTE_OFF_PON,BATER CAIXA
Gui, Add, Button, x20 y350 w250 h30 gSERVICE_PORT_DA_ONU, SERVICE-PORT -> ADD | REMOVE
Gui, Add, Button, x20 y380 w250 h30 gAUTOFIND, AUTOFIND
Gui, Add, Button, x20 y410 w250 h30 gADICIONAR, ADICIONAR
Gui, Add, Button, x20 y440 w250 h30 gDELETAR, DELETAR
Gui, Add, Button, x20 y470 w250 h30 gNOMEAR, NOMEAR
Gui, Add, Button, x20 y500 w125 h30 gLogin_Putty, Login Putty
Gui, Add, Button, x145 y500 w125 h30 gLogin_CMD, Login CMD


Gui, Tab, 2
Gui, Add, Button, x20 y50 w250 h50 gVER_CLIENTE_ONLINE , VER CLIENTE ONLINE
Gui, Add, Button, x20 y100 w250 h50 gDESCONECTAR_CLIENTE , DESCONECTAR CLIENTE
Gui, Add, Button, x20 y150 w250 h50 gCONSUMO , VER CONSUMO EM TEMPO REAL
Gui, Add, Button, x20 y200 w250 h50 gLocalizar_com_mac , LOCALIZAR CLIENTE COM O MAC DO ROTEADOR

Gui, Tab, 3
Gui, Add, Button, x20 y50 w250 h50 , VER LOG DE AUTENTICAÇÃO

Gui, Tab, 4
Gui, Add, Button, x20 y50 w250 h50 gCALCULAR_FIDELIDADE , CALCULAR FIDELIDADE
Gui, Add, Button, x20 y100 w250 h50 gCALCULAR_PROPORCIONAL , CALCULAR PROPORCIONAL





Gui, Show, w300 h550, HMC - Rede

return

Global UserInput
Global dado
Global ultimo

BUSCAR_->_CTOP_/_COD_/_NOME:

;-- BUSCAR CTOP COD NOME

MsgBox,0, INFORMAÇÕES!, Busca Por descrição!`n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Busca Por nome,cod e CTOP!","Digite a CTOP ou COD ou NOME da ONU! `n`n*NOME DO CLIENTE -> Tem que ser igual do Integrator `n*CAIXA -> ""JDA 014"" ou ""TLG - CTOP - JDA"" `n*CÓDIGO DO CLIENTE -> 25458 `n`n`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
ctopcodnome =%dado%
StringUpper, ctopcodnome, ctopcodnome
ativarconsole()
Send, display ont inf by-desc "%ctopcodnome%" | no-more
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
return
;==============================================
BUSCAR_->_SN:
;-- BUSCAR SN
MsgBox,0, INFORMAÇÕES!, Busca Por SN!`n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Busca por SN!","Digite o SN da ONU! `n`nExemplo: `n 44443142B36AC0D4 `n`n Obs: não precisa ser todo o SN`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
sn =%dado%
StringUpper, sn, sn
ativarconsole()
Send, display ont inf by-sn "%sn%" | no-more
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
return
;======================================================
BUSCAR_->_MAC_DO_ROTEADOR:


;-- BUSCAR MAC
MsgBox,0, INFORMAÇÕES!, Busca Por Mac do roteadr!`n`nAperte CTRL+'' para PARAR a qualquer momento!
verifica_entrada(UserInput,"Busca por Mac do roteador!","Digite o Mac do roteador! `n`nExemplo `n`nInteiro -> 98DA-C414-C0AC`n`nParte do Mac -> 14-C0AC`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
mac =%dado%
StringLower, mac, mac
ativarconsole()
Send, display mac-address all | include "%mac%"
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
return
;======================================================

SERVICE_PORT_DA_ONU:
;-- ver se onu tem service-port


MsgBox,0, INFORMAÇÕES!, Verificar e trocar Service-port da ONU!`n`nÉ nescessário Slot,PON e ID da ONU`n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Verificar e trocar Service-port da ONU!","Digite somente o número do Slot! `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Verificar e trocar Service-port da ONU!","Digite a PON da ONU! `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+")
pon =%dado%
verifica_entrada(UserInput,"Verificar e trocar Service-port da ONU!","Digite o ID da ONU! `n`nExemplo: 12`n`nProgresso:0/" slot "/" pon "`n`n**Aperte CTRL+")
id =%dado%
ativarconsole()
Send,display service-port port 0/%slot%/%pon% ont %id%
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}

;-- remove service port --
MsgBox, 4,Delete Service-port!, Deseja deletar este Service-port desta onu? `n`n -> 0/%slot%/%pon% `n-> ID: %id%
IfMsgBox Yes
    nomear =1
else
    nomear =0


if (nomear = 1 ){
    verifica_entrada(UserInput,"Removendo o Service-port","Digite somente o número do SERVICE-PORT! `n`n Exemplo: 256 `n`nProgresso:0/" slot "/" pon "`nSN: " sn "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
    service_port =%dado%
    Sleep, 400
    ativarconsole()
    Send, undo service-port %service_port%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    
}
;-- add service port --
MsgBox, 4,Add Service-port!, Deseja adicionar Service-port a onu? `n`n -> 0/%slot%/%pon% `n-> ID: %id%
IfMsgBox Yes
    nomear =1
else
    nomear =0
if (nomear = 1 ){
Sleep, 400
verifica_entrada(UserInput,"Adicionando a VLAN da ONU!","Digite a VLAN da ONU! `n`nExemplo: 256 `n`nProgresso: 0/" slot "/" pon "`nSN: " sn "`nONU ID: " id "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
vlan =%dado%
Sleep, 400
ativarconsole()
Send,service-port %id%%vlan% vlan %vlan% gpon 0/%slot%/%pon% ont %id% eth 1 multi-service user-vlan untagged tag-transform default
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
}

return
;======================================================
ADICIONAR:

; --Coleta de dados inicial--

MsgBox,0, INFORMAÇÕES!, Adicionar ONU!`n`nÉ nescessário Slot, PON, ID e SN`n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Adicionar ONU!","Digite somente o número do Slot! `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Adicionar ONU!","Digite somente o número do a Pon! `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+' para PARAR a qualquer momento!**")
pon =%dado%
verifica_entrada(UserInput,"Adicionar ONU!","Digite somente o número do SN! `n`nExemplo: 44443142B36AC0D4 `n`nProgresso:0/" slot "/" pon "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
sn =%dado%
StringUpper, sn, sn

; --acessar slot--
ativarconsole()
Send, interface gpon 0/%slot%
Sleep, 400
Send, {ENTER}
Sleep, 400


; --Acessar pon--
ativarconsole()
Send,display ont info %pon% all | no-more
Send, {ENTER}
Sleep, 400
Send, {ENTER}

; --add onu--
verifica_entrada(UserInput,"Adicionar ONU!","Digite o ID da ONU! `n `nExemplo: 12 `n`nProgresso: 0/" slot "/" pon "`nSN: " sn "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
id =%dado%
ativarconsole()
Send,ont add %pon% %id% sn-auth %sn% omci
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 400
Send,quit
Send, {ENTER}

; --tag onu--
Sleep, 400
verifica_entrada(UserInput,"Adicionar ONU!","Digite a VLAN da ONU! `n`nExemplo: 256 `n`nProgresso: 0/" slot "/" pon "`nSN: " sn "`nONU ID: " id "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
vlan =%dado%
Sleep, 400
ativarconsole()
Send,service-port %id%%vlan% vlan %vlan% gpon 0/%slot%/%pon% ont %id% eth 1 multi-service user-vlan untagged tag-transform default
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}


; --Nomear ONU--
MsgBox, 4,, Deseja Nomear ONU %id%?
IfMsgBox Yes
    nomear =1
else
    nomear =0

if (nomear = 1 ){
    verifica_entrada(UserInput,"Adicionar ONU!","Digite o Property! `n`nSiga o padrão! `n`nTLG - CTOP - XXX 000 - S00 - CLIENTE - COD`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
    property =%dado%
    Sleep, 400
    ativarconsole()
    Send, interface gpon 0/%slot%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    ativarconsole()
    Send,ont modify %pon% %id% desc "%property%"
    Sleep, 400
    Send, {ENTER}
    Send,quit
    Send, {ENTER}
    Sleep, 400
    MsgBox,0 , ONU Aceita!, A ONU foi nomeada!
    
}else{
    MsgBox,0 , ONU Aceita!, A ONU NÂO foi nomeada!
	}


MsgBox, 0,Mostrando ONU Aceita!, Vai ser mostrado a ONU Aceita! `n`nProgresso: 0/ %slot% / %pon% `nID: %id%`nSN: %sn% 
    ativarconsole()
    Send, display ont inf by-desc "%property%" | no-more
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    Send, {ENTER}


; --ver sinal--
MsgBox, 4,, Deseja ver o sinal da ONU %id%?
IfMsgBox Yes
    nomear =1
else
    nomear =0


 if (nomear = 1 ){
    ativarconsole()
    Send, interface gpon 0/%slot%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    ativarconsole()
    Send, display ont info summary %pon% | include %sn%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    Send, {ENTER}
    Sleep, 2000
    Send,quit
    Send, {ENTER}
    Sleep, 400
    
}


return 
return 
========================================================
DELETAR:
; --Coleta de dados inicial--


MsgBox,0, INFORMAÇÕES!, Deletando uma ONU!`n`nAperte CTRL+'' para PARAR a qualquer momento!


verifica_entrada(UserInput," Deletando uma ONU!","Digite somente o número do Slot! `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput," Deletando uma ONU!","Digite somente o número do a Pon! `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+' para PARAR a qualquer momento!**")
pon =%dado%
verifica_entrada(UserInput," Deletando uma ONU!","Digite somente o número do ID! `n`nExemplo: 50 `n`nProgresso:0/" slot "/" pon "`nSN: " sn "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
id =%dado%
; --VERIFICA SERVICE PORT--
ativarconsole()
Send, display service-port port 0/%slot%/%pon% ont %id%
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}


;--DELETE SERVICE PORT--
MsgBox, 4,, A ONU %id% possuí service-port?
IfMsgBox Yes
    nomear =1
else
    nomear =0


if (nomear = 1 ){
    verifica_entrada(UserInput," Deletando uma ONU!","Digite somente o número do SERVICE-PORT! `n`n Exemplo: 256 `n`nProgresso:0/" slot "/" pon "`nSN: " sn "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
    service_port =%dado%
    Sleep, 400
    ativarconsole()
    Send, undo service-port %service_port%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    
}else{
    MsgBox  A ONU NÃO TEM SERVICE-PORT.
	}

; --deletar ONU--
MsgBox, 4,, Deseja deletar ONU %id%?
IfMsgBox Yes
    nomear =1
else
    nomear =0


if (nomear = 1 ){
    ativarconsole()
    Send, interface gpon 0/%slot%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    ativarconsole()
    Send, ont delete %pon% %id%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    Send, quit
    Sleep, 400
    Send, {ENTER}

;-- Mostrando onu Deletada
MsgBox, 0,Mostrando ONU Deletada, Vai ser mostrado a ONU Deletada! `n`nProgresso: 0/ %slot% / %pon% `nID: %id%`nSN: %sn% 
ativarconsole()
Send, interface gpon 0/%slot%
Sleep, 400
Send, {ENTER}
Sleep, 400


; --Acessar pon--
ativarconsole()
Send,display ont info %pon% all | no-more
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 2000
Send,quit
Sleep, 400
Send, {ENTER}
}else{
    MsgBox  ONU NÃO DELETADA, 
	}


return
;======================================================
NOMEAR:

MsgBox,0, INFORMAÇÕES!, Nomeando ONU!`n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Nomeando ONU!","Digite somente o número do Slot `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Nomeando ONU!","Digite somente o número do a Pon! `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+' para PARAR a qualquer momento!**")
pon =%dado%
verifica_entrada(UserInput,"Nomeando ONU!","Digite somente o ID da ONU! Exemplo: 50 `n`nProgresso:0/" slot "/" pon "`nSN: " sn "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
id =%dado%
verifica_entrada(UserInput,"Nomeando ONU!","Digite o Property! `n`nSiga o padrão! `n`nTLG - CTOP - XXX 000 - S00 - CLIENTE - COD`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
property =%dado%
    Sleep, 400
    ativarconsole()
    Send, interface gpon 0/%slot%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    ativarconsole()
    Send,ont modify %pon% %id% desc "%property%"
    Sleep, 400
    Send, {ENTER}
    Send,quit
    Send, {ENTER}
    Sleep, 400
    ativarconsole()
    MsgBox, 0,A ONU foi nomeada!, Vai ser mostrado a ONU nomeada! `n`nProgresso: 0/ %slot% / %pon% `nID: %id%`nSN: %sn% 
    Send, display ont inf by-desc "%property%" | no-more
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    Send, {ENTER}

    MsgBox, 4,Nomear cliente!, Deseja nomear outro cliente na mesma pon?  0/%slot%/%pon% ? `n`nProgresso: 0/%slot%/%pon%
IfMsgBox Yes
    nomear =1
else
    nomear =0


if (nomear = 1 ){
while(nomear =1){
Sleep, 400
verifica_entrada(UserInput,"Nomeando ONU!","Digite somente o ID da ONU! Exemplo: 50 `n`nProgresso:0/" slot "/" pon "`nSN: " sn "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
id =%dado%
verifica_entrada(UserInput,"Nomeando ONU!","Digite o Property! `n`nSiga o padrão! `n`nTLG - CTOP - XXX 000 - S00 - CLIENTE - COD`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
property =%dado%
    ativarconsole()
    Send, interface gpon 0/%slot%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    ativarconsole()
    Send,ont modify %pon% %id% desc "%property%"
    Sleep, 400
    Send, {ENTER}
    Send,quit
    Send, {ENTER}
    Sleep, 400
    ativarconsole()
    MsgBox, 0,A ONU foi nomeada!, Vai ser mostrado a ONU nomeada! `n`nProgresso: 0/ %slot% / %pon% `nID: %id%`nSN: %sn% 
    Send, display ont inf by-desc "%property%" | no-more
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    Send, {ENTER}
MsgBox, 4,Nomear cliente!, Deseja nomear outro cliente na mesma pon?  0/%slot%/%pon% ? `n`nProgresso: 0/%slot%/%pon%
IfMsgBox Yes
    nomear =1
else
    nomear =0

}
}


return
;======================================================
SINAL:
;-- VER SINAL

MsgBox,0, INFORMAÇÕES!, Ver sinal de 1 cliente ou de 1 caixa`n`n1) Para ver o sinal de 1 cliente digite o SN`n`n2) Para ver o sinal de 1 caixa digite o nome da caixa `n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Ver sinal!","Digite somente o número do Slot! `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Ver sinal!","Digite somente o número do a Pon! `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+' para PARAR a qualquer momento!**")
pon =%dado%
verifica_entrada(UserInput,"Ver sinal!","Digite somente o número do SN ou a Caixa! `n`nExemplo: 44443142B36AC0D4 ou JDA 014`n`nObs: não precisa ser todo o SN`n`nProgresso:0/" slot "/" pon "`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
sn =%dado%
StringUpper, sn, sn

ativarconsole()
Send, interface gpon 0/%slot%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    ativarconsole()
    Send, display ont info summary %pon% | include %sn% 
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    Send, {ENTER}
    Sleep, 5000
    Send,quit
    Send, {ENTER}
    Sleep, 400
return
;======================================================
VER_PON:
;-- VER PON
verifica_entrada(UserInput,"Ver pon!","Digite somente o número do Slot! `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Ver pon!","Digite somente o número do a Pon! `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+")
pon =%dado%

; --acessar slot--
ativarconsole()
Send, interface gpon 0/%slot%
Sleep, 400
Send, {ENTER}
Sleep, 400


; --Acessar pon--
ativarconsole()
Send,display ont info %pon% all | no-more
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 2000
Send,quit
Sleep, 400
Send, {ENTER}


return
;========================================================
VER_SUMMARY:

;-- VER SUMMARY

verifica_entrada(UserInput,"Ver Summary!","Digite somente o número do Slot `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Ver Summary!","Digite somente o número do a Pon `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+")
pon =%dado%

; --acessar slot--
ativarconsole()
Send, interface gpon 0/%slot%
Sleep, 400
Send, {ENTER}
Sleep, 400


; --ver summary pon--
ativarconsole()
Send, display ont info summary %pon% | no-more
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 800
Send,quit
Sleep, 400
Send, {ENTER}

return
;========================================================
Login_Putty:
;--Login Putty--

Run, cmd.exe,,,
Sleep,400
Send,putty 172.18.3.18
Sleep ,200
Send, {enter}
Sleep ,800
WinClose,C:\Windows\SYSTEM32\cmd.exe
Sleep,400
Send, suporte
Sleep,400
Send, {enter}
Sleep,400
Send,systemap1
Sleep,400
Send, {enter}
Sleep,200
Send, enable {enter}
Sleep,200
Send, config {enter}
Sleep,200
Send, idle-timeout 255 {enter}
return

;========================================================
Login_CMD:

;--Login CMD--
Run, cmd.exe,,,
Sleep,400
Send,ssh suporte@172.18.3.18
Sleep ,400
Send, {enter}
Sleep,2500
Send,systemap1
Sleep,400
Send, {enter}
Sleep,400
Send, enable {enter}
Sleep,400
Send, config {enter}
Sleep,400
Send, idle-timeout 255 {enter}
return
;========================================================
stop:
; -- Finaliza Scrtip
MsgBox, 0 , PARADO COM SUCESSO, PARADO COM SUCESSO.
Reload
Return


;========================================================
AUTOFIND:

;--AUTOFIND--



ativarconsole()
Send, display ont autofind all | no-more
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
return

;========================================================


CLIENTE_OFF_PON:

;--bate caixa--


;--mostra pon--
MsgBox,0, INFORMAÇÕES!, Bater Caixa!`n`nAperte CTRL+'' para PARAR a qualquer momento!
verifica_entrada(UserInput,"Digite a CTOP que vai bater!","Digite a CTOP `n`n*CAIXA -> ""JDA 014"" ou ""TLG - CTOP - JDA""`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
ctopcodnome =%dado%
StringUpper, ctopcodnome, ctopcodnome
ativarconsole()
Send, display ont inf by-desc "%ctopcodnome%" | no-more
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 1000

;-- contar off--
verifica_entrada(UserInput,"Bater Caixa!","Digite somente o número do Slot `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Bater Caixa!","Digite somente o número do a Pon `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+")
pon =%dado%
ativarconsole()
Send, display ont info summary 0/%slot%/%pon% | include offline | no-more
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 3000
Send,  display ont info summary 0/%slot%/%pon% | include offline | count 
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}

; -- bater com os mesmo dados
MsgBox, 4,Bater Caixa!, Deseja Bater caixa %ctopcodnome% novamente? `n`nCaixa: %ctopcodnome%`nProgresso: 0/%slot%/%pon%
IfMsgBox Yes
    nomear =1
else
    nomear =0


if (nomear = 1 ){
while(nomear =1){
;-- mostra pon
ativarconsole()
Send, display ont inf by-desc "%ctopcodnome%" | no-more
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 10000

ativarconsole()
Send, display ont info summary 0/%slot%/%pon% | include offline | no-more
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 3000
Send,  display ont info summary 0/%slot%/%pon% | include offline | count 
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
MsgBox, 4,Bater Caixa!, Deseja Bater caixa %ctopcodnome% novamente? `n`nCaixa: %ctopcodnome%`nProgresso: 0/%slot%/%pon%
IfMsgBox Yes
    nomear =1
else
    nomear =0

}
}


return


;========================================================

BUSCAR_O_MAC_DO_ROTEADOR:
;-- buscar o mac do roteador --

MsgBox,0, INFORMAÇÕES!, Localizar mac do roteador com o service-port `n`nÉ nescessário Slot,PON e ID da ONU`n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Localizar mac do roteador com o service-port!","Digite somente o número do Slot! `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Localizar mac do roteador com o service-port!","Digite a PON da ONU! `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+")
pon =%dado%
verifica_entrada(UserInput,"Localizar mac do roteador com o service-port!","Digite o ID da ONU! `n`nExemplo: 12`n`nProgresso:0/" slot "/" pon "`n`n**Aperte CTRL+")
id =%dado%
ativarconsole()
Send,display service-port port 0/%slot%/%pon% ont %id%
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 400
verifica_entrada(UserInput,"Localizar mac do roteador com o service-port!","Digite o service-port da ONU! `n`nExemplo: 12`n`nProgresso:0/" slot "/" pon "`n`n**Aperte CTRL+")
service_port =%dado%

ativarconsole()
Send,display mac-address service-port %service_port%
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}

return
;========================================================
Localizar_com_mac:


;Localizar plano do cliente com o mac do roteador
MsgBox,0, INFORMAÇÕES!, Localizar plano do cliente com o mac do roteador! `n`nÉ nescessário o mac do roteador no segunte formato!`n`Mac: xx:xx:xx:xx n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Localizar mac do roteador com o service-port!","Digite somente o mac do roteador! `n`nExemplo: 50:c7:bf:d5:51:f5`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
macdoroteador =%dado%
StringLower, macdoroteador, macdoroteador
ativarconsole_juniper()
Send,show subscribers mac-address %macdoroteador%
Sleep, 400
Send, {ENTER}
Sleep, 400


return
;========================================================
VER_CLIENTE_ONLINE:
;-- ver cliente online com pppoe

MsgBox,0, INFORMAÇÕES!, Ver cliente conectado no JUNIPER! `n`n `nExemplo: celioac@redeconectividade.com.br `n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Localizar mac do roteador com o service-port!","O pppoe do cliente! `n`nExemplo: elioac@redeconectividade.com.br`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
pppoe =%dado%
ativarconsole_juniper()
Send,show subscribers user-name %pppoe% extensive | no-more		
Sleep, 400
Send, {ENTER}
Sleep, 400

return
;========================================================
DESCONECTAR_CLIENTE:

;-- DESCONECTAR CLIENTE JUNNIPER

MsgBox,0, INFORMAÇÕES!, Desconectar cliente conectado no JUNIPER! `n`n `nExemplo: celioac@redeconectividade.com.br `n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Desconectar cliente no JUNIPER!","O pppoe do cliente! `n`nExemplo: elioac@redeconectividade.com.br`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
pppoe =%dado%
ativarconsole_juniper()
Send,clear network-access aaa subscriber username %pppoe%			
Sleep, 400
Send, {ENTER}
Sleep, 400


return

;========================================================
CONSUMO:
;-- CONSUMO

MsgBox,0, INFORMAÇÕES!, Ver consumo cliente Juniper, digite o pp0.! `n`n `nExemplo: pp0.3221927635 `n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Desconectar cliente no JUNIPER!","Digite o pp0. `n`nExemplo: cpp0.3221927635 `n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
pp0 =%dado%
ativarconsole_juniper()
Send,monitor interface %pp0%		
Sleep, 400
Send, {ENTER}
Sleep, 400
return

;====================================================
REINICIAR_ONU:

;-- REINICAR ONU

MsgBox,0, INFORMAÇÕES!, Reiniciar uma ONU!`n`nÉ nescessário Slot, PON e ID da ONU`n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Reiniciar uma ONU!","Digite somente o número do Slot! `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Reiniciar uma ONU!","Digite a PON da ONU! `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+")
pon =%dado%
verifica_entrada(UserInput,"Reiniciar uma ONU!","Digite o ID da ONU! `n`nExemplo: 12`n`nProgresso:0/" slot "/" pon "`n`n**Aperte CTRL+")
id =%dado%

MsgBox,4, INFORMAÇÕES!, Reiniciar a ONU? 0/%slot%/%pon% ID: %id% `n`nProgresso: 0/%slot%/%pon%`n`nAperte CTRL+'' para PARAR a qualquer momento!
IfMsgBox Yes
    nomear = 1
else
    nomear = 0




If (nomear = 1 ){
    ativarconsole()
    Send, interface gpon 0/%slot%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    ativarconsole()
    Send, ont reset %pon% %id%
    Sleep, 400
    Send, {ENTER}
    Sleep, 400
    Send, y {ENTER}
    send, quit {enter}
    Sleep, 400
    MsgBox,0, INFORMAÇÕES!, A onu foi reiniciada!`n`nAperte CTRL+'' para PARAR a qualquer momento!

}else{
    MsgBox,0, INFORMAÇÕES!, Reinicio cancelado!`n`nAperte CTRL+'' para PARAR a qualquer momento!

}



return
;========================================================
STATUS_DA_PORTA_DA_ONU:

;-- STATUS DA PORTA

MsgBox,0, INFORMAÇÕES!, Verificar status da porta!`n`nÉ nescessário Slot, PON e ID da ONU`n`nAperte CTRL+'' para PARAR a qualquer momento!

verifica_entrada(UserInput,"Verificar status da porta!","Digite somente o número do Slot! `n`nExemplo: 12`n`n**Aperte CTRL+'' para PARAR a qualquer momento!**")
slot =%dado%
verifica_entrada(UserInput,"Verificar status da porta!","Digite a PON da ONU! `n`nExemplo: 12`n`nProgresso:0/" slot "/--`n`n**Aperte CTRL+")
pon =%dado%
verifica_entrada(UserInput,"Verificar status da porta!","Digite o ID da ONU! `n`nExemplo: 12`n`nProgresso:0/" slot "/" pon "`n`n**Aperte CTRL+")
id =%dado%
ativarconsole()
Send, interface gpon 0/%slot%
Sleep, 400
Send, {ENTER}
Sleep, 400
Send,display ont port state %pon% %id% eth-port all
Sleep, 400
Send, {ENTER}
Sleep, 400
Send, {ENTER}
Sleep, 400
Send,quit {ENTER}

return

;========================================================
CALCULAR_FIDELIDADE:

Gui,2: Add, Text, x72 y19 w80 h20 , Data de inicio, 
Gui,2: Add, DateTime, x142 y19 w100 h20 vDATAINICIO, %DATAINICIO% 
Gui,2: Add, Text, x72 y59 w70 h20 , Data de fim,  
Gui,2: Add, DateTime, x142 y59 w100 h20 vDATAFIM , %DATAFIM%
Gui,2: Add, Button, x60 y100 w180 h30 gCALCULAR_FIDELIDADE_A , Calcular fidelidade



; Generated using SmartGUI Creator for SciTE
Gui, 2: Show, w300 h150, HMC - Rede (fidelidade)
return

CALCULAR_FIDELIDADE_A:
DATAFIM2 := DATAFIM
DATAINICIO := SubStr(DATAINICIO, 1, 8)
DATAFIM := SubStr(DATAFIM, 1, 8)
EnvSub, DATAFIM, %DATAINICIO%, days


DATAFIM := 365 - DATAFIM
Valor := 1.8 * DATAFIM
Reais := SubStr(Valor, 1, 3) 
Centavos := SubStr(Valor, 5, 2) 
dia :=SubStr(DATAFIM2, 7, 2)
mes := SubStr(DATAFIM2, 5, 2)
ano := SubStr(DATAFIM2, 1, 4)
if(Reais > 100){
MsgBox, 64, Valor da Fidelidade!, O valor da fidelidade a ser cobrado até a data %dia%`/%mes%`/%ano% é R$%Reais%`,%Centavos%
}
if(Reais < 100 and Reais > 10){
Reais := SubStr(Valor, 1, 2) 
Centavos := SubStr(Valor, 4, 2)
MsgBox, 64, Valor da Fidelidade!, O valor da fidelidade a ser cobrado até a data %dia%`/%mes%`/%ano% é R$%Reais%`,%Centavos%
}
if(Reais < 10){
Reais := SubStr(Valor, 1, 1) 
Centavos := SubStr(Valor, 3, 2) 
MsgBox, 64, Valor da Fidelidade!, O valor da fidelidade a ser cobrado até a data  %dia%`/%mes%`/%ano% é R$%Reais%`,%Centavos%
}




MsgBox,%DATAINICIO% E %DATAFIM2%
return


verifica_entrada(UserInput,"Digite a data de inicio do plano!","Digite a data de inicio do plano. `n`nEx: 01/02/2020")
data_inicio = %dado%
data_inicio := SubStr(data_inicio, 7, 4) . SubStr(data_inicio, 4, 2) . SubStr(data_inicio, 1, 2) 
DATA_ATUAL := A_YYYY . A_MM . A_DD
EnvSub, DATA_ATUAL, %data_inicio%, days
DATA_ATUAL := 365 - DATA_ATUAL
Valor := 1.8 * DATA_ATUAL
Reais := SubStr(Valor, 1, 3) 
Centavos := SubStr(Valor, 5, 2) 
dia :=A_DD
mes := A_MM
ano := A_YYYY
if(Reais > 100){
MsgBox, 64, Valor da Fidelidade!, O valor da fidelidade a ser cobrado até hoje %dia%`/%mes%`/%ano% é R$%Reais%`,%Centavos%
}
if(Reais < 100 and Reais > 10){
Reais := SubStr(Valor, 1, 2) 
Centavos := SubStr(Valor, 4, 2)
MsgBox, 64, Valor da Fidelidade!, O valor da fidelidade a ser cobrado até hoje %dia%`/%mes%`/%ano% é R$%Reais%`,%Centavos%
}
if(Reais < 10){
Reais := SubStr(Valor, 1, 1) 
Centavos := SubStr(Valor, 3, 2) 
MsgBox, 64, Valor da Fidelidade!, O valor da fidelidade a ser cobrado até hoje %dia%`/%mes%`/%ano% é R$%Reais%`,%Centavos%
}
return
;========================================================
CALCULAR_PROPORCIONAL:
dia :=A_DD
mes := A_MM
ano := A_YYYY

verifica_entrada(UserInput,"Digite o valor do plano!","Digite o valor do plano. `n`nEx: 79.90")
Valor = %dado%

Valor := (valor/30)* A_DD

Reais := SubStr(Valor, 1, 3) 
Centavos := SubStr(Valor, 5, 2) 
if(Reais > 100){
MsgBox, 64, Valor do proporcional!, O valor do proporcional a ser cobrado até hoje %dia%`/%mes%`/%ano% é R$%Reais%`,%Centavos%
}
if(Reais < 100 and Reais > 10){
Reais := SubStr(Valor, 1, 2) 
Centavos := SubStr(Valor, 4, 2)
MsgBox, 64, Valor do proporcional!, O valor do proporcional a ser cobrado até hoje %dia%`/%mes%`/%ano% é R$%Reais%`,%Centavos%
}
if(Reais < 10){
Reais := SubStr(Valor, 1, 1) 
Centavos := SubStr(Valor, 3, 2) 

MsgBox, 64, Valor do proporcional!, O valor do proporcional a ser cobrado até hoje %dia%`/%mes%`/%ano% é R$%Reais%`,%Centavos%
}

return

;========================================================
^'::
; -- Finaliza Scrtip --
MsgBox, 0 , PARADO COM SUCESSO, PARADO COM SUCESSO.
Reload
Return
;========================================================
GuiClose:
;--finaliza tudo com o x--
ExitApp
Return
;========================================================


;========================================================
;========================================================
;========================================================

; -- funções --
cancel(UserInput){
if (UserInput =""){
MsgBox, 0 , ESTE CAMPO NÃO PODE SER VAZIO, Script Parado!
Reload
}Else{
return 
}}
;===================================================
verifica_janela(){
if WinActive("Prompt de Comando") or WinActive("172.18.") or WinActive("OpenSSH SSH") or WinActive("Selecionar OpenSSH S"){
	return	
	}Else{
		MsgBox, 0 , Clique no PUTTY ou CMD
		Sleep, 2000
		verifica_janela()
	     }

return


}
;===================================================


verifica_entrada(UserInput,string,string2){


while(UserInput =""){
InputBox, UserInput, %string%,%string2%,,400,300,,,,
dado =%UserInput%
if ErrorLevel{
    MsgBox, Processo Cancelado!.
    reload
}
}
  

return dado
}
;===================================================
ativarconsole(){
if WinExist("172.18.3.18") or WinExist("OpenSSH SSH client") or WinExist("Selecionar OpenSSH SSH client") {

WinActivate, 172.18.3.18
WinActivate, OpenSSH SSH client
WinActivate,Selecionar OpenSSH SSH client
if WinActive("172.18.3.18"){
limpa()
}

if WinActive("OpenSSH SSH client"){
limpa()
}

if WinActive("Selecionar OpenSSH SSH client"){
limpa()
}


}Else{
	MsgBox, 0 , IMPORTANTE!, Certifique que tem um PUTTY ou CMD ABERTO!
	ativarconsole()
	}
}
limpa(){
Send, {BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}{BackSpace}
return
}


;=======================================================
ativarconsole_juniper(){
if WinExist("172.18.1.146 - PuTTY") or WinExist("OpenSSH SSH client") or WinExist("Selecionar OpenSSH SSH client") {

WinActivate, 172.18.1.146 - PuTTY
if WinActive("172.18.1.146 - PuTTY"){
limpa()
}



}Else{
	MsgBox, 0 , IMPORTANTE!, Certifique que tem um PUTTY ou CMD ABERTO!
	ativarconsole_juniper()
	}
}