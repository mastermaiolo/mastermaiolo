<svg xmlns="http://www.w3.org/2000/svg" width="1600" height="660" viewBox="0 0 1600 660" font-family="ui-monospace,'SF Mono',Menlo,Consolas,monospace">
  <defs>
    <linearGradient id="scrimL" x1="0" y1="0" x2="1" y2="0">
      <stop offset="0" stop-color="#0d1117"/>
      <stop offset="0.55" stop-color="#0d1117" stop-opacity="0.82"/>
      <stop offset="1" stop-color="#0d1117" stop-opacity="0"/>
    </linearGradient>
    <linearGradient id="scrimB" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0" stop-color="#0d1117" stop-opacity="0"/>
      <stop offset="1" stop-color="#0d1117" stop-opacity="0.8"/>
    </linearGradient>
    <linearGradient id="scrimT" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0" stop-color="#0d1117" stop-opacity="0.55"/>
      <stop offset="1" stop-color="#0d1117" stop-opacity="0"/>
    </linearGradient>
    <radialGradient id="eclipseGlow" cx="0.5" cy="0.5" r="0.5">
      <stop offset="0.55" stop-color="#ff3b2d" stop-opacity="0.5"/>
      <stop offset="1" stop-color="#ff3b2d" stop-opacity="0"/>
    </radialGradient>
    <clipPath id="artClip"><rect x="760" y="64" width="776" height="556"/></clipPath>
  </defs>

  <rect width="1600" height="660" fill="#0d1117"/>

  <!-- ── ink artwork ─────────────────────────────────────────── -->
  <g clip-path="url(#artClip)">
    <image href="@@ART_HERO@@" x="760" y="64" width="776" height="556" preserveAspectRatio="xMidYMid slice"/>
    <circle cx="1417" cy="173" r="98" fill="url(#eclipseGlow)">
      <animate attributeName="opacity" values="0.25;0.5;0.25" dur="6.5s" repeatCount="indefinite"/>
    </circle>
    <rect x="760" y="64" width="420" height="556" fill="url(#scrimL)"/>
    <rect x="760" y="400" width="776" height="220" fill="url(#scrimB)"/>
    <rect x="760" y="64" width="776" height="100" fill="url(#scrimT)"/>
  </g>

  <!-- twinkling particles -->
  <g fill="#ffffff">
    <circle cx="862" cy="130" r="1.7"><animate attributeName="opacity" values="0.25;0.95;0.25" dur="4.2s" repeatCount="indefinite"/></circle>
    <circle cx="980" cy="238" r="1.3"><animate attributeName="opacity" values="0.2;0.8;0.2" dur="5.4s" begin="1.1s" repeatCount="indefinite"/></circle>
    <circle cx="820" cy="296" r="1.2"><animate attributeName="opacity" values="0.2;0.75;0.2" dur="6.1s" begin="2.3s" repeatCount="indefinite"/></circle>
  </g>

  <!-- ── top nav ─────────────────────────────────────────────── -->
  <circle cx="90" cy="29" r="11" fill="none" stroke="#3a3a42" stroke-width="1.4"/>
  <circle cx="90" cy="29" r="3" fill="#d43a2f"/>
  <text x="112" y="34" font-size="15" letter-spacing="1" fill="#b9b9c0">mastermaiolo<tspan fill="#55555d">  /  README.md</tspan></text>
  <text x="1476" y="34" text-anchor="end" font-size="14" letter-spacing="2.5" fill="#5c5c64">SYSTEMS / INTERFACES / AI / EXPERIMENTS</text>
  <circle cx="1500" cy="29" r="4" fill="#d43a2f">
    <animate attributeName="opacity" values="1;0.35;1" dur="2.6s" repeatCount="indefinite"/>
  </circle>
  <line x1="0" y1="56" x2="1600" y2="56" stroke="#232329" stroke-width="1"/>

  <!-- ── left ornament rail ──────────────────────────────────── -->
  <line x1="64" y1="92" x2="64" y2="620" stroke="#1e1e22" stroke-width="1"/>
  <rect x="62.4" y="118" width="3.2" height="34" fill="#b3372c"/>
  <text x="38" y="560" font-size="10.5" letter-spacing="3" fill="#45454d" transform="rotate(-90 38 560)">EST. MMXXVI · BRAGANÇA</text>
  <g stroke="#33333a" stroke-width="1.2" fill="none">
    <circle cx="64" cy="616" r="12"/>
    <line x1="64" y1="598" x2="64" y2="634"/>
    <line x1="46" y1="616" x2="82" y2="616"/>
  </g>

  <!-- ── identity block ──────────────────────────────────────── -->
  <text x="120" y="300" font-family="'Songti SC','Noto Serif CJK SC','Source Han Serif SC',STSong,serif" font-size="185" fill="#eceae6">黑</text>
  <rect x="120" y="322" width="64" height="3" fill="#b3372c"/>
  <text x="120" y="352" font-size="11" letter-spacing="4" fill="#55555d">HĒI — BLACK</text>

  <!-- seal over glyph corner -->
  <rect x="272" y="262" width="46" height="46" rx="5" fill="#a93226"/>
  <text x="295" y="281" text-anchor="middle" font-family="'Songti SC','Noto Serif CJK SC','Source Han Serif SC',STSong,serif" font-size="18" fill="#f6e9dd">黑</text>
  <text x="295" y="300" text-anchor="middle" font-family="'Songti SC','Noto Serif CJK SC','Source Han Serif SC',STSong,serif" font-size="18" fill="#f6e9dd">石</text>

  <line x1="380" y1="128" x2="380" y2="330" stroke="#2a2a2e" stroke-width="1"/>

  <text x="418" y="238" font-family="Georgia,'Times New Roman',serif" font-size="92" letter-spacing="16" fill="#eeeeea">MAGGIO</text>
  <text x="420" y="284" font-size="15" letter-spacing="5" fill="#7d7d85">SYSTEMS / INTERFACES / AI / COMPUTATION</text>
  <text x="420" y="340" font-family="Georgia,'Times New Roman',serif" font-size="27" fill="#b9b9c0">I build software where engineering,</text>
  <text x="420" y="374" font-family="Georgia,'Times New Roman',serif" font-size="27" fill="#b9b9c0">visual systems and unusual ideas overlap.</text>

  <rect x="420" y="428" width="42" height="2.5" fill="#b3372c"/>
  <text x="482" y="439" font-size="14" letter-spacing="2" fill="#5c5c64">+ ◆ +</text>
  <circle cx="604" cy="433" r="3.5" fill="#d43a2f">
    <animate attributeName="r" values="3.5;5.5;3.5" dur="2.8s" repeatCount="indefinite"/>
    <animate attributeName="opacity" values="1;0.4;1" dur="2.8s" repeatCount="indefinite"/>
  </circle>
  <text x="620" y="439" font-size="14" letter-spacing="2" fill="#7d7d85">41.8067° N · 6.7567° W</text>

  <!-- ── right rail ──────────────────────────────────────────── -->
  <g font-size="14" letter-spacing="3.5">
    <g fill="#0d1117" opacity="0.55">
      <rect x="1324" y="313" width="128" height="24" rx="3"/>
      <rect x="1324" y="361" width="128" height="24" rx="3"/>
      <rect x="1324" y="409" width="128" height="24" rx="3"/>
      <rect x="1324" y="457" width="128" height="24" rx="3"/>
    </g>
    <g fill="#9c9ca4">
      <text x="1332" y="330" fill="#e3e3e8">BUILD</text>
      <text x="1332" y="378">EXPLORE</text>
      <text x="1332" y="426">ITERATE</text>
      <text x="1332" y="474">REPEAT</text>
    </g>
    <rect x="1308" y="323" width="14" height="1.6" fill="#b3372c"/>
    <rect x="1308" y="371" width="14" height="1.6" fill="#3c3c44"/>
    <rect x="1308" y="419" width="14" height="1.6" fill="#3c3c44"/>
    <rect x="1308" y="467" width="14" height="1.6" fill="#3c3c44"/>
  </g>

  <!-- vertical cjk aphorism -->
  <g font-family="'Songti SC','Noto Serif CJK SC','Source Han Serif SC',STSong,serif" font-size="25" fill="#dddad4" opacity="0.85" stroke="#0d1117" stroke-width="2.5" paint-order="stroke" stroke-opacity="0.6">
    <text x="1493" y="126">大</text><text x="1493" y="162">音</text>
    <text x="1493" y="198">希</text><text x="1493" y="234">声</text>
    <text x="1493" y="270" opacity="0.45">·</text>
    <text x="1493" y="306">大</text><text x="1493" y="342">象</text>
    <text x="1493" y="378">无</text><text x="1493" y="414">形</text>
  </g>

  <!-- seal bottom-right -->
  <rect x="1472" y="556" width="44" height="44" rx="5" fill="#a93226"/>
  <text x="1494" y="575" text-anchor="middle" font-family="'Songti SC','Noto Serif CJK SC','Source Han Serif SC',STSong,serif" font-size="17" fill="#f6e9dd">黑</text>
  <text x="1494" y="594" text-anchor="middle" font-family="'Songti SC','Noto Serif CJK SC','Source Han Serif SC',STSong,serif" font-size="17" fill="#f6e9dd">石</text>
</svg>
