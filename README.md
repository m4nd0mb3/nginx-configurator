<center>

![nginx-conig](nginx-conig.png)

</center>

##### "Maximize o Desempenho, Minimize a Complexidade com Nginx!"

# Nginx Configurator

Este repositório contém scripts e ferramentas para facilitar a configuração de novos sites no servidor Nginx. Com essas ferramentas, você pode configurar sites para atuar como proxy reverso ou para servir arquivos estáticos.

## Pré-requisitos

Certifique-se de ter o Nginx instalado no seu sistema antes de usar essas ferramentas.

## Como Usar

1. Clone este repositório:

    ```bash
    git clone https://github.com/m4nd0mb3/nginx-configurator.git
    cd nginx-configurator
    ```

2. Execute o script de configuração:

    ```bash
    bash configure-site.sh
    ```

    Ou

    - `make install`: Para copiar o script para `/bin` e torná-lo executável.
    - `make uninstall`: Para remover o script de `/bin`.

    Basta executar `make install` após modificar o script e `make uninstall` se precisar remover o script. 

3. Siga as instruções para configurar o site desejado.

---

### 🚀 Etapas sugeridas de melhoria

| O que fazer | Como ajuda |
|----|----|
| `install.sh` para download automático | Instala rápida via `curl | sh` |
| Criar **Release** no GitHub | URLs estáveis (`releases/tag/vX.Y.Z`) para download de scripts/binaries |
| Adequação do Makefile | Permite publicar releases facilmente |
| Verificação pós instalação | Confirma que o comando está no `$PATH` e executável |
| Mensagens amigáveis | Usuário entende se `sudo` é necessário ou há erro de permissão |

---

### Exemplo de uso final

```bash
curl -fsSL https://raw.githubusercontent.com/m4nd0mb3/nginx-configurator/develop/install.sh | sh

```
Ou com wget:
```bash
wget -qO- https://raw.githubusercontent.com/m4nd0mb3/nginx-configurator/develop/install.sh | sh
```

## Opções Disponíveis

- **Proxy Reverso**: Configure um site para atuar como proxy reverso para uma aplicação web.
- **Servidor de Arquivos Estáticos**: Configure um site para servir arquivos estáticos.

## Contribuição

Sinta-se à vontade para contribuir com melhorias ou correções de bugs. Abra uma issue ou envie um pull request.

## Licença

Este projeto está licenciado sob a [Apache License 2.0](LICENSE).
