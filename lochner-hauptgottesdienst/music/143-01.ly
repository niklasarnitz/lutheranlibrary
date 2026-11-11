\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 143, printed p. 118.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 190\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne g'2^\markup { \bold "Chor." } b'2 \bar "|" c''1 \bar "|" d''2 e''4 d''4 \bar "|" b'2 d''2 \bar "|" c''2 b'4 a'4 \bar "|" g'2 a'2 }
      \new Voice { \voiceTwo d'2 g'2 g'1 g'2 g'4 fis'4 g'2 g'2 g'2 g'4 fis'4 e'2 c'4( d'4) }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t Ky -- ri -- "e," Hei -- li -- ger "Geist," mit Va -- ter und Sohn Ein }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne b2 d'2 e'2 c'2~ c'4( b4) c'4 a4 g2 r4 d'4 e'2 d'4 d'4 b2 a2 }
      \new Voice { \voiceTwo g2 g2 a,2 s2 g2 c4 d4 e2 b,2 c2 g,4 d4 e2 fis2 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
