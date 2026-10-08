# Publicação — mastermaiolo/mastermaiolo

Este diretório é o seu **Profile README** pronto. O GitHub ainda não mostra nada
no seu perfil porque o repositório especial `mastermaiolo/mastermaiolo` não existe —
siga os passos abaixo.

## 1 · Criar o repositório especial

1. https://github.com/new → **Repository name: `mastermaiolo`** (idêntico ao username)
2. **Public** · marque **Add a README file** · Create

## 2 · Subir os arquivos

No clone local do repo recém-criado, copie desta pasta:

```text
mastermaiolo/
├── README.md                  ← o compositor
├── assets/                    ← SVGs finais (hero, cards, painéis, footer) + art/
├── templates/                 ← fontes .tpl dos SVGs (para futuras edições)
├── scripts/                   ← build_assets.py · generate_telemetry.py · langbar.py
└── .github/workflows/profile.yml   ← refresh diário da telemetria
```

```sh
git add -A
git commit -m "profile ui — systems lab 黑石"
git push
```

Pronto: https://github.com/mastermaiolo passa a exibir a página.

## 3 · Ativar a telemetria viva

- A Action `profile · telemetry` roda 1×/dia e pode ser disparada manualmente em
  **Actions → profile · telemetry → Run workflow**.
- Ela reescreve apenas `assets/panel-telemetry.svg` e `assets/panel-signal.svg`
  com **seus dados públicos reais** (repos, linguagens por bytes, pushes, sparklines
  de 14 e 90 dias). Zero widgets de terceiros, zero trackers.

## 4 · Regenerar arte / SVGs localmente

```sh
pip install Pillow
python3 scripts/build_assets.py      # templates/*.tpl + assets/art/*.png → assets/*.svg
python3 scripts/make_preview.py      # preview-page.png da página inteira
```

Troque os PNGs em `assets/art/` e rode o build para trocar a arte sem tocar no layout.

## Notas de arquitetura

- **Sistema de design: 手卷 (shǒu juàn, "rolo de mão")** — a página é lida como um
  rolo de pintura chinesa que se desenrola: fundo `#0d1117` (idêntico ao dark mode
  do GitHub, então os SVGs se fundem à página), arte de nanquim sangrando sem
  molduras, e **um único acento de cor** em todo o sistema (o carmesim
  selo/eclipse). Cada projeto é distinguido por uma composição de tinta própria
  — olho (HyprVision), ondulações 水波 (Hypr.AI), fio de vinho servido de uma
  jarra ritual (Vinho Lab), monólito e dragão (Heishi) — não por uma cor.
- **Sem CSS/JS** — todo o visual vive dentro dos SVGs (funcionam dentro de `<img>`,
  que é o que o GitHub permite). As artes de tinta vão embutidas em base64 dentro
  dos próprios SVGs, portanto não há dependência externa que possa quebrar.
- **Micro-motion SMIL** — halo do eclipse respirando, estrelas piscando, cursor do
  terminal e pontos de sinal. O primeiro frame é sempre legível: se o renderer
  congelar animações, a arte continua perfeita parada.
- **Fontes** — stacks genéricas de sistema (`Georgia`, `ui-monospace`, e
  serif CJK: Songti/Noto Serif CJK/Source Han). Mac, Windows, Android e Linux
  renderizam os caracteres chineses nativamente.
- **Tema claro do GitHub** — os painéis são placas escuras autocontidas; em light
  mode a página fica "dark cards sobre papel branco" (decisão estética comum).
  Dá para gerar variantes light depois com `<picture>`, se quiser.
- **Vocabulário chinês** — 黑 (hēi, preto) + 黑石 (prenome do lab) · 大音希声 / 大象无形
  (Daodejing) no hero · 无为而无不为 no painel de filosofia · 黑龙/日食 no Heishi.

## Glossário dos ideogramas 汉字

Todos os caracteres chineses usados no perfil, e por quê:

| Onde | Caracteres | Pinyin | Significado |
|---|---|---|---|
| Hero (glifo gigante), selos | 黑 | hēi | **preto** — a raiz do nome *Heishi* |
| Selos vermelhos (印章), card Heishi, rodapé | 黑石 | hēi shí | **"pedra negra"** — transliteração de *Heishi*, usada como carimbo/assinatura do lab |
| Card Heishi, tile 4 da faixa visual | 黑龙 | hēi lóng | **dragão negro** |
| Card Heishi, tile 4 | 日食 | rì shí | **eclipse solar** |
| Card Heishi (linha "食 ECLIPSE") | 食 | shí | **"comer/devorar"** — é o mesmo 食 de 日食 (o eclipse como "devorar o sol"); também está no nome do repo `HEISHI.食.ARCHON` |
| Hero (coluna vertical à direita) | 大音希声 | dà yīn xī shēng | **"o maior som é quase silêncio"** — Daodejing, cap. 41 |
| Hero (continuação da coluna) | 大象无形 | dà xiàng wú xíng | **"a maior forma não tem forma"** — mescla do mesmo capítulo |
| Painel de filosofia | 无为而无不为 | wú wéi ér wú bù wéi | **"agindo sem forçar, nada fica por fazer"** — Daodejing; a versão chinesa de *"systems should disappear when they become intuitive"* |
| Trilha do painel de filosofia | 道 | dào | **o Caminho** |
| Rodapé | 水墨 | shuǐ mò | **"água-tinta"** — a técnica de pintura nanquim das artes |
| README (`<details>` LAB NOTES) | 试作 | shì zuò | **"trabalho experimental / protótipo"** |

Se quiser trocar qualquer um, é só editar o `templates/*.svg.tpl` correspondente e rodar o build.

## Personalizações rápidas

| Quer mudar… | Arquivo |
|---|---|
| Textos do hero, coordenadas, selos | `templates/hero.svg.tpl` → rebuild |
| Descrições/tags dos 4 cards | `templates/card-*.svg.tpl` → rebuild |
| Itens do CURRENT SIGNAL | `templates/panel-signal.svg.tpl` → rebuild |
| Frase da filosofia / poema | `templates/panel-philosophy.svg.tpl` → rebuild |
| Paleta da barra de linguagens | `scripts/langbar.py` (`PALETTE`) |
