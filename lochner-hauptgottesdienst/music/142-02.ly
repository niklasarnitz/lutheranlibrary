\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 142, printed p. 117.
% On “ter”, the two bass stems appear to share the A3 head. This unison is provisional.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 170\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \time 4/4 \cadenzaOn
      \new Voice = "sung" { \voiceOne g'2^\markup { \bold "Chor." }( a'2 \bar "|" c''4) a'4 a'2 \bar "|" c''2 r4 c''4~ \bar "|" c''4 c''4 c''2 \bar "|" b'2 g'4 a'4 \bar "|" g'2 e'2 }
      \new Voice { \voiceTwo e'2( f'2 g'4) f'4 f'2 g'2 s4 g'4~ g'4 e'4 e'2 g'2 e'4 f'4 d'2 cis'2 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t Ky -- \skip 1 \skip 1 ri -- "e," "Gott," al -- \skip 1 ler Welt Schöp -- fer und Va -- "ter," }
    \new Staff <<
      \clef bass \time 4/4 \cadenzaOn
      \new Voice { \voiceOne b2( d'2 e'4) c'4 c'2 e'2 r4 e'4~ e'4 c'4 c'2 d'2 c'4 c'4 b2 a2 }
      \new Voice { \voiceTwo e2( d2 c4) f4 f2 c2 s4 c4~ c4 c4 a,2 g,2 c4 f4 g2 a2 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
