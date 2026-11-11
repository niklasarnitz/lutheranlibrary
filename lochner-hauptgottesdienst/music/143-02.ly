\version "2.24.3"
% Lochner, Liedförmiges Kyrie. PDF scan 143, printed p. 118.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper { paper-width = 190\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \cadenzaOn
      \new Voice = "sung" { \voiceOne g'2 a'2^\markup { \bold "Gem." } \bar "|" a'4( b'4 a'2) \bar "|" g'1 \bar "||" g'2^\markup { \bold "Chor." }( b'4 c''4 \bar "|" d''4) d''4 d''2 \bar "|" e''2 d''4 d''4 }
      \new Voice { \voiceTwo e'2 e'2 fis'4( g'2 fis'4) d'1 g'1( fis'4) fis'4 fis'2 g'2 g'4 g'4 }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t "Gott," E -- lei \skip 1 \skip 1 "son!" Ky -- \skip 1 \skip 1 \skip 1 ri -- "e," hilf "uns," daß }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \cadenzaOn
      \new Voice { \voiceOne c'2 c'2 d'1 b1 b2( g2 a4) a4 a2 c'2 b4 b4 }
      \new Voice { \voiceTwo c2 a,2 d4( g,4 d2) g1 g2( e2 d4) d4 d2 c2 g4 g4 }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \autoBeamOff \remove "Bar_number_engraver" } }
}
