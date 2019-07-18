<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/36623515-7293b4ec-18d3-11e8-85ab-4e2f8fb38fbd.png" width="320" alt="API Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/api-template">
        <img src="https://circleci.com/gh/vapor/api-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.1-brightgreen.svg" alt="Swift 4.1">
    </a>
</p>


# Todo TDC SP 2019

### Após clonar o projeto dentro da pasta raiz execute o comnando:

`swift package update`

### Quando finalizar a instalação das dependências execute o comando:

`open TodoTDC.xcodeproj`

### Build and Run no projeto =)



Use o postman para criar os primeiros registros:


[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/c8dc76e401bea412d275)

Nesta collection você encontra as chamadas basicas de criação de categoria e Todo bem como DELETE e GET

Exemplo de endpoint de chamada:

`http://127.0.0.1:8080/todos`


### Retorno 200:

```
[
    {
        "done": false,
        "id": 1,
        "title": "Finalizar apresentação TDC",
        "category": {
            "id": 1,
            "title": "Pessoal",
            "color": "#8e44ad"
        }
    }
]
```

# Target TodoTDS-iOS

Lembre de Editar o arquivo API/Endpoints.swift

`let base = "http://<seuip>:8080/"`

Caso você rode apenas no Simulador é possível manter localhost mas se for rodar no device é necessário atribuir a constate o valor do ip da maquina que está rodando a api.



# Obrigado


