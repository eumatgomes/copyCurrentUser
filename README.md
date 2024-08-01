<h1 align="center"> COPIAR ARQUIVOS XML </h1>
<h4 align="center">Script PowerShell que copia os arquivos .XML de 25 caracteres numéricos dentro de uma pasta e cola dentro da rede automaticamente.</h4> 
<h1></h1>
<div>
  <h3 align="center">⚠ ATENÇÃO ⚠</h3>
  <h4 align="center">	🚧 USO EXCLUSIVO PARA O MICROSOFT INTUNE 🚧</h4>
</div>
<h1></h1>
<DIV align="center"><img src="https://user-images.githubusercontent.com/107892746/198664504-88c97247-474b-4ef2-903c-6eb2119df615.png" width="5%">
  <h3>COMO UTILIZAR CADA SCRIPT</h3>
</div>
<details>
  <summary>copyFileNFE1</summary>
<h4>Este é o script principal. É através dele que as pastas serão copiadas. Como verificar:</h4>

- Sempre que iniciar com # pode ser trocado;

- Manter ele com o atributo de oculto, assim não corre perigo de algum usuário excluir por engano;

- O uso do $currentusername vai pegar o usuário que está utilizando a máquina no momento, sendo assim, não necessário trocar usuário;

- O $registroArquivo irá criar um arquivo log informando quais documentos foram copiados com sucesso;

- O $arquivosParaCopiar irá percorrer por todas as pastas dentro do usuário ativo no momento e pegará todos os arquivos com a extensão .XML que foram criados nos últimos 10 minutos, que contém 25 caracteres sendo eles numéricos e que não exista dentro da pasta $destino e fará a cópia;

- A função while fará o script rodar a cada 2 minutos;
</details>
<details>
  <summary>taskCopyFileNFE1</summary>
<h4>Executar este script como Administrador ou inserir nas regras do Intune. Quando executado, ele criará uma tarefa no Agendador de Tarefas nomeado de Copiar Arquivos XML com os atributos abaixo: </h4>
  
- Executar estando o usuário conectado ou não;
  
- Executar com privilégios mais altos;

- Assim que o sistema for inicializado;

- Inicia o script copyFileNFE1.ps1 que se encontra na pasta C:\;

- Interromper a tarefa se ela for executada por mais de 99999 dias;
</details>

<h1></h1>
