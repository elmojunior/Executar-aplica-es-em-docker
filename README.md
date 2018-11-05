# Executar aplicações em Docker

Este código permite executar aplicações dentro de um container em modo gráfico. Crie uma imagem para Docker contendo as aplicações que você deseja executar, em seguida inicialize o container chamando a aplicação desejada.

## Dependências

- **Docker Community Edition:** para instalar o Docker siga as instruções contidas no link [https://docs.docker.com/install/](https://docs.docker.com/install/).

## Executando

1. Edite o arquivo **Dockerfile** na linha 5 e substitua _$APLICAÇÃO_ pela aplicação desejada. Os exemplos abaixo são utilizados para instalar o Mozilla Firefox.
  ```
  && apt install -y firefox \
  ```

2. Abra o terminal e execute o comando abaixo dentro da pasta onde o arquivo foi baixado, onde _mozillafirefox_ deve ser substituído pelo nome da imagem que você irá criar. Utilize letras minúsculas e sem espaço.
    ```shell
    $ docker build -t mozillafirefox .
    ```

3. Agora com a imagem criada, basta executá-la com o comando abaixo, onde _mozillafirefox_ se refere ao nome da imagem criada no passo anterior. Insira o comando que deseja executar, logo após o nome da imagem.
    ```shell
    $ docker run --rm -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix mozillafirefox firefox --new-instance
    ```

## Salvando

Ao fechar o firefox, o container será destruído junto com todas as informações contidas nele. Caso queira salvar alguma informação para a próxima vez que for executá-lo, deve-se adicionar um volume `-v pasta_local:pasta_container`, conforme o comando abaixo.

```shell
$ docker run --rm -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/Docker/MozillaFirefox:/home/dockeruser/.mozilla mozillafirefox firefox --new-instance
```
