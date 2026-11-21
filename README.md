# YoutubeCraftBridge Resource Pack

Resource Pack do plugin YoutubeCraftBridge para Minecraft Java 26.3.

## Conteúdo

- Textura do Bot Assassino.
- Post effects personalizados, ativados pelo servidor/plugin.

## Post effects

| Efeito | ID |
|---|---|
| Visão Distorcida | `youtubecraftbridge:visao_distorcida` |
| Visão de Túnel | `youtubecraftbridge:visao_de_tunel` |
| Afogamento | `youtubecraftbridge:afogamento` |
| Preto e Branco | `youtubecraftbridge:preto_e_branco` |
| Mundo Rubro | `youtubecraftbridge:mundo_rubro` |

Com o resource pack carregado, os efeitos podem ser testados no jogo com:

```mcfunction
/posteffect add @s youtubecraftbridge:visao_distorcida
/posteffect clear @s
```

Para testar outro efeito, substitua o ID pelo correspondente na tabela.

> Os efeitos são recursos do cliente. O jogador precisa ter o resource pack carregado para que o shader exista no jogo. O servidor pode solicitar a aplicação, mas não consegue garantir visualmente o resultado no cliente.
