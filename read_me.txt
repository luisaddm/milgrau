## Versão milgrau:
scripts atualizados set24 (laser de 100Hz 3000 shots; html com imgs de 5,15,30km)


## Como entrar no servidor:
O comando no Linux é: 
ssh -X -p 443 -i $HOME/.ssh/id_rsa-gescon -X gescon.ipen.br 
(ou ssh -X -p 443 -i $HOME/.ssh/id_rsa-gescon -X lealsite@gescon.ipen.br)

O parâmetro -p 443 indica a porta, o parâmetro -i $HOME/.ssh/id_rsa-gescon indica a chave de conexão.

Vc deve informar a chave secreta no momento do login. O SSH vai te pedir a passphrase que é: Senha Para Leal Site
Digite deste jeito, respeitando maiúsculas e os espaços.
  
Pegue o arquivo .zip anexado, extraia as chaves. Coloque os nomes id_rsa-gescon e id_rsa-gescon.pub
Se vc estiver utilizando uma máquina Linux, estas chaves deverão ficar no diretório ~/.ssh
