\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 141, printed p. 116.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 170\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne g'4 f'4 e'2 \bar "|" d'2 r4 d'4 \bar "|" e'4 f'4 g'2 \bar "|" a'2 a'4 g'4 \bar "|" f'4 e'4 fis'2 \bar "|" g'2 \bar "||" }
      \new Voice { \voiceTwo d'4 d'4 cis'2 d'2 s4 a4 c'4 c'4 b2 c'2 c'4 c'4 a4 c'4 d'2 d'2 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t du ge -- bo -- ren von Ma -- ri -- "a," er -- bar -- me dich ü -- ber "uns!" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne b4 a4 a2 a2 r4 g4 g4 a4 d2 g2 g4 f4 g4 a4 a2 b2 }
      \new Voice { \voiceTwo g,4 d4 a,2 d2 s4 d4 c4 a,4 g,2 f,2 a,4 c4 d4 f4 d2 g,2 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
