\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 142, printed p. 117.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 190\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne f'2^\markup { \bold "Gem." }( g'2) \bar "|" e'1 \bar "|" e'1 \bar "||" c''2^\markup { \bold "Chor." }( d''2) \bar "|" c''2 \bar "|" a'4 c''4 \bar "|" c''2 a'2 }
      \new Voice { \voiceTwo d'2~ d'2~ d'4( c'4 b2) b1 g'1 e'2 f'4 f'4 e'2 f'2 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t E \skip 1 lei "son!" Chri -- \skip 1 "ste," wahr -- rer Gott und }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne a2( b2) a2. gis8[ fis8] gis!1 e'4( c'2 b4) c'2 c'4 a4 g2 d'2 }
      \new Voice { \voiceTwo d2( g,2) a,2( e2) e1 c2( g2) c2 f4 f4 c2 d2 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
