<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1600 560" font-family="ui-monospace,'SF Mono',Menlo,Consolas,monospace">
  <defs>
    <linearGradient id="areaG" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0" stop-color="#6b6b73" stop-opacity="0.25"/>
      <stop offset="1" stop-color="#6b6b73" stop-opacity="0"/>
    </linearGradient>
  </defs>

  <rect width="1600" height="560" fill="#0d1117"/>

  <rect x="20" y="32" width="3.5" height="18" fill="#b3372c"/>
  <text x="34" y="46" font-size="15" letter-spacing="4" fill="#dcdce2">LAB TELEMETRY</text>
  <text x="34" y="68" font-size="12" letter-spacing="1.5" fill="#5c5c64">github activity · public signal · no third-party widgets</text>
  <circle cx="1320" cy="42" r="3" fill="#d43a2f">
    <animate attributeName="opacity" values="1;0.3;1" dur="2.8s" repeatCount="indefinite"/>
  </circle>
  <text x="1580" y="46" text-anchor="end" font-size="10.5" letter-spacing="2" fill="#3f3f46">REFRESHED VIA GITHUB ACTIONS</text>
  <line x1="20" y1="88" x2="1580" y2="88" stroke="#1e1e22"/>

  <!-- stat cells -->
  <g>
    <text x="40" y="132" font-size="12" letter-spacing="2.5" fill="#55555d">PUBLIC REPOSITORIES</text>
    <text x="40" y="206" font-family="Georgia,'Times New Roman',serif" font-size="72" fill="#e8e6e2">@@STAT_REPOS@@</text>
    <text x="40" y="240" font-size="12" letter-spacing="1.5" fill="#5c5c64">latest · hyprlink (rust)</text>

    <line x1="400" y1="112" x2="400" y2="252" stroke="#1e1e22"/>

    <text x="440" y="132" font-size="12" letter-spacing="2.5" fill="#55555d">LANGUAGES</text>
    <text x="440" y="206" font-family="Georgia,'Times New Roman',serif" font-size="72" fill="#e8e6e2">@@STAT_LANGS@@</text>
    <text x="440" y="240" font-size="12" letter-spacing="1.5" fill="#5c5c64">rust · python · typescript lead</text>

    <line x1="800" y1="112" x2="800" y2="252" stroke="#1e1e22"/>

    <text x="840" y="132" font-size="12" letter-spacing="2.5" fill="#55555d">PUSHES / 90 DAYS</text>
    <text x="840" y="206" font-family="Georgia,'Times New Roman',serif" font-size="72" fill="#e8e6e2">@@STAT_PUSHES@@</text>
    <text x="840" y="240" font-size="12" letter-spacing="1.5" fill="#5c5c64">public events window</text>

    <line x1="1200" y1="112" x2="1200" y2="252" stroke="#1e1e22"/>

    <text x="1240" y="132" font-size="12" letter-spacing="2.5" fill="#55555d">LAST SIGNAL</text>
    <text x="1240" y="200" font-family="Georgia,'Times New Roman',serif" font-size="44" fill="#e8e6e2">@@STAT_LAST@@</text>
    <text x="1240" y="240" font-size="12" letter-spacing="1.5" fill="#5c5c64">push → main</text>
  </g>
  <line x1="20" y1="272" x2="1580" y2="272" stroke="#1e1e22"/>

  <!-- activity sparkline -->
  <text x="40" y="312" font-size="12" letter-spacing="2.5" fill="#55555d">ACTIVITY / 90 DAYS</text>
  <text x="1560" y="312" text-anchor="end" font-size="10.5" letter-spacing="2" fill="#3f3f46">events · pushes · releases</text>
  <g transform="translate(40 330) scale(4.47 1.55)">
    <polygon points="@@SPARK90@@ 340,52 0,52" fill="url(#areaG)" stroke="none"/>
    <polyline points="@@SPARK90@@" fill="none" stroke="#8a8a93" stroke-width="1.1"/>
  </g>
  <line x1="40" y1="412" x2="1580" y2="412" stroke="#1e1e22"/>
  <g fill="#55555d" font-size="10.5" letter-spacing="1.5">
    <text x="40" y="434">−90d</text>
    <text x="800" y="434" text-anchor="middle">−45d</text>
    <text x="1580" y="434" text-anchor="end">now</text>
  </g>

  <!-- languages bar (real byte share, /languages api) -->
  <text x="40" y="478" font-size="12" letter-spacing="2.5" fill="#55555d">LANGUAGES / BYTES</text>
  @@LANG_BARS@@
  @@LANG_LABELS@@
</svg>
